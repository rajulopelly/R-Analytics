library(readr)
Forbes <- read_csv("C:/Users/Unitech1/Desktop/questions/Forbes.csv")
View(Forbes)
names(Forbes)
library(dplyr)
glimpse(Forbes)
sapply(Forbes,class)
class(Forbes$Rank)
rank<-gsub("[#]","",Forbes$Rank)
r<-as.numeric(rank)
Forbes$Rank<-r
class(Forbes$`Brand Value`)
brandval<-gsub("[$]","",Forbes$`Brand Value`)
brandval1<-gsub("[B]","",brandval)
b<-as.numeric(brandval1)
Forbes$`Brand Value`<-b
class(Forbes$`1-Yr Value Change`)
vchange<-gsub("[%]","",Forbes$`1-Yr Value Change`)
v<-as.numeric(vchange)
Forbes$`1-Yr Value Change`<-v
class(Forbes$`Brand Revenue`)
brdrev<-gsub("[$]","",Forbes$`Brand Revenue`)
brde<-gsub("[B]","",brdrev)
br<-as.numeric(brde)
Forbes$`Brand Revenue`<-br
class(Forbes$`Company Advertising`)
index<-which(grepl("M",Forbes$`Company Advertising`))
ca<-gsub("[$]","",Forbes$`Company Advertising`)
ca1<-gsub("[B]","",ca)
ca2<-gsub("[M]","",ca1)
ca3<-as.numeric(ca2)
Forbes$`Company Advertising`<-ca3
Forbes$`Company Advertising`[index]<-Forbes$`Company Advertising`[index]/1000
mean(Forbes$`Company Advertising`,na.rm = T)
Forbes$`Company Advertising`[is.na(Forbes$`Company Advertising`)]<-2.2040
plot(Forbes$`Company Advertising`)
sum(is.na(Forbes$`Company Advertising`))
Tech<-filter(Forbes,Forbes$Industry=="Technology")
lux<-filter(Forbes,Forbes$Industry=="Luxury")
auto<-filter(Forbes,Forbes$Industry=="Automotive")
library(ggplot2)
tech<-ggplot(Tech,aes(x=`Company Advertising`,y=`Brand Revenue` ,label=Brand))
tech + geom_point(aes(size=`Brand Value`,color=Brand)) + geom_text() + xlab("Company Advertising in Billions of $") + 
  ylab("Brand Revenue in Billions of $") + ggtitle("Technology")+scale_size_continuous(name="Brand Value $(Billions)",breaks=c(30,60,100))+guides(color=F)+ 
  theme(panel.grid.major=element_line("grey")) + theme_bw() + 
  theme(panel.border=element_rect(color="grey",fill=NA)) + theme(plot.title=element_text(size=50)) + 
  theme(plot.title=element_text(face="bold"))+ theme(panel.grid.minor=element_line("grey")) 
  