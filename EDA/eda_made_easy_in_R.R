library(tidyverse)

data <- read_csv("/Users/anni/dev/07_BewTool/07_SmarteBewaesserung/EDA/soilrain.csv")

cor(data$cbar20cm, data$temp2m, method = c("pearson", "kendall", "spearman"))

smp_size <- floor(0.75 * nrow(data))

## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(data)), size = smp_size)

train <- data[train_ind, ]
test <- data[-train_ind, ]

model7 <- lm(train$cbar20cm ~ train$temp2m + train$sliding7)
summary(model7)

model13 <- lm(train$cbar20cm ~ train$temp2m + train$sliding13)
summary(model13)

model20 <- lm(train$cbar20cm ~ train$temp2m + train$sliding20)
summary(model20)

model25 <- lm(train$cbar20cm ~ train$temp2m + train$sliding25)
summary(model25)

model252 <- lm(train$cbar20cm ~ train$tempslide7 / train$sliding25)
summary(model252)

model30 <- lm(train$cbar20cm ~ train$temp2m + train$sliding30)
summary(model30)


p <- predict(model25, test)

ggplot(test) +
  geom_point(aes(x=cbar20cm, y=sliding25)) +
  geom_abline(slope = model252$coefficients[2], intercept = model252$coefficients[1])

