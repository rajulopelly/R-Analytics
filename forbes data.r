library(readr)
Forbe <- read_csv("C:/Users/unitech09/Desktop/Forbes.csv")
View(Forbe)
f<-Forbe
class(f)
names(f)
str(f)
glimpse(f)
mode(f$Rank)
mode(f$Brand)
glimpse(f)
class(f)
class(rank)
a<-gsub("[#]","",f$Rank)
class(a)
a1<-as.numeric(a)
a1->f$Rank
b<-gsub("[$]","",f$`Brand Value`)
b1<-gsub("[B]","",b)  
b2<-as.numeric(b1)
b2->f$`Brand Value`
class(b2)
c<-gsub("[$]","",f$`Brand Revenue`)
c1<-gsub("[B]","",c)
c2<-as.numeric(c1)
c2->f$`Brand Revenue`
d<-gsub("[$]","",f$`Company Advertising`)
d1<-gsub("[B]","",d)
d2<-gsub("[M/1000]","",d1)

d3<-as.numeric(d2)
d3->f$`Company Advertising`
table(f$Industry)
e<-subset(f,f$Industry)
