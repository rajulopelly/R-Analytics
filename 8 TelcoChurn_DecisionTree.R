library(rpart)
library(rpart.plot)
library(caret)
library(car)
library(rattle)
library(readr)

data1<-read.csv("C:\\Users\\RAMYA\\Desktop\\data science\\Data Science\\TelcoCustomerChurn.csv")
dim(data1)
names(data1)
str(data1)
View(data1)
rm(data1)
data2<-subset(data1,select = -customerID)
View(data2)
## Data Partition
set.seed(123)
data_index<-createDataPartition(data2$Churn,p=0.75,list = F)
train<-data2[data_index,]
View(train)
dim(train)
test<-data2[-data_index,]
View(test)
dim(test)
dim(data2)

## Model Building
m1<-rpart(Churn~.,data = train2,method = "class")
m1
summary(m1)
## Visualize the Decision Tree - m1
rpart.plot(m1,cex = 0.8,type = 4)
fancyRpartPlot(m1,cex=0.8,type=4)
printcp(m1)

## Based on Variable Importance - Drop insignificant Variables - m1
train1<-subset(train,select = -c(Partner,StreamingTV))
train2<-subset(train1,select = -StreamingMovies)

printcp(m1)
plotcp(m1)

## Setting Control parameter as 0.0005 for m2 - Old Method
cpcontrol<-rpart.control(0.0005)
m2<-rpart(Churn~.,data = train2,method = "class",control = cpcontrol)
summary(m2)

## Visualize the Decision Tree - m2
rpart.plot(m2,cex = 0.8,type = 4)
fancyRpartPlot(m2,cex=0.8,type=4)
printcp(m2)
plotcp(m2)

## For both m1 and m2 -> Optimum Value for Pruning CP=0.01(from plot)

model_prune<-prune(m2,0.01)
## Visualize the Pruned Decision Tree
rpart.plot(model_prune,cex = 0.8,type = 4)
fancyRpartPlot(m2,cex=0.8,type=4)
printcp(model_prune)
plotcp(model_prune)

## pruning was not effective as both models (m2 and model_prune) are same.

#prediction
test1<-subset(test,select = -Churn)
predictor<-predict(m2,newdata = test1,type="class")
results<-data.frame(original=test$Churn,estimated=predictor)
View(results)

#confusion matrix
mat1<-table(results$original,results$estimated)
#efficiency
(sum(diag(mat1))/sum(mat1))*100

