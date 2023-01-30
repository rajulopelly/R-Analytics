library(tidyverse)
library(readxl)
df<-read_xlsx("C:\\Users\\RAMYA\\Desktop\\Redwinequality.xlsx")

# The 11 variables in the dataset can be effecting the quality of the Redwine

colSums(is.na(df))
names(df)
str(df)

#"fixed acidity"
range(df$`fixed acidity`)
plot.default(df$`fixed acidity`)
quantile(df$`fixed acidity`)
boxplot.default(df$`fixed acidity`)
#a<-df$`fixed acidity`
#IQR
Q1<-7.1
Q3<-9.2
IQR<-Q3-Q1
upperbound<-Q3+1.5*IQR
upperbound
#a[a>12.35]
df$`fixed acidity`[df$`fixed acidity`>upperbound]<-12.35

mode<-function(x){
  ux<-unique(x)
  ux[which.max(tabulate(match(x,ux)))]
    
}
mode(df$`fixed acidity`)

summary(df$`fixed acidity`)
library(psych)
describe(df)

library(moments)
skewness(df$`fixed acidity`)
kurtosis(df$`fixed acidity`)

# citric acid         

summary(df$`volatile acidity`)
boxplot(df$`volatile acidity`)
IQR(df$`volatile acidity`)
upp_b1<-0.64+1.5*0.25
upp_b1
#b<-subset(df,df$`volatile acidity`>1.015)
df$`volatile acidity`[df$`volatile acidity`>upp_b1]<-1.015
summary(df$`volatile acidity`)

skewness(df$`volatile acidity`)
kurtosis(df$`volatile acidity`)

#standardisation & normalization
#scale()

#free sulpher dioxide
IQR(df$`free sulfur dioxide`)
quantile(df$`free sulfur dioxide`)
upp_b4<-21+1.5*14
df$`free sulfur dioxide`[df$`free sulfur dioxide`>upp_b4]<-upp_b4
boxplot(df$`free sulfur dioxide`)
describe(df$`total sulfur dioxide`)
boxplot(df)

#residual sugar
IQR(df$`residual sugar`)
quantile(df$`residual sugar`)
describe(df$`residual sugar`)
upp_b5<-7.6+1.5*0.7
upp_b5
df$`residual sugar`[df$`residual sugar`>upp_b5]<-upp_b5

#total sulfur dioxide
describe(df$`total sulfur dioxide`)
summary(df$`total sulfur dioxide`)
plot(df$`total sulfur dioxide`)
which(df$`total sulfur dioxide`>250)
df$`total sulfur dioxide`[df$`total sulfur dioxide`=="289"]<-47
df$`total sulfur dioxide`[df$`total sulfur dioxide`=="278"]<-47
plot(df$`total sulfur dioxide`)
boxplot(df$`total sulfur dioxide`)
quantile(df$`total sulfur dioxide`)
describe(df$`total sulfur dioxide`)
IQR(df$`total sulfur dioxide`)
upp_b3<-62+1.5*40
upp_b3
df$`total sulfur dioxide`[df$`total sulfur dioxide`>upp_b3]<-upp_b3



#density#pH"

describe(df$sulphates)
boxplot(df$sulphates)
#c<-subset(df,df$sulphates>1)
IQR(df$sulphates)
summary(df$sulphates)
upp_b2<-0.7300+1.5*0.18
upp_b2
df$sulphates[df$sulphates>upp_b2]<-1
describe(df$alcohol)
plot(df$pH)
boxplot(df)


#correlation
library(corrplot)
M<-cor(df)
M
corrplot(M,method = "square")
#create data partition
library(caret)
index<-createDataPartition(df$quality,p=0.70,list = F)
train<-df[index,]
test<-df[-index,]

describe(train)
describe(test)
boxplot(train)
boxplot(test)

#Regression model
library(car)
model1<-lm(quality~.,data = train)
summary(model1)

# A large difference between the R-Squared and Adjusted R-squared is not appreciated 
# and generally indicates that multicollinearity exists within the data.
 
# The R-squared value is formally called a coefficient of determination
# The value of R-squared lies between 0 to 1. In practical applications, 
# if the R2 value is higher than 0.70, we consider it a good model.

# According to the p-values < 0.05, our model is significant.

AIC(model1)
#BASIAN INFORMATION CRITERIA
BIC(model1)
 
# Root Mean Square Error(RMSE) - By comparing the RMSE statistics of 
# different models, we can decide which is a better model. 
# The model with the lower RMSE value is considered a better model.

library(Metrics)
rmse(train$quality,model1$fitted.values)

#checking it is normal destribution or not

hist(model1$residuals,color="grey")

#checking homeoskedosticity
#follow normal distribution
#no multicollinearity
#There is no multicollinearity problem in the dataset. 
#Generally, VIF values which are greater than 5 or 7 are 
#the cause of multicollinearity
#no auto serial correlation
# Durbin-Watson test(dw test). The test returns a value between 0 and 4.
# If the value is two, we say there is no auto serial correlation. 
# However, a value higher than 2 represents (-) ve correlation and value lower 
# than 2 represents (+) ve correlation.
library(lmtest)
dwtest(model1)
#We got a value of 1.7567 which suggests that there is no auto serial correlation.

vif(model1)
plot(model1)


test$predictedquality<-predict(model1,test)

head(test[,c("predictedquality","quality")])











