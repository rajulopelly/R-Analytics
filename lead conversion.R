#setting up the directory
setwd("D://Pranav")
getwd()
#reading the file
library(readxl)
lead<-read_xlsx("lead_conversion2.xlsx")
fix(lead)
?? multicollinearity
#checking the sructure and class of given data
sapply(lead,class)
str(lead)
View(lead)
??correlation
#cleaning the variable Conversion
a<-as.factor(lead$Conversion)
table(a)
a<-factor(lead$Conversion,levels=c("Converted","No"),labels=c(1,0))
table(a)
lead$Conversion<-a
x<-table(lead$Conversion)
pct<-round(x/sum(x)*100)
labels<-c("Converted","NO")
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="")
pie(x,labels = lbls, col=rainbow(length(lbls)),main="conversion")
#cleaning the variable Prospect
a<-as.factor(lead$Prospect)
table(a)
a<-factor(lead$Prospect,levels=c("No","Yes"),labels=c(0,1))
table(a)
lead$Prospect<-a
x<-table(lead$Prospect)
pct<-round(x/sum(x)*100)
labels<-c("No","YES")
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="")
pie(x,labels = lbls, col=rainbow(length(lbls)),main="prospect")
#cleaning the variable Qualification
a<-lead$Qualification
str(a)
patter<-gsub("-","",lead$Qualification)
View(patter)
a<-gsub("[.]","",patter)
table(a)
a<-as.factor(a)
levels(a)<-list(tech=c("BE","BTech","MTech","MCA"),Bus=c("BBA","MBA"),science=c("BSc","MSc"),others=c("CA","Bcom","PharmD","Degree"))
table(a)
str(a)
a<-factor(a,levels=c("tech","Bus","science","others"),labels=c("t","b","s","Oth"))
table(a)
a<-factor(a,levels=c("t","b","s","Oth"),labels=c(0,1,2,3))
lead$Qualification<-a
x<-table(lead$Qualification)
pct<-round(x/sum(x)*100)
labels<-c("engineers","business","statistics","others")
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="")
pie(x,labels = lbls, col=rainbow(length(lbls)),main="qualification")
#removing the variable email-id
a<-lead[,-3]
lead<-a
#cleaning the variable REFERENCE
str(lead$REFERENCE)
table(lead$REFERENCE)
a<-lead$REFERENCE
a<-as.factor(a)
table(a)
a<-factor(a,levels=c("BOARD","FACE BOOK","GOOGLE","INFO@TDS","JUST DAIL","sulekha"),labels=c("B","fb","ggl","mail","jd","sul"))
table(a)
a<-factor(a,levels=c("B","fb","ggl","mail","jd","sul"),labels=c(0,1,2,3,4,5))
lead$REFERENCE<-a
x<-table(lead$REFERENCE)
pct<-round(x/sum(x)*100)
labels<-c("Board","Facebook","Google","Email","Justdail","Sulekha")
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="")
pie(x,labels = lbls, col=rainbow(length(lbls)),main="reference")
#cleaning the variable Branch
table(lead$Branch)
a<-as.factor(lead$Branch)
a<-factor(a,levels=c("MADAPUR","N-GUDA"),labels=c(0,1))
table(a)
lead$Branch<-a
x<-table(lead$Branch)
pct<-round(x/sum(x)*100)
labels<-c("Madhapur","Narayanguda")
lbls<-paste(labels,pct)
lbls<-paste(lbls,"%",sep="")
pie(x,labels=lbls,col=rainbow(length(lbls)),main="BRANCH")
#cleaning the variable Working Status
table(lead$`WORKING STATUS`)
a<-as.factor(lead$`WORKING STATUS`)
a<-factor(a,levels=c("NOT","STUDENT","WORKING"),labels=c(0,1,2))
lead$`WORKING STATUS`<-a
x<-table(lead$`WORKING STATUS`)
pct<-round(x/sum(x)*100)
labels<-c("NOT working","Student","working")
lbls<-paste(labels,pct)
lbls<-paste(lbls,"%",sep="")
pie(x,labels=lbls,col=rainbow(length(lbls)),main="Working Status")
#cleaning the variable Course
table(lead$Course)
a<-as.factor(lead$Course)
levels(a)<-list(BigData=c("BD","BD-REG","BD EVNG","BD WEEKEND"),Python=c("PYTHON","PYTHON WK"),R=c("R","R-REG","R-WEEKEND","R EVNG"),combined=c("BIG DATA HADOOP","R/BD","R/PYTHON","R/PYTHON/BD","BD/R"))
table(a)
a<-factor(a,levels=c("BigData","Python","R","combined"),labels=c("B","P","R","C"))
a<-factor(a,levels=c("B","P","R","C"),labels=c(0,1,2,3))
lead$Course<-a
x<-table(lead$Course)
pct<-round(x/sum(x)*100)
labels<-c("BigData","Python","R","Combined")
lbls<-paste(labels,pct)
lbls<-paste(lbls,"%",sep="")
pie(x,labels=lbls,col=rainbow(length(lbls)),main="Course")

