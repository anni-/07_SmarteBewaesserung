library(tidyverse)

data <- read_csv("/Users/anni/dev/07_BewTool/07_SmarteBewaesserung/EDA/output_with_gis.csv")

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

model252 <- lm(log(train$cbar20cm) ~ train$tempslide7 / train$sliding25)
summary(model252)

model30 <- lm(train$cbar20cm ~ train$temp2m + train$sliding30)
summary(model30)

cor(data$cbar20cm, data$value, method = c("pearson", "kendall", "spearman"))

g_model <- lm(log(train$value) ~ train$cbar20cm)
summary(g_model)

ggplot(data) +
  geom_point(aes(x=log(cbar20cm), y=value))


model252 <- lm(log(cbar20cm) ~ tempslide7 / sliding25, data=data)
summary(model252)

data$predict <- predict(model252, data)

ggplot(data) +
  geom_point(aes(x=cbar20cm, y=sliding25)) +
  geom_point(aes(x=exp(data$predict), y=sliding25), color="red")

