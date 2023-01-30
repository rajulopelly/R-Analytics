library(readr)
indian_revenue <- read_csv("C:/Users/RAMYA/Desktop/data science/Data Science/indian revenue.csv")
View(indian_revenue)
sum(is.na(indian_revenue))
names(indian_revenue)
dim(indian_revenue)
library(psych)
plot(indian_revenue$Indian_revenue,indian_revenue$Imports_income)
plot(indian_revenue$Indian_revenue,indian_revenue$Exports_income)
plot(indian_revenue$Indian_revenue,indian_revenue$Tax_income)
plot(indian_revenue$Indian_revenue,indian_revenue$Medical)
plot(indian_revenue$Indian_revenue,indian_revenue$Medical)
plot(indian_revenue$Indian_revenue,indian_revenue$Tourism)
skew(indian_revenue$Indian_revenue)
skew(indian_revenue$Imports_income)
skew(indian_revenue$Exports_income)
skew(indian_revenue$Tax_income)
skew(indian_revenue$Medical)
skew(indian_revenue$Tourism)
 

a1<-lm(Indian_revenue~Imports_income,data = indian_revenue)
a1
summary(a1)
par(mfrow=c(2,2))
plot(a1)

a2<-lm(Indian_revenue~Exports_income,data = indian_revenue)
a2
summary(a2)
par(mfrow=c(2,2))
plot(a2)
plot(a2$residuals)

a3<-lm(Indian_revenue~Tax_income,data=indian_revenue)
a3
summary(a3)
par(mfrow=c(2,2))
plot(a3)
plot(a3$residuals)

a4<-lm(Indian_revenue~Medical,data=indian_revenue)
a4
summary(a4)
par(mfrow=c(2,2))
plot(a4)

a5<-lm(Indian_revenue~Tourism, data=indian_revenue)
a5
summary(a5)
par(mfrow=c(2,2))
plot(a5)

#data partitioning
library(caret)
library(psych)
set.seed(100)
index<-createDataPartition(indian_revenue$Indian_revenue,p=0.70,list = FALSE)
index

train<-indian_revenue[index,]
test<-indian_revenue[-index,]
class(index)

#multilinear regression
m1<-lm(Indian_revenue~., data = train)
m1
summary(m1)
par(mfrow=c(2,2))
plot(train)
plot(m1$residuals)

library(car)
vif(m1)
#the vif should be lessthan 3.5
#forward and backward
forward<-step(m1, direction = "forward")
forward
summary(forward)

backward<-step(m1,direction = "backward")
backward
summary(backward)

#finalmodel
final<-subset(test,select = -c(Indian_revenue,Tourism,Medical,Tax_income,Exports_income))
prediction<-predict(backward,newdata = test)
prediction
results=data.frame(original=test$Indian_revenue,estimated=prediction)
View(results)

