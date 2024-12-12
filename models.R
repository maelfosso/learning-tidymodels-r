source("splitting.R")

#######
# CREATE A MODEL
#######

linear_reg() %>% set_engine("lm") %>% translate()
linear_reg(penalty = 1) %>% set_engine("lm") %>% translate()
linear_reg(penalty = 1) %>% set_engine("glmnet") %>% translate()

lm_model <-
  linear_reg() %>% 
  set_engine("lm")

lm_form_fit <-
  lm_model %>% 
  fit(Sale_Price ~ Longitude + Latitude, data = ames_train)
lm_form_fit

lm_xy_fit <-
  lm_model %>%
  fit_xy(
    x = ames_train %>% select(Longitude, Latitude),
    y = ames_train %>% pull(Sale_Price)
  )
lm_xy_fit

lm_form_fit %>% extract_fit_engine()

lm_form_fit %>% extract_fit_engine() %>% vcov()
?vcov

model_res <- lm_form_fit %>% 
  extract_fit_engine() %>%
  summary()
model_res

param_est <- coef(model_res)
class(param_est)

tidy(lm_form_fit)

ames_test_small <- ames_test %>% slice(1:5)
predict(lm_form_fit, new_data = ames_test_small)

names(ames_test_small)
rownames(ames_test_small)

ames_test_small %>%
  select(Sale_Price) %>%
  bind_cols(predict(lm_form_fit, ames_test_small)) %>%
  bind_cols(predict(lm_form_fit, ames_test_small, type = "pred_int"))



tree_model %>% translate()

tree_fit <-
  tree_model %>%
  fit(Sale_Price ~ Longitude + Latitude, data = ames_train)
tree_fit

ames_test_small %>% 
  select(Sale_Price) %>%
  bind_cols(predict(tree_fit, ames_test_small))


# decision_tree_rpart_spec <-
#   decision_tree(tree_depth = tune(), min_n = tune(), cost_complexity = tune()) %>%
#   set_engine('rpart') %>%
#   set_mode('classification')
# 
# discrim_linear_MASS_spec <-
#   discrim_linear() %>%
#   set_engine('MASS')
# 
# discrim_quad_MASS_spec <-
#   discrim_quad() %>%
#   set_engine('MASS')
# 
# discrim_regularized_klaR_spec <-
#   discrim_regularized(frac_common_cov = tune(), frac_identity = tune()) %>%
#   set_engine('klaR')
# 
# logistic_reg_glm_spec <-
#   logistic_reg() %>%
#   set_engine('glm')
# 
# naive_Bayes_naivebayes_spec <-
#   naive_Bayes(smoothness = tune(), Laplace = tune()) %>%
#   set_engine('naivebayes')
# 
# nearest_neighbor_kknn_spec <-
#   nearest_neighbor(neighbors = tune(), weight_func = tune(), dist_power = tune()) %>%
#   set_engine('kknn') %>%
#   set_mode('classification')
# 
# svm_linear_kernlab_spec <-
#   svm_linear(cost = tune(), margin = tune()) %>%
#   set_engine('kernlab') %>%
#   set_mode('classification')
# 
# svm_poly_kernlab_spec <-
#   svm_poly(cost = tune(), degree = tune(), scale_factor = tune(), margin = tune()) %>%
#   set_engine('kernlab') %>%
#   set_mode('classification')
# 
# svm_rbf_kernlab_spec <-
#   svm_rbf(cost = tune(), rbf_sigma = tune(), margin = tune()) %>%
#   set_engine('kernlab') %>%
#   set_mode('classification')
# 
# 
