# First we load the libraries
library(dplyr)
library(caret)
library(caret)
library(e1071)
## Loading required package: lattice
## Loading required package: ggplot2
# Then we load the dataset
data("iris")
str(iris)
View(iris)
dim(iris)
plot(iris)
table(iris$Species)
iris$Species<-factor(iris$Species,levels = c("setosa", "versicolor","virginica"),labels =c(1,2,3))
iris$Species<-as.numeric(iris$Species)
#normalisation or standardisation of the data
iris<-scale(iris)
# We create a 75% training dataset
set.seed(100)
my_index <- createDataPartition(iris$Sepal.Length, p = 0.75, list = F)
trainSet <- iris[my_index, ]
testSet <- iris[-my_index, ]
# The tuneLength parameter tells the algorithm to try different default values for the main parameter
set.seed(123)
my_knn_model <- train(Species ~ .,
                      method = "knn",
                      
                      tuneLength = 4)
# In this case we used 4 default values 
my_knn_model
set.seed(123)
my_knn_model <- train(Species ~ .,
                      method = "knn",
                      data = trainSet,trControl=trctrl,
                      preProcess = c("center", "scale"),
                      tuneLength = 7)

# In this case we used 7 default values 
my_knn_model
set.seed(123)
my_knn_model <- train(Species ~ .,
                      method = "knn",
                      data = trainSet,trControl=trctrl,
                      preProcess = c("center", "scale"),
                      tuneGrid = expand.grid(k = c(5, 11, 21, 25)))

# In this case we used the values 5, 11, 21 and 25
my_knn_model

#predicting the data
test_pred <- predict(knn_fit, newdata = testing)
test_pred

#confusion matrix
confusionMatrix(test_pred, testing$V1 )
Confusion Matrix and Statistics
model1 <- train(Win.Loss~. , data = train, method = ?knn?,
                preProcess = c(?center?,?scale?),
                trControl = x,
                metric = ?ROC?,
                tuneLength = tunel)

# Summary of model
model1
plot(model1)
# Validation
valid_pred <- predict(model1,validation, type = "prob")

#Storing Model Performance Scores
library(ROCR)
pred_val <-prediction(valid_pred[,2],validation$Win.Loss)

# Calculating Area under Curve (AUC)
perf_val <- performance(pred_val,"auc")
perf_val

# Plot AUC
perf_val <- performance(pred_val, "tpr", "fpr")
plot(perf_val, col = "green", lwd = 1.5)

#Calculating KS statistics
ks <- max(attr(perf_val, "y.values")[[1]] - (attr(perf_val, "x.values")[[1]]))
ks