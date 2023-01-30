#Exploratory DATA Analysis
library(readr)
telecom <- read_csv("C:\\Users\\RAMYA\\Desktop\\data science\\Data Science\\TelcoCustomerChurn.csv")
View(telecom)
data<-telecom
data<-data[,-c(1)]
sapply(data,class)
dat<-factor(data$gender,levels=c("Male","Female"),labels=c(0,1))
data$gender<-dat
dat<-factor(data$Partner,levels =c("Yes","No"),labels=c(0,1))
data$Partner<-dat
dat<-factor(data$Dependents,levels =c("Yes","No"),labels=c(0,1))
data$Dependents<-dat
dat<-factor(data$PhoneService,levels =c("Yes","No"),labels=c(0,1))
data$PhoneService<-dat
dat<-factor(data$MultipleLines,levels =c("No phone service","Yes","No"),labels=c(0,1,2))
data$MultipleLines<-dat
dat<-factor(data$InternetService,levels =c("No","DSL","Fiber optic"),labels=c(0,1,2))
data$InternetService<-dat
str(data$OnlineSecurity)
dat<-factor(data$OnlineSecurity,levels=c("No internet service","Yes","No"),labels=c(0,1,2))
data$OnlineSecurity<-dat
str(data$OnlineBackup)
dat<-factor(data$OnlineBackup,levels=c("No internet service","Yes","No"),labels=c(0,1,2))
data$OnlineBackup<-dat
str(data$DeviceProtection)
dat<-factor(data$DeviceProtection,levels=c("No internet service","Yes","No"),labels=c(0,1,2))
data$DeviceProtection<-dat
str(data$TechSupport)
dat<-factor(data$TechSupport,levels=c("No internet service","Yes","No"),labels=c(0,1,2))
data$TechSupport<-dat
str(data$StreamingTV)
dat<-factor(data$StreamingTV,levels=c("No internet service","Yes","No"),labels=c(0,1,2))
data$StreamingTV<-dat
str(data$StreamingMovies)
dat<-factor(data$StreamingMovies,levels=c("No internet service","Yes","No"),labels=c(0,1,2))
data$StreamingMovies<-dat
str(data$Contract)
dat<-factor(data$Contract,levels=c("Month-to-month","One year","Two year"),labels=c(0,1,2))
data$Contract<-dat
str(data$PaperlessBilling)
dat<-factor(data$PaperlessBilling,levels=c("Yes","No"),labels=c(0,1))
data$PaperlessBilling<-dat
str(data$PaymentMethod)
dat<-factor(data$PaymentMethod,levels=c("Bank transfer (automatic)","Credit card (automatic)","Electronic check","Mailed check"),labels=c(1,2,3,4))
data$PaymentMethod<-dat
str(data$MonthlyCharges)
str(data$TotalCharges)
str(data$Churn)
dat<-factor(data$Churn,levels=c("Yes","No"),labels=c(0,1))
data$Churn<-dat
chisq.test(data$Contract,data$PaperlessBilling,correct = FALSE)
str(data$TotalCharges)
data[is.na(data)]<-0

colSums(is.na(data))
dim(data)
View(data)
library(ResourceSelection)
library(fmsb)
library(ROCR)
library(rpart)
#sampling
data<-data[,-c(1,4)]
fix(data)
set.seed(100)
trainrows<-sample(nrow(data),0.7*7043)
traindata<-data[trainrows,]
testdata<-data[-trainrows,]
library(rpart)
rpart_model<-rpart(Churn~.,data=traindata,method="class")
rpart_model
library(rpart.plot)
library(rattle)
library(RColorBrewer)
rpart.plot(rpart_model)
fancyRpartPlot(rpart_model,main="Decision tree",compress=FALSE,cex=0.5)
#prediction
rpart_pred<-predict(rpart_model,newdata = testdata,type="class")
rpart_pred
mean(rpart_pred==testdata$Churn)
#actual vs predicted values of test data,calculating efficiency of the model
x<-table(rpart_pred,true=testdata$Churn)
x
accuracy<-sum(diag(x))/sum(x)
accuracy
#building cp table
printcp(rpart_model)
#selecting cp value those with minimum xerror value
opt<-which.min(rpart_model$cptable[,"xerror"])
opt
cp<-rpart_model$cptable[opt,"CP"]
cp
#tree pruning
pruned_model<-prune(rpart_model,cp)
pruned_model
fancyRpartPlot(pruned_model,main="decision tree",compress=FALSE,cex=0.8)
#dividing the plot areas
par(mfrow=c(1,2))
fancyRpartPlot(rpart_model,main="decision tree",compress=FALSE,cex=0.5)
fancyRpartPlot(pruned_model,main="decision tree",compress=FALSE,cex=0.5)

