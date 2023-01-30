library(readxl)
library(psych)
insu<-read_excel("F:\\data analysis\\Insurance Data.xlsx")
dim(insu)
class(insu)
str(insu)
View(insu)

#Missing values Description

colSums(is.na(insu))


#Replacing Missing Values

describe(insu$Age) #median is less #continuous variable
insu$Age[which(is.na(insu$Age))]<-median(insu$Age,na.rm = T)
colSums(is.na(insu))

insu$Gender<-ifelse(is.na(insu$Gender),"o",insu$Gender)
insu$`Marital Status`<-ifelse(is.na(insu$`Marital Status`),"o",insu$`Marital Status`)
insu$`Family Members`<-ifelse(is.na(insu$`Family Members`),"o",insu$`Family Members`)
insu$Education<-ifelse(is.na(insu$Education),"o",insu$Education)
insu$Occupation<-ifelse(is.na(insu$Occupation),"o",insu$Occupation)
insu$`Job Title`<-ifelse(is.na(insu$`Job Title`),"o",insu$`Job Title`)

describe(insu$Income) #median is less #Continuous variable
insu$Income[which(is.na(insu$Income))]<-median(insu$Income,na.rm = T)

insu$`Current Product`<-ifelse(is.na(insu$`Current Product`),"o",insu$`Current Product`)
insu$`Current Product Type`<-ifelse(is.na(insu$`Current Product Type`),"o",insu$`Current Product Type`)

describe(insu$`Current Coverage(In Rs)`)#median is less # continuous variable
insu$`Current Coverage(In Rs)`[which(is.na(insu$`Current Coverage(In Rs)`))]<-median(insu$`Current Coverage(In Rs)`,na.rm = T)

insu$`New Product Type`<-ifelse(is.na(insu$`New Product Type`),"o",insu$`New Product Type`)

describe(insu$`New Coverage(In Rs)`)  #median is less  #continuous variable
insu$`New Coverage(In Rs)`[which(is.na(insu$`New Coverage(In Rs)`))]<-median(insu$`New Coverage(In Rs)`,na.rm = T)

insu$Rating<-ifelse(is.na(insu$Rating),"o",insu$Rating)
insu$Converted<-ifelse(is.na(insu$Converted),"o",insu$Converted)
insu$Status<-ifelse(is.na(insu$Status),"o",insu$Status)
colSums(is.na(insu))


#conversion
str(insu)
insu$Age<-as.numeric(insu$Age) #continuous variable
insu$Gender<-as.factor(insu$Gender)
insu$`Marital Status`<-as.factor(insu$`Marital Status`)
insu$`Family Members`<-as.factor(insu$`Family Members`)
insu$Education<-as.factor(insu$Education)
insu$Occupation<-as.factor(insu$Occupation)
insu$`Job Title`<-as.factor(insu$`Job Title`)
insu$Income<-as.numeric(insu$Income) #continuous variable
insu$`Current Product`<-as.factor(insu$`Current Product`)
insu$`Current Product Type`<-as.factor(insu$`Current Product Type`)
insu$`Current Coverage(In Rs)`<-as.numeric(insu$`Current Coverage(In Rs)`)
insu$`New Product Type`<-as.factor(insu$`New Product Type`)
insu$`New Coverage(In Rs)`<-as.numeric(insu$`New Coverage(In Rs)`) #continuous variable
insu$Rating<-as.factor(insu$Rating)
insu$Converted<-as.factor(insu$Converted)
insu$Status<-as.factor(insu$Status)




#Description

str(insu)
View(insu)

table(insu$Age)
describe(insu$Age)   #continuous variable
table(insu$Gender)
table(insu$`Marital Status`)
table(insu$`Family Members`)
#describe(insu$`Family Members`)
table(insu$Education)
table(insu$Occupation)
table(insu$`Job Title`)
describe(insu$Income)  #continuous variable
table(insu$`Current Product`)
table(insu$`Current Product Type`)
describe(insu$`Current Coverage(In Rs)`)
table(insu$`New Product Type`)
describe(insu$`New Coverage(In Rs)`)  #continuous variable
table(insu$Rating)
table(insu$Converted)
table(insu$Status)


#Exploration
#Age #Discrete #Continuos
boxplot(insu$Age)
boxplot(insu$Age~insu$Gender)      # Continuous and categorical variables
boxplot(insu$Age~insu$`Marital Status`)
boxplot(insu$Age~insu$`Family Members`)
boxplot(insu$Age~insu$Education)
boxplot(insu$Age~insu$Occupation)
boxplot(insu$Age~insu$`Job Title`)
cor(insu$Age,insu$Income )                   #Both continuous variables
boxplot(insu$Age~insu$`Current Product`)
boxplot(insu$Age~insu$`Current Product Type`)
cor(insu$Age,insu$`Current Coverage(In Rs)`)  #Both continuous variables
boxplot(insu$Age~insu$`New Product Type`)
cor(insu$Age,insu$`New Coverage(In Rs)`)      #Both continuous variables
boxplot(insu$Age~insu$Rating)
boxplot(insu$Age~insu$Converted)
boxplot(insu$Age~insu$Status)

