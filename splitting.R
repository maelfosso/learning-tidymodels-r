source("ames.R")

####
# COMMON METHODS FOR SPLITTING DATA
####
# set.seed(1)
# 
# ames_split <- initial_split(ames, prop = 0.80)
# ames_split
# names(ames_split)
# 
# ames_train <- training(ames_split)
# ames_test <- testing(ames_split)
# dim(ames_train)
# dim(ames_test)

set.seed(502)
ames_split <- initial_split(ames, prop = 0.80, strata = Sale_Price)
ames_train <- training(ames_split)
ames_test <- testing(ames_split)

dim(ames_train)
dim(ames_test)

# set.seed(52)
# ames_val_split <- initial_validation_split(ames, prop = c(0.6, 0.2))
# ames_val_split
# ames_train <- training(ames_val_split)
# ames_test <- testing(ames_val_split)
# ames_val <- validation(ames_val_split)


#######
# MULTILEVEL DATA
#######
