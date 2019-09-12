library(readr)
data<-read.csv("C:/Users/Unitech01/Desktop/data analytics/Dataset.csv")
View(data)

#checking for missing values
is.na(data)
sum(is.na(data))
sapply(data, function(x)sum(is.na(x)))
sapply(data, class)
## replacing the missing values
data$BloodSugar[which(is.na(data$BloodSugar))]<-mean(data$BloodSugar,na.rm = T)
sum(is.na(data$BloodSugar))
data$Age[which(is.na(data$Age))]<-median(data$Age,na.rm = T)
sum(is.na(data$Age))
data$Height[which(is.na(data$Height))]<-median(data$Height,na.rm = T)
sum(is.na(data$Height))
summary(data)

## Recoding or (data transformation)
gen<-factor(data$Gender,levels = c("Female","Male"),labels = c(0,1))
gen
data$Gender<-gen
phy<-factor(data$Physicalactivity,levels = c("Yes","No"),labels = c(1,0))
phy
data$Physicalactivity<-phy
obey<-factor(data$Obesity,levels = c("Yes","No"),labels = c(1,0))
obey
data$Obesity<-obey
data$Gender<-as.numeric(data$Gender)

## Outliers
boxplot(data)
# Replacing outliers
data$Age[c(1,2,29)]<-mean(data$Age)

# correlation
cor(data$BloodSugar,data$Age)
cor(data[,-c(4,5,6)])
###
library(corrplot)
corrplot(cor(data[,-c(4,5,6)]))


switch(4,"a","s","d","f","h","j")
switch(2,"red","green","blue")
