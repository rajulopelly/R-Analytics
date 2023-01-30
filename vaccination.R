library(readxl)
cv <- read_excel("C:/Users/RAMYA/Desktop/country_vaccinations.xlsx")
View(cv)
#data preprocessing
names(cv)
str(cv)
table(cv$iso_code)
#cv$iso_code<-NULL
cv$date<-as.Date(cv$date)
cv$vaccines<-as.factor(cv$vaccines)
sum(is.na(cv$source_name))
sapply(cv,function(x) sum(is.na(x)))

#https://discuss.analyticsvidhya.com/t/what-should-be-the-allowed-percentage-of-missing-values/2456/9

#outliers check
boxplot(cv$total_vaccinations)
library(VIM)
library(mice)
md.pattern(cv)

#imputing na values
cv<-cv[,-c(2,6,7,9:11)]
names(cv)
library(tidyverse)
#mice imputation of na values
mice_cv<-mice(cv,m=5,maxit = 40,method = "cart")
library(tidyr);library(RCurl)
imputed_cv<-mice::complete(mice_cv,5)
sapply(imputed_cv,function(x) sum(is.na(x)))
#a<-imputed_cv[which(is.na(imputed_cv$source_name))]

#new_DF <- imputed_cv[is.na(imputed_cv$source_name),]
#d<-filter(imputed_cv,imputed_cv$country=="Belize")

mode<-function(x){
  dx<-unique(x)
  dx[which.max(tabulate(match(x,dx)))]
  }
mode(imputed_cv$source_name)
imputed_cv$source_name[which(is.na(imputed_cv$source_name))]<-mode(imputed_cv$source_name)







