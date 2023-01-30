#recency,frequency, monetary(RFM)
library(data.table)
library(dplyr)
library(ggplot2)
library(tidyr)
library(knitr)
library(rmarkdown)
library(readxl)
#importing data set
library(readxl)
Online_Retail <- read_excel("C:/Users/Unitech4/Desktop/Online Retail.xlsx")
View(Online_Retail)
#data cleaning
sum(is.na(Online_Retail))
Online_Retail<-na.omit(Online_Retail)
table(Online_Retail$Country)
Online_Retail$Country<-as.factor(Online_Retail$Country)
levels(Online_Retail$Country)<-list(asia=c("Bahrain" ,"Japan" ,"United Arab Emirates", "Singapore","Saudi Arabia","Cyprus", "Hong Kong" , "Lebanon"  ,"Lithuania " ,"Malta "),europe=c("Finland","Greece" , "Iceland" ,"Israel" ,"Italy" ,"France","Germany" , "Denmark","EIRE","European Community","Channel Islands" ,"Czech Republic" ,"Belgium","Austria","Netherlands", "Norway" ,"Poland" ,"United Kingdom","Switzerland","Portugal" ,"RSA" ,"Spain","Sweden "),australia=("Australia" ),america=c("Brazil","Canada" ,"USA"),others=("Unspecified"))
levels(Online_Retail$Country)
Online_Retail$Country<-factor(Online_Retail$Country,levels = c( "asia","europe","america","australia","others" ),labels =c(1,2,3,4,5))
Online_Retail$UnitPrice<-round(Online_Retail$UnitPrice)
Online_Retail$Description<-NULL
library(arules)
Online_Retail$InvoiceNo=as.factor(Online_Retail$InvoiceNo)
Online_Retail$InvoiceDate=as.Date(Online_Retail$InvoiceDate, "%d-%m-%Y %H:%M")
Online_Retail$CustomerID=as.factor(Online_Retail$CustomerID) 
Online_Retail$Quantity=as.numeric(Online_Retail$ Quantity)
Online_Retail$UnitPrice=as.numeric(Online_Retail$UnitPrice)
Online_Retail$Country=as.factor(Online_Retail$Country)
Online_Retail <- Online_Retail %>% 
  mutate(total_dolar = Quantity*UnitPrice)
Online_Retail$Country<-NULL
# construct a data frame with the necessary columns of customer ID, transaction date, and money amount paid by a customer per transaction
Online_Retail <- as.data.frame(cbind(Online_Retail[,6],Online_Retail[,1],Online_Retail[,2],Online_Retail[,4],Online_Retail[,7]))
names(Online_Retail)

max(Online_Retail$InvoiceDate)
min(Online_Retail$InvoiceDate)
#RFM model
library(rfm)
library(tidyverse)
library(knitr)
Online_Retail$InvoiceDate=as.Date(Online_Retail$InvoiceDate, "%d-%m-%Y %H:%M")
Online_Retail$StockCode<-NULL
rfm <-Online_Retail %>% 
  group_by(CustomerID) %>% 
  summarise(recency=as.numeric(as.Date("2012-01-01")-max(InvoiceDate)),
            frequency=n_distinct(InvoiceNo), monitery= sum(total_dolar)/n_distinct(InvoiceNo)) 
rfm

summary(rfm)
#------------------------------OR-------------------------------------------------
#library(sqldf)
#Online_Retail=sqldf("SELECT CustomerID,MIN(days_since)  AS 'recency',
#                                     COUNT(InvoiceNo) AS 'frequency',
#                                     AVG(purchase_amount) as 'amount'
#                                     from Online_Retail group by 1")
#
#---------------------------------------------------------------------------------
kable(head(rfm))

hist(rfm$recency)
hist(rfm$frequency)
hist(rfm$monitery,breaks =100)
sum(is.na(rfm))
max(rfm$recency)
any(is.na(rfm$recency))
quantile(rfm$recency)
na.omit(rfm)
rfm$recency<-as.numeric(rfm$recency)

q_r<-ifelse(rfm$recency<=quantile(rfm$recency,c(0.25)),1,
                         ifelse(rfm$recency<=quantile(rfm$recency,c(0.50)),2,
                         ifelse(rfm$recency<=quantile(rfm$recency,c(0.75)),3,
                         ifelse(rfm$recency<=quantile(rfm$recency,c(1)),4,NA))))

