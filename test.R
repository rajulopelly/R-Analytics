library(tidyverse)
library(readxl)
test <- read_excel("C:/Users/RAMYA/Desktop/test.xlsx")
str(test$StockCode)
View(test)

which(is.na(test$InvoiceNo))
table(test$StockCode)
test$InvoiceNo<-gsub("C","",test$InvoiceNo)
test$InvoiceNo<-as.numeric(test$InvoiceNo)
test$StockCode<-gsub("POST", "84029", test$StockCode)
test$StockCode<-gsub("D", "84029", test$StockCode)
test$StockCode<-gsub("DOT", "84029", test$StockCode)

test$StockCode<-gsub("[a-zA-Z ]", "", test$StockCode)
table(test$StockCode)
test$StockCode<-as.numeric(test$StockCode)

# mode<-function(x){
#   ux<-unique(x)
#   ux[which.max(tabulate(match(x,ux)))]
# }
table(test$InvoiceDate)
test$Country<-gsub("EIRE","Irland",test$Country)
test$InvoiceDate<-as.Date(as.character(as.POSIXct(test$InvoiceDate)))
test$Country<-as.factor(test$Country)


















