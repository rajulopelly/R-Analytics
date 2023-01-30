# Logistic Regression Analysis
library(ResourceSelection)
library(fmsb)
library(ROCR)
library(rpart)
set.seed(100)
a=sample(nrow(churn),19720)
train=churn[a,]
test=churn[-a,]
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
loomodsig=glm(Churn~-gender+SeniorCitizen-Partner-Dependents+tenure-PhoneService+MultipleLines+InternetService+OnlineSecurity-OnlineBackup-DeviceProtection+TechSupport+StreamingTV+StreamingMovies+Contract+PaperlessBilling-PaymentMethod+MonthlyCharges+TotalCharges,data=train,family=binomial)
logmobsig2=step(loomodsig,direction="backward")
summary(logmobsig2)
test$score=predict(logmobsig2,newdata=subset(test,select=c(1:19)),type='response')
prbsig2 <- prediction(test$score, test$Churn)
#ROC Curve
prfbsig2 <- performance(prbsig2, measure = "tpr", x.measure = "fpr")
plot(prfbsig2)
abline(0,1, lty = 8, col = 'red')
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
