### Partitioning the data
library(readr)
TelcoCustomerChurn <- read.csv("C:/Users/Unitech4/Desktop/All Files/XL Files/TelcoCustomerChurn.csv")
View(TelcoCustomerChurn)
churn2<-subset(TelcoCustomerChurn,select=c("gender","SeniorCitizen","Partner","Dependents","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","Churn"))
View(churn2)
set.seed(100)
a=sample(nrow(churn2),19720)
train=churn2[a,]
test=churn2[-a,]
nrow(train)
nrow(test)
### Applying the Agorithm
library(e1071)
model<-naiveBayes(Churn~., data=train)
summary(model)
print(model)
preds=predict(model,newdata=test)
#Confusion matrix
cm <- table(preds, test$Churn)
cm
#Efficency
Efficency <- sum(diag(cm))/sum(cm)
Efficency
##conditional probobility for given "label"
tbl_list <- sapply(test[-17], table, test[ , 17])
tbl_list <- lapply(tbl_list, t)

cond_probs <- sapply(tbl_list, function(x) { 
  apply(x, 1, function(x) { 
    x / sum(x) }) })
cond_probs <- lapply(cond_probs, t)

print(cond_probs)
