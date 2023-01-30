#Data Exploration
library(readr)
TelcoCustomerChurn <- read.csv("C:/Users/Unitech1/Desktop/telecom.csv")
View(TelcoCustomerChurn)
churn=subset(TelcoCustomerChurn,select = c("gender","SeniorCitizen","Partner","Dependents","tenure","PhoneService","MultipleLines","InternetService","OnlineSecurity","OnlineBackup","DeviceProtection","TechSupport","StreamingTV","StreamingMovies","Contract","PaperlessBilling","PaymentMethod","MonthlyCharges","TotalCharges","Churn"))
View(churn)
names(churn)
nrow(churn)
ncol(churn)
table(is.na(churn))
sum(is.na(churn))
# Consider the all the variable gender
table(is.na(churn$gender))
is.numeric(churn$gender)
class(churn$gender)
table(churn$gender)
Gender <- factor(churn$gender, levels = c("Female", "Male"), labels = c(0,1))
is.factor(Gender)
table(Gender)
churn$gender<-Gender

# Consider the all the variable SeniorCitizen
is.numeric(churn$SeniorCitizen)
class(churn$SeniorCitizen)
table(churn$SeniorCitizen)
sum(is.na(churn$SeniorCitizen))
range(churn$SeniorCitizen)

# Consider the all the variable Partner
is.numeric(churn$Partner)
class(churn$Partner)
is.integer(churn$Partner)
table(is.na(churn$Partner))
table(churn$Partner)
partner<-factor(churn$Partner,levels=c("Yes","No"),labels = c(1,0))
churn$Partner<-partner

# Consider the all the variable Dependents
is.numeric(churn$Dependents)
class(churn$Dependents)
is.integer(churn$Dependents)
table(is.na(churn$Dependents))
table(churn$Dependents)
dependents<-factor(churn$Dependents,levels=c("Yes","No"),labels=c(1,0))
churn$Dependents<-dependents

# Consider the all the variable tenure
is.integer(churn$tenure)
class(churn$tenure)
range(churn$tenure)
table(is.na(churn$tenure))

# Consider the all the variable PhoneService
is.numeric(churn$PhoneService)
class(churn$PhoneService)
is.factor(churn$PhoneService)
table(is.na(churn$PhoneService))
table(churn$PhoneService)
phoneservice<-factor(churn$PhoneService,levels=c("Yes","No"),labels = c(1,0))
churn$PhoneService<-phoneservice

# Consider the all the variable MultipleLines
is.integer(churn$MultipleLines)
class(churn$MultipleLines)
table(is.na(churn$MultipleLines))
table(churn$MultipleLines)
multiplelines<-factor(churn$MultipleLines,levels = c("Yes","No","No phone service"),labels = c(1,0,2))
churn$MultipleLines<-multiplelines

# Consider the all the variable InternetService
is.numeric(churn$InternetService)
class(churn$InternetService)
table(is.na(churn$InternetService))
table(churn$InternetService)
internetservice<-factor(churn$InternetService,levels=c("DSL","Fiber optic","No"),labels=c(1,2,0))
churn$InternetService<-internetservice

# Consider the all the variable OnlineSecurity
is.integer(churn$OnlineSecurity)
class(churn$OnlineSecurity)
table(is.na(churn$OnlineSecurity))
table(churn$OnlineSecurity)
onlinesecurity<-factor(churn$OnlineSecurity,levels=c("Yes","No","No internet service"),labels = c(1,0,2))
churn$OnlineSecurity<-onlinesecurity

# Consider the all the variable OnlineBackup
is.numeric(churn$OnlineBackup)
class(churn$OnlineBackup)
table(is.na(churn$OnlineBackup))
table(churn$OnlineBackup)
onlinebackup<-factor(churn$OnlineBackup,levels=c("Yes","No","No internet service"),labels = c(1,0,2))
churn$OnlineBackup<-onlinebackup

# Consider the all the variable DeviceProtection
is.integer(churn$DeviceProtection)
class(churn$DeviceProtection)
table(is.na(churn$DeviceProtection))
table(churn$DeviceProtection)
deviceprotection<-factor(churn$DeviceProtection,levels = c("Yes","No internet service","No"),labels = c(1,2,0))
churn$DeviceProtection<-deviceprotection

# Consider the all the variable TechSupport
is.integer(churn$TechSupport)
class(churn$TechSupport)
table(is.na(churn$TechSupport))
table(churn$TechSupport)
techsupport<-factor(churn$TechSupport,levels = c("Yes","No","No internet service"),labels = c(1,0,2))
churn$TechSupport<-techsupport