quantile(rfm$frequency)
q_f<-ifelse(rfm$frequency<=quantile(rfm$frequency,c(0.25)),4,
                         ifelse(rfm$frequency<=quantile(rfm$frequency,c(0.50)),3,
                         ifelse(rfm$frequency<=quantile(rfm$frequency,c(0.75)),2,
                         ifelse(rfm$frequency<=quantile(rfm$frequency,c(1)),1,NA))))

quantile(rfm$monitery)
summary(rfm$monitery)

q_m<-ifelse(rfm$monitery<=quantile(rfm$monitery,c(0.25)),4,
                         ifelse(rfm$monitery<=quantile(rfm$monitery,c(0.50)),3,
                         ifelse(rfm$monitery<=quantile(rfm$monitery,c(0.75)),2,
                         ifelse(rfm$monitery<=quantile(rfm$monitery,c(1)),1,NA))))

  

rfmmodel<-data.frame(rfm,q_r,q_f,q_m)
rfmmodel$q_r<-as.numeric(rfmmodel$q_r)
rfmmodel$q_f<-as.numeric(rfmmodel$q_f)
rfmmodel$q_m<-as.numeric(rfmmodel$q_m)

class1<-which(rfmmodel$q_r==1 , rfmmodel$q_f==1 , rfmmodel$q_m==1)
class1
class2<-which(rfmmodel$q_r==2 , rfmmodel$q_f==2 , rfmmodel$q_m==2)
class3<-which(rfmmodel$q_r==3 , rfmmodel$q_f==3 , rfmmodel$q_m==3)
class4<-which(rfmmodel$q_r==4 , rfmmodel$q_f==4 , rfmmodel$q_m==4)    
best_customer<-data.frame(rfmmodel,class1,class2,class3,class4)
getIndependentScore(rfmmodel,q_r=1,q_f=1,q_m=1)

write.csv(rfmmodel,"C:/Users/Unitech4/Desktop/Online Retail.csv")



#---------------------RFM Segments That Make Sales----------------------------#
#   1.  Core - Your Best Customers
#   2.  Loyal - Your Most Loyal Customers
#   3.  Whales - Your Highest Paying Customers
#   4.  Promising - Faithful customers
#   5.  Rookies - Your Newest Customers
#   6.  Slipping - Once Loyal, Now Gone
#-----------------------------------------------------------------------------#

#1.  Core - Your Best Customers
bestcustomers<-filter(rfmmodel,rfmmodel$q_r=="1" & rfmmodel$q_f=="1" & rfmmodel$q_m=="1")
bestcustomers
# 2.  Loyal - Your Most Loyal Customers
LoyalCustomers<-which(rfmmodel$q_f=="1")
LoyalCustomers
#3.  Whales - Your Highest Paying Customers
HighestPayingCustomers<-which(rfmmodel$q_m=="1")
HighestPayingCustomers
# 4.  Promising - Faithful customers
Faithfulcustomers<-filter(rfmmodel,rfmmodel$q_f=="1" & rfmmodel$q_m=="4")
Faithfulcustomers
# 5.  Rookies - Your Newest Customers
Rookies<-which(rfmmodel$q_r=="1")
Rookies
# 6.  Slipping - Once Loyal, Now Gone
Slippingcustomers<-filter(rfmmodel,rfmmodel$q_r=="4" & rfmmodel$q_f=="1")
Slippingcustomers                       
library(sqldf)
summary(rfm)
######################MODEL COMPLETED###################################
#---------------------------PREPARING AND TRANSFORMING  DATA----------------------#
#take log and transform the monitory value
boxplot(rfm)
rfm$monitery[which(rfm$monitery<1)]<- 228.5
rfm$monitery<-log(rfm$monitery)
hist(rfm$monitery)
#standardise rfm data
rfm$CustomerID<-NULL
rfm =scale(rfm)
head(rfm)
#------------------------------HEIRARCHIAL SEGMENTATION----------------------#
#COMPUTE DISTANCE MATRIX FOR IT TO PLOT DENDOGRAM
summary(rfm)
d <- dist(rfm)
c <- hclust(d, method = 'ward.D2')
plot(c)
#cut at9 seg