#Gender #Categorical

table(insu$Gender,insu$`Marital Status`)     #Both Categorical variables
table(insu$Gender,insu$`Family Members`)
table(insu$Gender,insu$Education)
table(insu$Gender,insu$Occupation)
table(insu$Gender,insu$`Job Title`)
boxplot(insu$Income~insu$Gender)            #Continuous and Categorical variables
table(insu$Gender,insu$`Current Product`)
table(insu$Gender,insu$`Current Product Type`)
boxplot(insu$`Current Coverage(In Rs)`~insu$Gender)  #Continuous and Categorical variables
table(insu$Gender,insu$`New Product Type`)
boxplot(insu$`New Coverage(In Rs)`~insu$Gender)     #Continuous and Categorical variables
table(insu$Gender,insu$Rating)
table(insu$Gender,insu$Converted)
table(insu$Gender,insu$Status)




#Marital Status #Categorical

table(insu$`Marital Status`)
table(insu$`Marital Status`,insu$`Family Members`)   #Both Categorical variables
table(insu$`Marital Status`,insu$Education)
table(insu$`Marital Status`,insu$Occupation)
table(insu$`Marital Status`,insu$`Job Title`)
boxplot(insu$Income~insu$`Marital Status`)      #Continuous and Categorical variables
table(insu$`Marital Status`,insu$`Current Product`)
table(insu$`Marital Status`,insu$`Current Product Type`)
boxplot(insu$`Current Coverage(In Rs)`~insu$`Marital Status`)   #Continuous and Categorical variables
table(insu$`Marital Status`,insu$`New Product Type`)
boxplot(insu$`New Coverage(In Rs)`~insu$`Marital Status`)   #Continuous and Categorical variables
table(insu$`Marital Status`,insu$Rating)
table(insu$`Marital Status`,insu$Converted)
table(insu$`Marital Status`,insu$Status)

#Family Members  #Categorical

table(insu$`Family Members`)
table(insu$`Family Members`,insu$Education)    #Both Categorical variables
table(insu$`Family Members`,insu$Occupation)
table(insu$`Family Members`,insu$`Job Title`)
boxplot(insu$Income~insu$`Family Members`)   #Continuous and Categorical variables
table(insu$`Family Members`,insu$`Current Product`)
table(insu$`Family Members`,insu$`Current Product Type`)
boxplot(insu$`Current Coverage(In Rs)`~insu$`Family Members`)   #Continuous and Categorical variables
table(insu$`Family Members`,insu$`New Product Type`)
boxplot(insu$`New Coverage(In Rs)`~insu$`Family Members`)   #Continuous and Categorical variables
table(insu$`Family Members`,insu$Rating)
table(insu$`Family Members`,insu$Converted)
table(insu$`Family Members`,insu$Status)

#Education    #Categorical

table(insu$Education)
table(insu$Education,insu$Occupation)   #Both Categorical variables
table(insu$Education,insu$`Job Title`)
boxplot(insu$Income~insu$Education)   #Continuous and Categorical variables
table(insu$Education,insu$`Current Product`)
table(insu$Education,insu$`Current Product Type`)
boxplot(insu$`Current Coverage(In Rs)`~insu$Education)   #Continuous and Categorical variables
table(insu$Education,insu$`New Product Type`)
boxplot(insu$`New Coverage(In Rs)`~insu$Education)     #Continuous and Categorical variables
table(insu$Education,insu$Rating)
table(insu$Education,insu$Converted)
table(insu$Education,insu$Status)


#Occupation    #Categorical

table(insu$Occupation)
table(insu$Occupation,insu$`Job Title`)   #Both Categorical variables
boxplot(insu$Income~insu$Occupation)      #Continuous and Categorical variables
table(insu$Occupation,insu$`Current Product`)
table(insu$Occupation,insu$`Current Product Type`)
boxplot(insu$`Current Coverage(In Rs)`~insu$Occupation)   #Continuous and Categorical variables
table(insu$Occupation,insu$`New Product Type`)
boxplot(insu$`New Coverage(In Rs)`)      #Continuous and Categorical variables
table(insu$Occupation,insu$Rating)
table(insu$Occupation,insu$Converted)
table(insu$Occupation,insu$Status)

#Job Title    #Categorical