# Consider the all the variable StreamingTV
is.integer(churn$StreamingTV)
class(churn$StreamingTV)
table(is.na(churn$StreamingTV))
table(churn$StreamingTV)
streamingtv<-factor(churn$StreamingTV,levels = c("Yes","No","No internet service"),labels = c(1,0,2))
churn$StreamingTV<-streamingtv

# Consider the all the variable StreamingMovies
is.numeric(churn$StreamingMovies)
class(churn$StreamingMovies)
sum(is.na(churn$StreamingMovies))
table(churn$StreamingMovies)
streamingmovies<-factor(churn$StreamingMovies,levels = c("Yes","No","No internet service"),labels = c(1,0,2))
churn$StreamingMovies<-streamingmovies

# Consider the all the variable Contract
is.integer(churn$Contract)
class(churn$Contract)
table(is.na(churn$Contract))
table(churn$Contract)
contract<-factor(churn$Contract,levels=c("Month-to-month","One year","Two year"),labels=c(1,2,3))
churn$Contract<-contract

# Consider the all the variable PaperlessBilling
is.integer(churn$PaperlessBilling)
class(churn$PaperlessBilling)
sum(is.na(churn$PaperlessBilling))
table(churn$PaperlessBilling)
paperlessbilling<-factor(churn$PaperlessBilling,levels=c("Yes","No"),labels = c(1,0))
churn$PaperlessBilling<-paperlessbilling

# Consider the all the variable PaymentMethod
is.integer(churn$PaymentMethod)
class(churn$PaymentMethod)
table(is.na(churn$PaymentMethod))
table(churn$PaymentMethod)
paymentmethod<-factor(churn$PaymentMethod,levels=c("Bank transfer (automatic)","Credit card (automatic)","Electronic check","Mailed check"),labels=c(1,2,3,4))
churn$PaymentMethod<-paymentmethod

# Consider the all the variable MonthlyCharges
is.integer(churn$MonthlyCharges)
class(churn$MonthlyCharges)
range(churn$MonthlyCharges)
table(is.na(churn$MonthlyCharges))

# Consider the all the variable TotalCharges
is.integer(churn$TotalCharges)
class(churn$TotalCharges)
range(churn$TotalCharges)
table(is.na(churn$TotalCharges))
mean(churn$TotalCharges,na.rm = TRUE)
churn$TotalCharges[which(is.na(churn$TotalCharges))]<-mean(churn$TotalCharges,na.rm = TRUE)
sum(is.na(churn$TotalCharges))

# Consider the all the variable Churn
is.integer(churn$Churn)
class(churn$Churn)
table(is.na(churn$Churn))
table(churn$Churn)
Churn<-factor(churn$Churn,levels=c("Yes","No"),labels = c(1,0))
churn$Churn<-Churn

# Changing of Data type of the variabels
fix(churn)

###############################Statistical Analysis#################################
library(ResourceSelection)
library(fmsb)
library(ROCR)
library(rpart)
set.seed(100)
a=sample(2,nrow(churn),replace = T,prob = c(0.7,0.3))
train=churn[a==1,]
test=churn[a==2,]
View(train)
View(test)
nrow(train)
nrow(test)
# logistic model with enter method
logmo=glm(Churn~.,data=train,family=binomial)
summary(logmo)
# logistic model with forward method
logmof=step(logmo,direction="forward")
summary(logmof)
# logistic method with backward method
logmob=step(logmo,direction="backward")
summary(logmob)
# Final model of logistic regression
loomodsig=glm(Churn~SeniorCitizen+tenure+MultipleLines+InternetService+OnlineSecurity+TechSupport+StreamingTV+StreamingMovies+Contract+PaperlessBilling+MonthlyCharges+TotalCharges,data=train,family=binomial)
logmobsig2=step(loomodsig,direction="backward")
summary(logmobsig2)
pre<-predict(logmobsig2)
pre
train$pred<-pre
test$score=predict(logmobsig2,newdata=subset(test,select=c(1:19)),type='response')
prbsig2 <- prediction(test$score, test$Churn)
prfbsig2 <- performance(prbsig2, measure = "tpr", x.measure = "fpr")
plot(prfbsig2)
abline(0,1,lty = 8, col = 'red')
auc=performance(prbsig2,measure="auc")
auc=auc@y.values[[1]]
auc
#Confusion matrix
y_pred <- ifelse(test$score > 0.5, 1 ,0)
cm <- table(test$Churn, y_pred)
cm
#Efficency
Efficency <- sum(diag(cm))/sum(cm)
Efficency

