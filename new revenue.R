library(readr)
attach(revenue)
str(revenue)
data.frame(revenue)
library(dplyr)
names(revenue)
table(revenue)
head(revenue)
summary(revenue)
mod<-lm(IR~`Imports income`,data = revenue)
mod
summary(mod)
newdat <- data.frame(Imports income = seq(min(revenue$Imports income), max(revenue$Imports income),len=24))
newdat$IR = predict(fit, newdata=newdat, type="response")
plot(IR~Imports income, data=revenue, col="red4")
lines(IR~Imports income, newdat, col="green4", lwd=2)
set.seed(25)
b=sample(nrow(revenue),19)
b
train=revenue[b,]
test=revenue[-b,]