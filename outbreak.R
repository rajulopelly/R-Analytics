library(readr)
outbreak <- read_csv("C://Users//Unitech//Desktop//raju//outbreak.csv")
View(outbreak)
r<-outbreak
rm(outbreak)
class(r)
str(r)
library(dplyr)
glimpse(r)
levels(r$age)
table(r$age)
which(r$age=="seven")
r$age[22]=7
which(r$age==622)
r$age[28]=62
s<-as.numeric(r$age)
s
r$age<- s
table(r$sex)
which(r$sex==-1)
r$sex[17]=1
range(r$sex)
table(r$sex)
table(r$timesupper)
sum(is.na(r$timesupper))
table(r$ill)
sum(is.na(r$onsettime))
sum(is.na(r$onsetdate))
table(r$onsetdate)
table(r$onsettime)
mean(r$onsettime,na.rm = TRUE)
table(r$ill)# 46 interviewees got sick and 29 were not
x<-factor(r$sex,levels = c(1,2),labels= c("m","f"))
r$sex<-x
table(r$sex)
y<-filter(r,r$sex=="m" & r$ill==TRUE)#30 males were effected due to outbreak
z<-filter(r,r$sex=="f" & r$ill==TRUE)#16 females were effected due to outbreak
prop.table(r$ill)# overall 21% effected during outbreak
a<-subset(r,r$sex=="m")
b<-subset(r,r$sex=="f")
prop.table(a$ill)
prop.table(b$ill)#females are more effected during to outbreak
d<-subset(r$age,r$ill =="TRUE")
hist(d,col = "red")
e<-subset(r$age,r$ill =="FALSE")
hist(e,col ="green")
table(r$vanilla)
table(r$chocolate)# vanilla has more contaminated
