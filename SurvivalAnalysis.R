getwd()
setwd("D:/Survival Analysis")
#installing required packages
install.packages("psych")
install.packages("gmodels")  
install.packages("stargazer")
install.packages("survival")
install.packages("survminer")
#libraries
library(psych)
library(gmodels)
library(stargazer)
library(survival)
library(survminer)
load(file="pbc.Rdata")
sapply(pbc, class)
table(pbc$histol)
pbc.survival<-with(pbc,Surv(years,status))
#descriptive summaries
describe(pbc$bilirubin)
describe(pbc$years)
#discreete variables
#for rx
freq<-table(pbc$rx)
n<-length(pbc$rx)
relfr<-round(freq/n,digits=4)
cumfr<-cumsum(freq)
cumrelfr<-round(cumsum(relfr),digits=4)
tablerx<-cbind(freq,relfr,cumfr,cumrelfr)
colnames(tablerx)<-c("Freq","%","Cumfreq","cum%")
paste("rx=treatment/randomisation")
tablerx

#for histol
freq<-table(pbc$histol)
n<-length(pbc$histol)
relfr<-round(freq/n,digits=4)
cumfr<-cumsum(freq)
cumrelfr<-round(cumsum(relfr),digits = 4)
tablehist<-cbind(freq,relfr,cumfr,cumrelfr)
colnames(tablehist)<-c("freq","%","cumfreq","cum%")
paste("histol=Severity of liver damage at diagnosis")
tablehist

#cross table for events vs treatments
CrossTable(pbc$rx,pbc$status,digits=2,prop.c=FALSE,prop.t = FALSE,
           prop.chisq = FALSE,expected = FALSE,dnn=c("Treatment/Randomization","Event"))
#Kaplan-Meier Curve-calculates estimated time patients live after a certain amount of treatment
#overall survival rate
kmall<-survfit(formula = pbc.survival~1,data=pbc)
str(kmall)
m1<-(kmall$lower)
summary(kmall)
#survival by randomization/treatment
kmrx<-survfit(pbc.survival~rx,data=pbc)
summary(kmrx)
m2<-(kmrx$lower)
#Kaplan Meier Plot
#overall
plot(kmall,xlab="Years",ylab="%surviving",yscale=100,main="Survival Distribution Overall")
#randomization/treatment
plot(kmrx,xlab="years",ylab="%surviving",yscale = 100,main="Surviving distributions by RX",col=c("red","blue"))
legend("topright",c("Control","DPCA"),fill=c("red","blue"))
#Log Rank test of equality of Survival over the groups

survdiff(formula=pbc.survival~rx,data=pbc)



#COX PH model Regression
#for first predictor variable 
modelrx<-coxph(pbc.survival~rx,data=pbc)
modelrx
#for 2nd predictor variable histol which is to be used as factor
modelhistol<-coxph(pbc.survival~(histol),data=pbc)
modelhistol
# for 3rd predictor variable which is continous
modelbili<-coxph(pbc.survival~bilirubin,data=pbc)
modelbili

#Displaying models side by side
stargazer(modelrx,modelhistol,modelbili,type="text")

##multivariable modelling

#fitting rx variable
modelrx<-coxph(pbc.survival~rx,data=pbc)
modelrx

#fitting histol and rx variables
modelhistrx<-coxph(pbc.survival~rx+factor(histol),data=pbc)
modelhistrx

#fitting rx and bilirubin variables
modelrxbili<-coxph(pbc.survival~rx+bilirubin,data=pbc)
modelrxbili

#fitting bilirubin,histol and rx variables
modelallpred<-coxph(pbc.survival~rx+(histol)+bilirubin,data=pbc)
modelallpred
ggforest(modelallpred,data=pbc.survival)

#fitting bilirubin and histol variables
modelhistbili<-coxph(pbc.survival~factor(histol)+bilirubin,data=pbc)
modelhistbili
#comparision of all models
stargazer(modelrx,modelhistrx,modelallpred,type="text")

##Likelihood Ratio Test
#for Histol+rx=FULL,Histol=REDUCED
anova(modelhistol,modelhistrx)
#for bilirubin=REDUCED,bilirubin+rx=FULL
anova(modelbili,modelrxbili)
#for bilirubin+histol=REDUCED,bilirubin+rx+histol=FULL
anova(modelhistbili,modelallpred)


##TESTING of Regression
cox.zph(modelallpred,transform ="km",global = TRUE)

#Preliminary Test assumptions
test.ph<-cox.zph(modelallpred,transform = "km",global = TRUE)
test.ph

##graphical assesment predictor wise
plot(test.ph[2],main="histology severity==2")
abline(h=0)

plot(test.ph[3],main="histology severity==3")
abline(h=0)

plot(test.ph[4],main="histology severity==4")
abline(h=0)

plot(test.ph[5],main="bilirubin")
abline(h=0)

plot(test.ph[1],main="Randomization")
abline(h=0)
