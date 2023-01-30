library(tidyverse);library(caret);library(rpart);library(RColorBrewer);library(rpart.plot)
setwd("C:\\Users\\RAMYA\\Downloads\\archive")
df<-read.csv("heart_failure_clinical_records_dataset.csv")
str(df)
colSums(is.na(df))
boxplot(df)
df$ejection_fraction<-round(df$ejection_fraction)
df$ejection_fraction[df$ejection_fraction>65]<-mean(df$ejection_fraction)
summary(df$platelets)
plot(df$platelets)
#platelates outliers
IQR(df$platelets)
summary(df$platelets)
upp_bound<-303500+IQR(df$platelets)*1.5
lb_bound<-212500-IQR(df$platelets)*1.5
df$platelets[which(df$platelets>upp_bound)]<-440000
df$platelets[which(df$platelets<lb_bound)]<-76000
boxplot(df$platelets)
plot(df$platelets)

#outliers also called "anamolies"
#techniques to detect outliers
#Grubbs's test
#Dixon's test
#Rosner's test

df$serum_sodium[df$serum_sodium>140]<-136
df$serum_sodium[df$serum_sodium<134]<-136
df$serum_creatinine[df$serum_creatinine>2]<-1.4

df$anaemia<-as.factor(df$anaemia)
df$diabetes<-as.factor(df$diabetes)
df$high_blood_pressure<-as.factor(df$high_blood_pressure)
df$sex<-as.factor(df$sex)
df$smoking<-as.factor(df$smoking)
df$DEATH_EVENT<-as.factor(df$DEATH_EVENT)
str(df)

#univariate and bivariate analysis
library(ggplot2)
barplot(df$age,df$DEATH_EVENT)
ggplot2.barplot(data=df, xName="DEATH_EVENT",yName="age")
ggplot(df,aes(x=DEATH_EVENT))+geom_bar(aes(fill=age))


#feature selections or
#Dimentionality reduction
#Variable reduction
#tests between the independent and dependent variables
#              
#independent continuous & dependent continuous then correlation test
#independent categorical & dependent categorical then chi square test
#independent continuous & dependent categorical then LDA(LINEAR DISCRIMINATION) test
#independent cateGorical & dependent continuous then ANOVA test

library(MASS)
LDA<-lda(DEATH_EVENT~age+ejection_fraction+creatinine_phosphokinase+platelets+serum_creatinine+serum_sodium+time,data = df)
LDA

# except "serum_creatinine" all are significant
chisq.test(df$anaemia,df$DEATH_EVENT)
chisq.test(df$diabetes,df$DEATH_EVENT)
chisq.test(df$DEATH_EVENT,df$high_blood_pressure)
chisq.test(df$DEATH_EVENT,df$smoking)

#logistic regression
#model assumptions
#1.dependent in yes or no
#2.linear relationship between the logit of the outcome and each predictor variables
#Multicollinearity means "Independent variables are highly correlated to each other". 
#For categorical variables, multicollinearity can be detected with Spearman rank correlation 
#coefficient (ordinal variables) and chi-square test (nominal variables).
#3.no influential values (outliers),
#4.no multicollinearity



#data partitioning
library(caret)
library(purrr)
set.seed(123)
index <- createDataPartition(df$DEATH_EVENT,p=0.7,list = FALSE)
train<-df[index,]
test<-df[-index,]

#logistic
model1<-glm(DEATH_EVENT~.,family = "binomial",data =train)
summary(model1)

library(dplyr)
library(curl)
library(car)
vif(model1)
#found that there is no multicollinearity

#  "age","ejection_fraction","serum_creatinine","time"

#forward
forward=step(model1,type="forward")
summary(forward)
#backward
backward=step(model1,type="backward")

tester<-subset(test[,c("age","ejection_fraction","serum_creatinine","time","serum_sodium")])
round(tester$age)
round(tester$ejection_fraction)
#prediction
prediction<-predict(backward,newdata = tester,type = "response")
prediction
x<-ifelse(prediction>0.7,1,0)
x
#confusion matrix
cnmx<-table(test$DEATH_EVENT,x)
cnmx
fourfoldplot(cnmx)
#Odds ratio
library(MASS)
exp(cbind(OR=coef(model1), confint(model1)))
#ROCR
library(ROCR)
library(ResourceSelection)
efficiency<-sum(diag(cnmx)/sum(cnmx))
efficiency
roc<-performance(cnmx,)

#decition tree
library(rpart)
library(rattle)
library(rpart.plot)


tree<-rpart(DEATH_EVENT~.,data = train,method = "class")
summary(tree)

rpart.plot(tree)
fancyRpartPlot(tree,main="decitiontree",compress=F,cex=0.5)
prediction1<-predict(tree,newdata = test,type = "class")
summary(prediction1)

#confusion matrix
cm<-table(prediction1,test$DEATH_EVENT)
cm
accuracy<-sum(diag(cm)/sum(cm))
accuracy

#pruning
printcp(tree)
opt<-which.min(tree$cptable[,"xerror"])
cp<-tree$cptable[opt,"CP"]
cp
pruned<-prune(tree,cp)
summary(pruned)
fancyRpartPlot(pruned,main="decision pruning",compress=F,cex=0.5)
par(mfrow=c(1,2))
fancyRpartPlot(tree,main="decitiontree",compress=F,cex=0.5)
fancyRpartPlot(pruned,main="decision pruning",compress=F,cex=0.5)













