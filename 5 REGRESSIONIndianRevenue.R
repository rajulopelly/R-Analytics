library(readr)
indian_revenue <- read_csv("D:/Desktop raju/data science/data science/Data Science/indian revenue.csv")
View(indian_revenue)
data1<-indian_revenue
rm(indian_revenue)
class(data1)
dim(data1)
View(data1)
str(data1)
head(data1)
summary(data1)
is.na(data1)
sum(is.na(data1))
names(data1)
# Check Linear Relationship (Linearity) Between Dependent and Independent Variables (Scattered Plot)
# Linear Relationship for Imports_Income and Tax_income but not for Exports_income,Medical,Tourism
plot(data1$Imports_income,data1$Indian_revenue)
plot(data1$Exports_income,data1$Indian_revenue)
plot(data1$Tax_income,data1$Indian_revenue)
plot(data1$Medical,data1$Indian_revenue)
plot(data1$Tourism,data1$Indian_revenue)

# Simple linear regression
slr<-lm(Indian_revenue~Imports_income,data = data1)
slr
summary(slr)
par(mfrow=c(2,2))
# To Check Independence and Normality
plot(slr)
plot(slr$residuals)

slr1<-lm(Indian_revenue~Exports_income,data = data1)
slr1
summary(slr1)
par(mfrow=c(2,2))
# To Check Independence and Normality
plot(slr1)
plot(slr1$residuals)

slr2<-lm(Indian_revenue~Tax_income,data = data1)
slr2
summary(slr2)
par(mfrow=c(2,2))
# To Check Independence and Normality
plot(slr2)
plot(slr2$residuals)

slr3<-lm(Indian_revenue~Medical,data = data1)
slr3
summary(slr3)
par(mfrow=c(2,2))
# To Check Independence and Normality
plot(slr3)
plot(slr3$residuals)

slr4<-lm(Indian_revenue~Tourism,data = data1)
slr4
summary(slr4)
par(mfrow=c(2,2))
# To Check Independence and Normality
plot(slr4)
plot(slr4$residuals)
#multiple linear regression
mlr<-lm(Indian_revenue~.,data = data1)
mlr
summary(mlr)
## To Check Independence and Normality
par(mfrow=c(2,2))
plot(mlr)
plot(mlr$residuals)
## Dropping The Insignificant Variable From the Model
mlr1<-lm(Indian_revenue~Imports_income+Exports_income,data = data1)
mlr1
summary(mlr1)
# Building a Multiple Linear Regression Model using Best Regression Line Selection Techniques
library(caret)
library(psych)
## Check Skewness of Variables and should not be less than -0.9 or greater than 0.9
skew(data1$Indian_revenue)
skew(data1$Imports_income)
skew(data1$Exports_income)
skew(data1$Tax_income)
skew(data1$Medical)
skew(data1$Tourism)
describe(data1)
summary(data1)
#Data Partition
data_index<-createDataPartition(data1$Indian_revenue,p=0.70,list = FALSE)
data_index
class(data_index)
View(data_index)
train<-data1[data_index,]
View(train)
tester<-data1[-data_index,]
View(tester)
class(train)
class(tester)
dim(train)
dim(tester)
dim(data1)
# Multi Linear Regression Line using training Data
mlr2<-lm(Indian_revenue~.,data = train)
mlr2
summary(mlr2)
library(car)
vif(mlr2)
## vif(Variance Inflation Factor) must be less than 3.5 for each independent variable
# Using library that contains Best Regression Line Selection Techniques
## Both Forward and Backward StepWise Selection are tested in this case
library(ResourceSelection)
forward<-step(mlr2,direction = "forward")
forward
summary(forward)
# AIC=44.93
backward<-step(mlr2,direction = "backward")
backward
summary(backward)
# AIC=40.9
## Hence as AIC for Backward Stepwise is lesser, we choose this method
test1<-subset(tester,select = -c(Indian_revenue,Tax_income,Medical,Tourism))
View(test1)
prediction<-predict(backward,newdata = test1)
View(prediction)

# Create a DataFrame containing Original and Predicted Revenue
results<-data.frame(original=tester$Indian_revenue,estimated=prediction)
View(results)

cor(results$estimated,results$estimated)
