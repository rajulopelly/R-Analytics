library(readr)
telecom <- read_csv("C:\\Users\\RAMYA\\Desktop\\data science\\Data Science\\telecom.csv")
View(telecom)
sum(is.na(telecom))
colSums(is.na(telecom))
dim(telecom)
df<-na.omit(telecom)
rm(telecom)
names(df)
table(df$gender)
df$gender[df$gender=="Female"]<- 0
df$gender[df$gender=="Male"]<- 1
class(df$gender)
df$gender<-as.numeric(df$gender)
names(df)
table(df$SeniorCitizen)
table(df$Partner)
df$Partner<-factor(df$Partner,levels = c("No" , "Yes"),labels = c(0,1))
df$Partner<-as.numeric(df$Partner)
table(df$Dependents)
df$Dependents<-factor(df$Dependents,levels = c("No" , "Yes"),labels = c(0,1))
summary(df$tenure)
boxplot(df$tenure)
table(df$PhoneService)
df$PhoneService<-factor(df$PhoneService,levels = c("No" , "Yes"),labels = c(0,1))
df$PhoneService<-as.numeric(df$PhoneService)
table(df$MultipleLines)
df$MultipleLines<-factor(df$MultipleLines,levels = c("No","No phone service","Yes"),labels = c(0,1,2))
df$MultipleLines<-as.numeric(df$MultipleLines)
table(df$InternetService)
df$InternetService<-factor(df$InternetService,levels = c("DSL", "Fiber optic","No"),labels = c(2,1,0))
df$InternetService<-as.numeric(df$InternetService)
table(df$OnlineSecurity)
df$OnlineSecurity<-factor(df$OnlineSecurity,levels = c("No", "No internet service","Yes"),labels = c(0,1,2))
df$OnlineSecurity<-as.numeric(df$OnlineSecurity)
table(df$OnlineBackup)
df$OnlineBackup<-factor(df$OnlineBackup,levels = c("No", "No internet service","Yes"),labels = c(0,1,2))
class(df$OnlineBackup)
df$OnlineBackup<-as.numeric(df$OnlineBackup)
table(df$DeviceProtection)
df$DeviceProtection<-factor(df$DeviceProtection,levels = c("No", "No internet service","Yes"),labels = c(0,1,2))
df$DeviceProtection<-as.numeric(df$DeviceProtection)
table(df$TechSupport)
df$TechSupport<-factor(df$TechSupport,levels = c("No", "No internet service","Yes"),labels = c(0,1,2))
df$TechSupport<-as.numeric(df$TechSupport)
table(df$StreamingTV)
df$StreamingTV[df$StreamingTV=="No"]<-0
df$StreamingTV[df$StreamingTV=="No internet service"]<-1
df$StreamingTV[df$StreamingTV=="Yes"]<-2
df$StreamingTV<-as.numeric(df$StreamingTV)
table(df$StreamingMovies)
df$StreamingMovies<-factor(df$StreamingMovies,levels = c("No", "No internet service","Yes"),labels = c(0,1,2))
df$StreamingMovies<-as.numeric(df$StreamingMovies)
table(df$Contract)
df$Contract[df$Contract=="Month-to-month"]<-0
df$Contract[df$Contract=="One year"]<-1
df$Contract[df$Contract=="Two year"]<-2
df$Contract<-as.numeric(df$Contract)
table(df$PaperlessBilling)
df$PaperlessBilling[df$PaperlessBilling=="No"]<-0
df$PaperlessBilling[df$PaperlessBilling=="Yes"]<-1
df$StreamingMovies<-as.numeric(df$StreamingMovies)
table(df$PaymentMethod)
df$PaymentMethod[df$PaymentMethod=="Bank transfer (automatic)"]<-1
df$PaymentMethod[df$PaymentMethod=="Credit card (automatic)"]<-2
df$PaymentMethod[df$PaymentMethod=="Electronic check"]<-3
df$PaymentMethod[df$PaymentMethod=="Mailed check"]<-4
table(df$Churn)
df$Churn[df$Churn=="No"]<-0
df$Churn[df$Churn=="Yes"]<-1
df$Churn<-as.numeric(df$Churn)
boxplot(df$MonthlyCharges)
boxplot(df$TotalCharges)
str(df)
df$PaperlessBilling<-as.numeric(df$PaperlessBilling)
df$PaymentMethod<-as.numeric(df$PaymentMethod)
df$Dependents<-as.numeric(df$Dependents)
df$customerID<-NULL
#model
library(caret)
data_index<-createDataPartition(df$Churn,p=0.70,list=FALSE)
train<-df[data_index,]
test<-df[-data_index,]
a1<-glm(Churn~.,family = binomial, data=train)
a1
#forward and backward
a2<-step(a1,direction = "forward")
a2
summary(a2)
a3<-step(a1,direction = "backward")
a3
summary(a3)
#final
a4<-subset(test,select = -c(SeniorCitizen,Churn,Dependents,DeviceProtection,OnlineBackup,InternetService))
View(a4)

#prediction
prediction<-predict(a3,newdata=a4)
