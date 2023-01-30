library(readr)
mushroom1<-read.csv("c:/Users/Unitech4/Downloads/mushrooms.csv")
View(mushroom1)
mushroom<-mushroom1[,-17]
View(mushroom1)
sum(is.na(mushroom))
library(caret)
set.seed(1)
trainIndex<-createDataPartition(mushroom$class, p=.8, list=FALSE)
Train<-mushroom[trainIndex,]
Test<-mushroom[-trainIndex,]
library(e1071)
model_nb<-naiveBayes(class~., data=Train, laplace=1)
model_nb
pred<-predict(model_nb, newdata=Test)
#pred
confusionMatrix(data=pred, reference=Test$class, positive="e")
pred_test_prob<-predict(model_nb, newdata=Test, type="raw")
#pred_test_prob

library(ROCR)
p_test<-prediction(pred_test_prob[,2], Test$class)
#p_test
perf<- performance(p_test, "tpr", "fpr")
plot(perf, colorize=T)
#AUC-area under the curve
performance(p_test,"auc")@y.values
 