#cleaning the variable REMARKS
table(lead$REMARKS)
a<-which(lead$REMARKS=="Completed the Certification")
b<-which(lead$REMARKS=="Irregular to the class")    
c<-which(lead$REMARKS=="Due to the long distance")
d<-which(lead$REMARKS=="Discontinue the course")
e<-which(lead$REMARKS=="Choosen another Cerrier")
f<-lead[c(a,b,c,d,e),]
g<-lead[-c(a,b,c,d,e),]
g$REMARKS<-"No Clarification"
lead[-c(a,b,c,d,e),]<-g
table(lead$REMARKS)
a<-as.factor(lead$REMARKS)
table(a)
b<-factor(a,levels=c("Choosen another Cerrier","Completed the Certification","Discontinue the course","Irregular to the class","Due to the long distance","No Clarification"),labels=c(0,1,2,3,4,5))
table(b)
lead$REMARKS<-b
table(lead$REMARKS)
x<-table(lead$REMARKS)
pct=round(x/sum(x)*100)
labels=c("another career","completed","discontinued","distance problem","irregular","no clarity")
lbls=paste(labels,pct)
lbls=paste(lbls,"%",sep="")
pie(x,labels=lbls,col=rainbow(length(lbls)),main="Remarks")
#cleaning the variable NEXT FOLLOW-UP
table(lead$`NEXT FOLLOW -UP`)
a<-which(lead$`NEXT FOLLOW -UP`=="Positively Responded")
b<-which(lead$`NEXT FOLLOW -UP`=="Not responding")
c<-lead[c(a,b),]
d<-lead[-c(a,b),]
d$`NEXT FOLLOW -UP`<-"other responses"
lead[-c(a,b),]<-d
a<-as.factor(lead$`NEXT FOLLOW -UP`)
table(a)
a<-factor(a,levels=c("Not responding","other responses","Positively Responded"),labels=c(0,1,2))
View(a)
table(a)
lead$`NEXT FOLLOW -UP`<-a
x<-table(lead$`NEXT FOLLOW -UP`)
pct<-round(x/sum(x)*100)
labels<-c("Not responding","Other responses","Positively responded")
lbls<-paste(labels,pct)
lbls<-paste(lbls,"%",sep="")
pie(x,labels=lbls,col=rainbow(length(lbls)),main="follow up")
#cleaning the variable PLACE
table(lead$PLACE)
rm(i)
a<-as.factor(lead$PLACE)
str(a)
table(a)
a<-which(lead$DISTACE<50)
b<-which(lead$DISTACE>50)
c<-lead[a,]      
d<-lead[b,]
d$PLACE<-"Outside Hyderabad"
c$PLACE<-"In Hyderabad"
lead[a,]<-c
lead[b,]<-d
a<-as.factor(lead$PLACE)
table(a)
b<-factor(a,levels=c("Outside Hyderabad","In Hyderabad"),labels=c(0,1))
table(b)
lead$PLACE<-b
View(lead)
x<-table(lead$PLACE)
pct<-round(x/sum(x)*100)
labels<-c("Outside Hyderabad","In Hyderabad")
lbls<-paste(labels,pct)
lbls<-paste(lbls,"%",sep="")
pie(x,labels=lbls,col=rainbow(length(lbls)),main="place")
colnames(lead)[2] <- "Distance"
lead<-lead[,c(-7)]
fix(lead)
#decision trees
set.seed(100)
train<-sample(nrow(lead),0.7*1136)
traindata<-lead[train,]
testdata<-lead[-train,]
library(rpart)
rpart_model<-rpart(Conversion~.,data=traindata,method="class")
rpart_model
library(rpart.plot)
library(rattle)
library(RColorBrewer)
fancyRpartPlot(rpart_model,main="Decision tree",compress=FALSE,cex=0.5)

#Pruning
table(traindata$Conversion)/nrow(traindata)#efficiency
td_Conversion<-subset(traindata,traindata$Distance<10)#efficiency improvement by altering conditions at node number 3
table(td_Conversion$Conversion)/nrow(td_Conversion)
#comparision of pruned vs original decision table
png(file="project.png",width=1200,height=1400)
#plotting decision tree
fancyRpartPlot(rpart_model,main="Decision tree",compress=FALSE,cex=0.5)
#prediction
rpart_pred<-predict(rpart_model,newdata = testdata[,-c(10)],type="class")
mean(rpart_pred==testdata$Conversion)
#actual vs predicted values of test data,calculating efficiency of the model
x<-table(rpart_pred,true=testdata$Conversion)
accuracy<-sum(diag(x))/sum(x)
accuracy
#building cp table
printcp(rpart_model)
#selecting cp value those with minimum xerror value
opt<-which.min(rpart_model$cptable[,"xerror"])
cp<-rpart_model$cptable[opt,"CP"]
cp
#tree pruning
pruned_model<-prune(rpart_model,cp)
fancyRpartPlot(pruned_model,main="decision tree",compress=FALSE,cex=0.8)
#dividing the plot areas
par(mfrow=c(1,2))
fancyRpartPlot(rpart_model,main="decision tree",compress=FALSE,cex=0.5)
fancyRpartPlot(pruned_model,main="decision tree",compress=FALSE,cex=0.5)
