library(tidymodels)
tidymodels_prefer()

data(ames, package = "modeldata")

dim(ames)

#####
# EXPLORING FEATURES OF HOMES IN AMES
#####

ggplot(ames, aes(x = Sale_Price)) +
  geom_histogram(bins = 50, col = "white")

ggplot(ames, aes(x = Sale_Price)) + 
  geom_boxplot()
median(ames$Sale_Price)
max(ames$Sale_Price)

ggplot(ames, aes(x = Sale_Price)) +
  geom_histogram(bins = 50, col = "white") +
  scale_x_log10()

ames <- ames %>% mutate(Sale_Price = log10(Sale_Price))
