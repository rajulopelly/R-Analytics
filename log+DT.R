#Exploratory DATA Analysis
library(readr)
data<-read.csv("D://Pranav//telecom.csv")
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
View(data)
#logistic regression

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
logist<-glm(Churn~.,family=binomial,data=traindata)
summary(logist)
#forward addition
logist1<-step(logist,direction = "forward")
summary(logist1)
#backward elimination
logist2<-step(logist,direction="backward")
summary(logist2)
#enter method with correct values
dat<-as.factor(data$SeniorCitizen)
logist3<-glm(Churn~tenure+InternetService-OnlineSecurity-StreamingMovies-StreamingTV+Contract+PaperlessBilling-TotalCharges,family=binomial,data=traindata)
summary(logist3)
#prediction
pred<-predict(logist3,newdata=testdata,type="response")
summary(pred)
pred
P<-ifelse(pred>0.5,1,0)
#Confusion Matrix
cm<-table(testdata$Churn,P)
cm
#efficiency
effic<-sum(diag(cm))/sum(cm)
effic
#ROC curve
library(ROCR)
prb<-prediction(P,testdata$Churn)
prbg<-performance(prb,measure="tpr",x.measure="fpr")
plot(prbg)
#AUC
auc=performance(prb,measure="auc")
auc=auc@y.values[[1]]
auc
#decision tree
#sampling
set.seed(100)
a<-as.numeric(data$Churn)
data$Churn<-a
trainrows1<-ifelse(runif(nrow(data))<0.8,1,0)
traindata1<-data[trainrows1==1,]
b<-data[trainrows1==0,]
testdata1<-b
library(rpart)
rpart_model<-rpart(Churn~.,data=traindata1,method="class")
rpart_model
library(rpart.plot)
library(rattle)
library(RColorBrewer)
fancyRpartPlot(rpart_model,main="Decision tree")
#Pruning
View(traindata1)
table(data$Churn)/nrow(data)
fix(data)
sapply(data,as.numeric)
str(data)
td1_contract<-subset(data,data$Contract<1.5)
table(td1_contract$Churn)/nrow(td1_contract)
nrow(td1_contract)/nrow(data)
png(file="DT.png",width=1200,height=200)
fix(data)
fancyRpartPlot(rpart_model,main="Decision Tree")
rpart_pred<-predict(rpart_model,newdata=testdata1[,c(-20)],type="class")
mean(rpart_pred==testdata1$Churn)
table(rpart_pred,true=testdata1$Churn)
printcp(rpart_model)
opt<-which.min(rpart_model$cptable[,"xerror"])
cp<-rpart_model$cptable[opt,"CP"]
pruned_model<-prune(rpart_model,cp)
fancyRpartPlot(pruned_model)
par(mfrow=c(1,2))
fancyRpartPlot(rpart_model,main="decision tree")
fancyRpartPlot(pruned_model,main="decision tree")
#if tenure is less than 16 and Internet service is Fiber optic and has a contract then Chance of Churning is more.
#if Internet service is Fiber optic and has a contract then there is more chance of churn
#if person has contract then he will churn

