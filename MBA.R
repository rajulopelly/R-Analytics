library(readxl)
library(tidyverse)
library(readxl)
library(knitr)
library(ggplot2)
library(lubridate)
library(arules)
library(arulesViz)
library(plyr)
#Importing dataset
library(readxl)
Online_Retail <- read_excel("C:/Users/Unitech4/Desktop/Online Retail.xlsx")
View(Online_Retail)
retail<-Online_Retail
#Data preprocessing and exploring
retail <- retail[complete.cases(retail), ]
retail %>% mutate(Description = as.factor(Description))
retail %>% mutate(Country = as.factor(Country))
retail$Date <- as.Date(retail$InvoiceDate)
retail$Time <- format(retail$InvoiceDate,"%H:%M:%S")
retail$InvoiceNo <- as.numeric(as.character(retail$InvoiceNo))
glimpse(retail)
##What time do people often purchase online?
#In order to find the answer to this question,
#we need to extract "hour" from the time column.
retail$Time <- as.factor(retail$Time)
##Association rules for online retailer
#Before using any rule mining algorithm, 
#we need to transform the data from the data frame format, 
#into transactions such that we have all the items bought together in one row.
library(plyr)
fix(retail)
retail_sorted <- retail[order(retail$CustomerID),]
itemList <- ddply(retail,c("CustomerID","Date"),function(df1)paste(df1$Description,collapse = ","))
View(itemList)
#We only need item transactions, so remove customerID and Date columns.
itemList$CustomerID <- NULL
itemList$Date <- NULL
colnames(itemList) <- c("items")
#Write the data fram to a csv file and check whether our transaction format is correct.
write.csv(itemList,"transaction.csv", quote = FALSE, row.names = TRUE)
write.csv(itemList,"C:/Users/Unitech4/Desktop/transaction.csv")

#Let's have a closer look at how many transactions we have and what they are.
cart<- read.transactions('transaction.csv', format = 'basket', sep=',')
cart
summary(cart)
#Let's have a look at the item frequency plot
itemFrequencyPlot(cart, topN=20, type='absolute')
#Have a look at the summary of the rules
rules1<-apriori(cart)
rules2 <- apriori(cart, parameter = list(supp=0.01, conf=0.8))
inspect(rules2[1:5])
rules <- apriori(cart, parameter = list(supp=0.001, conf=0.8))
inspect(rules[1:5])
rules <- sort(rules, by='confidence', decreasing = TRUE)
summary(rules)
#We have  87115 rules. I don't want to print them all, so let's inspect the top 10.
inspect(rules[1:10])
#plot these top 10 rules.
topRules <- rules[1:10]
plot(topRules)
plot(topRules, method="graph")
plot(topRules, method = "grouped")

