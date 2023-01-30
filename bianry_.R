#Data Exporation

library(readr)
binary <- read.csv("C:/Users/unitech1/desktop/excel/binary.csv")
View(binary)
names(binary)
nrow(binary)
ncol(binary)
head(binary)
is.na(binary)
sum(is.na(binary))


#consider variable ADMIT

class(binary$admit)
ad<-as.numeric(as.integer(binary$admit))
ad
class(ad)
plot(ad)
sum(ad)
table(ad)


#consider variable GRE

class(binary$gre)
head(binary$gre)
tail(binary$gre)
Gre<-as.numeric(as.integer(binary$gre))
Gre
hist(Gre, xlab = "GRE Score", main = "Overall GRE scrore view")
table(Gre)
boxplot(Gre)
range(Gre)
subset(binary, Gre < 340)
Gre <- binary[c(72,180,305,316), ]

binary1<-binary[-c(72,180,305,316), ]
View(binary1)
class(binary1$gre)
GRE <- as.numeric(as.integer(binary1$gre))
class(GRE)
GRE
hist(GRE, xlab = "GRE Score", main = "Overall GRE scrore view")
boxplot(GRE)
plot(GRE)

#consider variable GPA

class(binary$gpa)
head(binary$gpa)
hist(binary$gpa, xlab = "GPA", main = "Overall view of GPA")
boxplot(binary$gpa)
range(binary$gpa)
GPA <- binary$gpa
GPA
subset(binary, GPA < 2.5)
subset(binary, GPA < 2.4)
binary2 <- binary[-c(290), ]
View(binary2)
boxplot(binary2$gpa)


#consider variable RANK

class(binary$rank)
RANK <- as.numeric(as.integer(binary$rank))
class(RANK)
RANK
plot(RANK)
barplot(RANK)
boxplot(RANK)
hist(RANK, xlab = "Student RANKS", main = "Overall RANKS view")

#two way contigency table of categorical outcome & predictors
#make sure there are no 0 cells

xtabs(~admit+rank, data = binary)

#Rank is treated as a categorical variable

binary$rank <- factor(binary$rank)

#Split data into Training (80%) and validation (20%) datasets

set.seed(2)
ind <- sample(2,nrow(binary),replace = TRUE, prob = c(0.8,.2))
tdata <-binary[ind==1,]
vdata <-binary[ind==2,]

#Logistic model

mylogi <- glm(admit~gre+gpa+rank,data = tdata, family = "binomial")
summary(mylogi)

# ROC curves
library(ROCR)
data$score<-predict(mylogi,newdata=subset(tdata,select=c(2,3,4),type='response'))
pred<-prediction(tdata$score ,tdata$admit)
pref<-performance(pred,"tpr","fpr")
plot(pref)
abline(0,1,lty=8,col='red')
# confusion Matrix
y_pred<-ifelse(tdata$score>0.5,1,0)
cm<-table(tdata$admit,y_pred)
cm
# Efficiency
efficiency<-sum(diag(cm))/sum(cm)
efficiency

