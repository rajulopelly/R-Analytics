##Data EXploration (Cleaning and transformation)
library(readr)
market <-read.csv("c:/users/unitech1/desktop/market.csv")
View(market)
str(market)

#consider variable age 
class(market$Age)
market$Age
A <- factor(market$Age, levels = c("Old","Middle","Young"), labels =c(1,2,3))
class(A)
A1<-as.numeric(as.factor(A))
class(A1)
market$Age <-A1

#consider variable Gender 
class(market$Gender)
G1 <- factor(market$Gender,levels = c("Female","Male"),labels = c(1,2))
class(G1)
G<- as.numeric(as.factor(G1))
class(G)
market$Gender <- G

#consider variable own home 
class(market$OwnHome)
H1 <- factor(market$OwnHome,levels = c("Own","Rent"), labels = c(1,2))
class(H1)
H<- as.numeric(as.factor(H1))
market$OwnHome <-H

#consider variable married
class(market$Married)
M1<-factor(market$Married,levels = c("Single","Married"),labels=c(1,2))
M <-as.numeric(as.factor(M1))
market$Married <-M

#consider variable location 
class(market$Location)
L1 <-factor(market$Location,levels = c("Far","Close"),labels = c(1,2))
class(L1)
L<-as.numeric(as.factor(L1))
class(L)
market$Location <-L


#consider variable salary
class(market$Salary)
salary<-as.numeric(as.integer(market$Salary))
class(salary)
boxplot(salary)
market$Salary <- salary
range(market$Salary)
subset(market, Salary ==168800)
M <-market[-c(929),]
mean(M$Salary)
market$Salary[market$Salary==168800] <-55991.09
range(market$Salary)
boxplot(market$Salary)
class(market$Salary)

#variable children 
class(market$Children)
market$Children<-as.factor(as.integer(market$Children))
class(market$Children)

#consider variable history
class(market$History)
table(is.na(market$History))

#Variable History has been manipulated 
library(forcats)
library(tidyverse)
library(magrittr)
market%<>%mutate(History =  fct_explicit_na(History, na_level= "Missing"))
market$History <-factor(market$History,levels = c("High","Medium","Low","Missing"),labels = c(1,2,3,4))
table(market$History)
class(market$History)

#consider variable catalogs 
class(market$Catalogs)
market$Catalogs<-as.factor(as.integer(market$Catalogs))
class(market$Catalogs)

#consider variable amount spent 
class(market$AmountSpent)

mean(market$AmountSpent)
#mean of amountspent by the population is 1216.77

market$target <-ifelse(market$AmountSpent>mean(market$AmountSpent),1,0)
# amount sepnt is the target variable and it is converted to binary variable by using above function.


#logistic regression(enter method) is applied to this case study as there is an dependant variable i.e AmountSpent.
#Final model fitting is done using target variable and history,children,catalogs,salary.

library(ResourceSelection)
library(fmsb)
library(ROCR)
library(rpart)


set.seed(100)
a=sample(nrow(market),800)
b=market[-a,]
train=market[a,]
test=b

########

mylogi <-glm(target~Children+Salary+Catalogs+History,data=train,family = "binomial")
mylogi
summary(mylogi)

gof=hoslem.test(train$target,fitted(mylogi))
gof

NagelkerkeR2(mylogi)
#ROC Curve 
test$score <-predict(mylogi,newdata=subset(test,select=c(6:9)),type='response')
pred<-prediction(test$score,test$target)
pref<-performance(pred,"tpr","fpr")
plot(pref)
abline(0,1, lty = 8, col = 'blue')

#confusion Matrix
y_pred<-ifelse(test$score>0.5,1,0)
cm<-table(test$target,y_pred)
cm

# Efficiency
efficiency<-sum(diag(cm))/sum(cm)
efficiency

#AUC 
auc=performance(pred,measure ="auc")
auc@y.values[1]
auc

