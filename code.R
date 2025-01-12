library(tidymodels)
tidymodels_prefer()

data(ames, package = "modeldata")
ames <- ames %>% mutate(Sale_Price = log10(Sale_Price))

set.seed(502)
ames_split <- initial_split(ames, prop = 0.80, strata = Sale_Price)
ames_train <- training(ames_split)
ames_test <- testing(ames_split)

linear_reg() %>% set_engine("lm")