table(insu$`Job Title`)
boxplot(insu$Income~insu$`Job Title`)     #Continuous and Categorical variables
table(insu$`Job Title`,insu$`Current Product`)   #Both Categorical variables
table(insu$`Job Title`,insu$`Current Product Type`)
boxplot(insu$`Current Coverage(In Rs)`~insu$`Job Title`)
table(insu$`Job Title`,insu$`New Product Type`)
boxplot(insu$`New Coverage(In Rs)`~insu$`Job Title`)
table(insu$`Job Title`,insu$Rating)
table(insu$`Job Title`,insu$Converted)
table(insu$`Job Title`,insu$Status)

#Income       #Continuous

boxplot(insu$Income)
boxplot(insu$Income~insu$`Current Product`)   #Continuous and Categorical variables
boxplot(insu$Income~insu$`Current Product Type`)
cor(insu$Income,insu$`Current Coverage(In Rs)`)  #Both Continuous variables
boxplot(insu$Income~insu$`New Product Type`)
cor(insu$Income,insu$`New Coverage(In Rs)`)  #Both Continuous variables
boxplot(insu$Income~insu$Rating)
boxplot(insu$Income~insu$Converted)
boxplot(insu$Income~insu$Status)


#Current Product      #Categorical

table(insu$`Current Product`)
table(insu$`Current Product`,insu$`Current Product Type`) #Both Categorical variables
boxplot(insu$`Current Coverage(In Rs)`~insu$`Current Product`) 
table(insu$`Current Product`,insu$`New Product Type`)
boxplot(insu$`New Coverage(In Rs)`~insu$`Current Product`)   #Continuous and Categorical variables
table(insu$`Current Product`,insu$Rating)
table(insu$`Current Product`,insu$Converted)
table(insu$`Current Product`,insu$Status)

#Current Product type   #Cateogorical


table(insu$`Current Product Type`)
boxplot(insu$`Current Coverage(In Rs)`~insu$`Current Product Type`)
table(insu$`Current Product Type`,insu$`New Product Type`)
boxplot(insu$`New Coverage(In Rs)`~insu$`Current Product Type`)
table(insu$`Current Product Type`,insu$Rating)
table(insu$`Current Product Type`,insu$Converted)
table(insu$`Current Product Type`,insu$Status)

#current Coverage     #Continuous

boxplot(insu$`Current Coverage(In Rs)`)
boxplot(insu$Income~insu$`New Product Type`)
cor(insu$`Current Coverage(In Rs)`,insu$`New Coverage(In Rs)`)
boxplot(insu$`Current Coverage(In Rs)`~insu$Rating)
boxplot(insu$`Current Coverage(In Rs)`~insu$Converted)
boxplot(insu$`Current Coverage(In Rs)`~insu$Status)

#New Product Type    #Categorical

table(insu$`New Product Type`)
boxplot(insu$`New Coverage(In Rs)`~insu$`New Product Type`)
table(insu$`New Product Type`,insu$Rating)
table(insu$`New Product Type`,insu$Converted)
table(insu$`New Product Type`,insu$Status)

#New Coverage      #Continuous

boxplot(insu$`New Coverage(In Rs)`)
boxplot(insu$`New Coverage(In Rs)`~insu$Rating)
boxplot(insu$`New Coverage(In Rs)`~insu$Converted)
boxplot(insu$`New Coverage(In Rs)`~insu$Status)

#Rating       #Categorical


table(insu$Rating)
table(insu$Rating,insu$Converted)
table(insu$Rating,insu$Status)


#Converted     #Categorical

table(insu$Converted)
table(insu$Converted,insu$Status)

#Status      #Categorical

table(insu$Status)


#Modelling

