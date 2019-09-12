#Decision Trees
library(rpart)
library(mlbench)
install.packages("mlbench")
library(mlbench)
data("Ionosphere")
View(Ionosphere)
names(Ionosphere)
class(Ionosphere)
str(Ionosphere)
set.seed(100)
b<-ifelse(runif(nrow(Ionosphere))<0.8,1,0)
Ionosphere[,"train"]<-b
trainset<-Ionosphere[Ionosphere$train==1,]
testset<-Ionosphere[Ionosphere$train==0,]
trainset<-trainset[,-Ionosphere$train]
testset<-testset[,-Ionosphere$train]
a<-sample(nrow(Ionosphere),246)
data1<-Ionosphere
train<-data1[a,]
test<-data1[-a,]
remove(a)
remove(train)
remove(test)
#rpart
library(rpart)
rpart_model<-rpart(Class~.,data=trainset)
rpart_model
library(rpart.plot)
install.packages("rpart.plot")
library(rattle)
install.packages("rattle")
install.packages("RColorBrewer")
library(RColorBrewer)
fancyRpartPlot(rpart_model,main="Decision Tree")
dev.off()

rpart_predict<-predict(rpart_model,testdata1[,],type="class")