library(car)
library(ResourceSelection)
library(caret)
library(readr)
library(readxl)
library(dplyr)
library(psych)
library(ROCR)
View(insu)
names(insu)
head(insu)          
str(insu)   
dim(insu)
colSums(is.na(insu))
insu$Gender<-ifelse(insu$Gender=="M",0,ifelse(insu$Gender=="F",1,2))
insu$`Marital Status`<-ifelse(insu$`Marital Status`=="Single",0,ifelse(insu$`Marital Status`=="Married",1,ifelse(insu$`Marital Status`=="Divorced",2,3)))
insu$Education<-ifelse(insu$Education=="BD",0,ifelse(insu$Education=="MD",1,ifelse(insu$Education=="NE",2,ifelse(insu$Education=="PD",3,ifelse(insu$Education=="LHS",4,ifelse(insu$Education=="UHS",5,6))))))
insu$Occupation<-ifelse(insu$Occupation=="SE",0,ifelse(insu$Occupation=="SFT",1,ifelse(insu$Occupation=="SPT",2,3)))
insu$`Current Product`<-ifelse(insu$`Current Product`=="YES",0,ifelse(insu$`Current Product`=="NO",1,2))
insu$Education<-ifelse(insu$Education=="BD",0,ifelse(insu$Education=="MD",1,ifelse(insu$Education=="NE",2,ifelse(insu$Education=="PD",3,ifelse(insu$Education=="LHS",4,ifelse(insu$Education=="UHS",5,6))))))
insu$`Current Product Type`<-ifelse(insu$`Current Product Type`=="ANS",0,ifelse(insu$`Current Product Type`=="END",1,ifelse(insu$`Current Product Type`=="INV",2,ifelse(insu$`Current Product Type`=="NA",3,ifelse(insu$`Current Product Type`=="PMT",4,ifelse(insu$`Current Product Type`=="TLE",5,6))))))                   
insu$`New Product Type`<-ifelse(insu$`New Product Type`=="ANS",0,ifelse(insu$`New Product Type`=="END",1,ifelse(insu$`New Product Type`=="INV",2,ifelse(insu$`New Product Type`=="PMT",3,ifelse(insu$`New Product Type`=="TLE",4,5)))))
insu$`Job Title`<-ifelse(insu$`Job Title`=="BA",0,ifelse(insu$`Job Title`=="CB",1,ifelse(insu$`Job Title`=="CF",2,ifelse(insu$`Job Title`=="DD",3,ifelse(insu$`Job Title`=="FH",4,ifelse(insu$`Job Title`=="OC",5,ifelse(insu$`Job Title`=="OM",6,ifelse(insu$`Job Title`=="OT",7,ifelse(insu$`Job Title`=="PA",8,ifelse(insu$`Job Title`=="PG",9,ifelse(insu$`Job Title`=="PR",10,ifelse(insu$`Job Title`=="RR",11,12))))))))))))                   
insu$Rating<-ifelse(insu$Rating=="Cold",0,ifelse(insu$Rating=="Hot",1,ifelse(insu$Rating=="Warm",2,3)))
insu$Converted<-ifelse(insu$Converted=="Converted",0,1)




#data partition
View(insu)
insu<-subset(insu,select = -c(Status))
View(insu)
data_index<-createDataPartition(insu$Converted,p=0.71,list = F)
train<-insu[data_index,]
test<-insu[-data_index,]
nrow(train)
nrow(test)


#Model Building of Logistic Regression

glmodel<-glm(Converted~.,data = train,family = "binomial")
glmodel
summary(glmodel)
hoslem.test(train$Converted,fitted(glmodel),g=10)

#Forward model
fwd<-step(glmodel,direction = "forward")
fwd
summary(fwd)
hoslem.test(train$Converted,fitted(fwd))

#Backward model
bwd<-step(glmodel,direction = "backward")
bwd
summary(bwd)
hoslem.test(train$Converted,fitted(bwd),g=10)



#Prediction
pre<-predict(bwd,newdata = test,type = "response")
res<-ifelse(pre>0.4,1,0)
View(res)

#Decide whether to build a sensitive model or a specific model based on the domain

#Confusion matrix
conf<-table(test$Converted,res)
conf

#From confusion matrix identify the misclassification happened and interpret through business
#Efficiency
sum(diag(conf))/sum(conf)*100
results<- data.frame(org=test$Converted, est=res)



#ROC curve
p1<-prediction(results$est,results$org)
p2<-performance(p1,"tpr","fpr")
plot(p2,col="blue")
abline(0,1)

#AUC Value
areauc<-performance(p1,measure = "auc")
areauc@y.values

#-------------------------------------Modelling of Decision Tree-------------------------#

library(rpart)
rpart_model<-rpart(Converted~.,data=train,method="class")#mothod="ANOVA" for continuous variable.
rpart_model
library(rpart.plot)
#install.packages("rpart.plot")
library(rattle)
#install.packages("rattle")
library(RColorBrewer)#for fancyRplot
rpart.plot(rpart_model, type=4, cex=0.6)
fancyRpartPlot(rpart_model,main="Decision tree", type=4, compress=FALSE,cex=0.7)


#building cp table
printcp(rpart_model)
plotcp(rpart_model)

#tree pruning
pruned_model<-prune(rpart_model,cp=0.011077)
fancyRpartPlot(pruned_model, main="decision tree", type=4, compress=FALSE, cex=0.6)
#dividing the plot areas
par(mfrow=c(1,2))
fancyRpartPlot(rpart_model, main="decision tree", type=4, compress=FALSE, cex=0.5)
fancyRpartPlot(pruned_model, main="decision tree", type=4, compress=FALSE, cex=0.5)


#prediction
rpart_pred<-predict(rpart_model,newdata = test, type="class")
mean(rpart_pred==test$Converted)

conf<-table(test$Converted,rpart_pred)
conf
sum(diag(conf))/sum(conf)*100 #89.46552% 


#actual vs predicted values of test data,calculating efficiency of the model
x<-table(rpart_pred,true=test$Converted)
accuracy<-sum(diag(x))/sum(x)
accuracy 