#to get list of inbuilt datasets
data()
#select data and read the dataset
data(iris)
  #OR
setwd("D:\\BSH\\TDS\\Batch4\\Data")
getwd()
ir<-read.csv("D:\\BSH\\TDS\\Batch4\\Data\\indianrevenue.csv",header = T,sep = "")


setwd("C:\\Users\\admin\\Desktop\\BA using R\\R_updated\\B2_TDS")
getwd()
read.csv("C:\\Users\\admin\\Desktop\\BA using R\\R_updated\\B2_TDS\\sampledata.csv")
#Overview of data
data(iris)
dim(iris)
str(iris)
library(dplyr)
glimpse(iris)
ls(iris)
names(iris)
nrow(iris)
ncol(iris)
head(iris) 
head(LungCapData)
tail(iris)
levels(iris$Sepal.Length)
class(iris$Sepal.Length)
mode(iris$Sepal.Length)
class(iris$Species)
levels(iris$Species)
levels(iris$Sepal.Length)


data("iris")
View(iris)
is.numeric(iris$Sepal.Length)
is.numeric(iris$Species)
iris<-as.numeric(iris$Species)
as.factor(iris$Sepal.Length)
iris<-as.factor(iris$Sepal.Length)
iris1<-as.numeric(iris$Species)
iris1
str(iris)

is.na(iris)
sum(is.na(iris))

any(is.na(iris))
sum(is.na(iris))




###counting and identifying NA
#missing values are represented by the symbol NA (not available). Impossible values (e.g., dividing by zero) are represented by the symbol NaN 
data("airquality")
aq<-data("airquality")
dim(airquality)
is.na(airquality)#Is it NA
any(is.na(airquality))# does it have any NA's
sum(is.na(airquality))  #total of NA's
which (is.na(airquality)) #Which one is NA?
summary(airquality) #which variable has NA's
describe(airquality)
library(psych)

complete.cases(airquality) #complete.cases() is a logical vector with the value TRUE for rows that are complete, and FALSE for rows that have some NA values

#To remove the rows with missing data 
x <- airquality[complete.cases(airquality), ]
str(x)
is.na(x)
any(is.na(x))

sum(is.na(x))
#to omit all rows that contain NA values
x <- na.omit(airquality)
x
#to drop missing values in vector x
x[!is.na(x)]# without NA's
sum(is.na(x))
######na.omit is nicer for just removing all NA's. complete.cases allows partial selection by including only certain columns of the dataframe####
#sum(row.has.na)

#replacing NA's by zero
airquality$Ozone[is.na(airquality$Ozone)]<-0
#if u use attach then....
attach(airquality)
class(Wind)
sum(is.na(Ozone))
Ozone[is.na(Ozone)]<-0
detach(airquality)
airquality$Solar.R[is.na(airquality$Solar.R)]<-0
summary(airquality)  # verification of NA's after replacing by zero
sum(is.na(airquality))  # verification of NA's after replacing by zero

install.packages("psych")
library(psych)
describe(iris)
summary(USArrests)
cor(USArrests)

data(mtcars)
dim(mtcars)
m1<-mtcars[,2:4]
m2<-mtcars[,c(2,4)]




#identification of variable (i.e., chr, num,fact,...)
A <- "hello"; B <- TRUE; C <- 1i
mode(A);mode(B);mode(C)
#OR
class(A);class(B);class(C)

str(x)
    #OR
sapply(x,class)#each element of vector


#is.foo to test for data type foo. Returns TRUE or FALSE & as.foo to explicitly convert it.

sapply(iris,class)#eachvariable in dataset
is.numeric(iris$Sepal.Length)
is.numeric(iris$Species)
#levels in factor variables
levels(iris$Species)
#to convert int to categorical
sapply(x,class)
x$Day <- as.factor(x$Day)
levels(x$Day)
#conversion of numeric to date
as.Date("20171110", "%Y%m%d")



#conversion of factors to numeric
iris$Species <- as.numeric(iris$Species)
class(iris$Species)
#To change to categorical variables
iris$Sepal.Length<-as.factor(iris$Sepal.Length)
class(iris$Sepal.Length)

#Create, Rename, Recode and Merge Variables in R
#To create a new variable or to transform an old variable to a new one, The common function to use is newvariable <- oldvariable.
hospital <- c("New York", "California")
patients <- c(150, 350)
costs <- c(3.1, 2.5)
df <- data.frame(hospital, patients, costs)
#creating a new variable called totcosts
df$totcosts <- df$patients * df$costs
df
#rename the variable
df$costs_euro <- df$costs 
#delete the variable by using command NULL
df$costs <- NULL
#recode variable
df$patients <- ifelse(df$patients==150, 100, ifelse(df$patients==300, 150, NA))
#Merging data sets
#You can merge columns, by adding new variables; or you can merge rows, by adding observations
#To add columns use the function merge() which requires that datasets.You will merge to have a common variable. 
#In case that datasets doesn't have a common variable use the function cbind. However, for using function cbind is necessary that both datasets to be in same order.
#Merge dataset1 and dataset2 by variable id
finaldt <- merge(dataset1, dataset2, by="id")
#OR
finaldt <- cbind(dataset1, dataset2)
#To add rows use the function rbind. 
#When you merge datasets by rows is important that datasets have exactly the same variable names and a same number of variables.
finaldt <- rbind(dataset1, dataset2)

data(iris)
View(iris)
attach(iris)
tapply(Sepal.Length,Species,summary)
attach(airquality)
sapply(Sepal.Length,Species,simplify=FLASE,user.name=TRUE)
summary(iris)
describe(iris)
library(psych)
####pipes in dplyr
library(dplyr)
#library(tidyverse)
data("iris")
read.csv(iris)
iris1<-select(iris,-Sepal.Width)
iris2<-filter(iris1,Species=='setosa' & Sepal.Length>5)
dim(iris1)
arrange(iris,desc(Sepal.Length),desc(Sepal.Width))
iris4<-mutate(iris,Sepal.Diff=Sepal.Length*2)
iris3<-mutate(iris,size=ifelse(Sepal.Length>6,'Large','Small'))
summarize(iris,ave_sepal_length=mean(Sepal.Length),med_sepal_width=median(Sepal.Width))


####Indexing colm in data frames
#Conditional statement include/exclude rows, indexing with
#logical vector sapply(),dplyr::select()
library(ggplot2)#using diamond set for this package
mydata<-diamonds
str(mydata)
ncol(mydata)
names(mydata)
mydatanew<-mydata[1]
names(mydatanew)
mydatanew<-mydata[1:3]
names(mydatanew)
mydatanew<-mydata[c(1,5:10)]
names(mydatanew)
#exclude col
mydatanew<-mydata[-1]
names(mydatanew)
mydata[1]<-NULL
names(mydata)
mydata<-diamonds
mydatanew<-mydata[,-1]
names(mydatanew)
ncol(mydatanew);nrow(mydatanew)
mydatanew<-mydata[1:50,-1]
ncol(mydatanew);nrow(mydatanew)
#indexing can also be done using logical values
mydatanew1<-mydatanew[c(T,T,T,F,F,F,F,F,F)]
names(mydatanew1)
#conditions
num<-sapply(mydata,is.numeric)
num
mydatanum<-mydata[,num]
names(mydatanum)
#%>% is used for preparing indexing for text files
library("dplyr")
#using %>% 'then' operator(aka,infix)
mydatanew2<-mydata%>%select(carat,depth,price,y)
#column names that are called,donot havr quotation marks
names(mydatanew2)
mydatadiff<-mydata%>%select(starts_with())
mydatadiff<-mydata%>%select(starts_with("c"))#letter"c"
names(mydatadiff)
##other condition that can be used within select:
#select(contains(".")),select(ends_with("Length"),select(matches(".t.")))

#indexing rows
#Selecting & removing rows in df
#sample();dplyr::sample_n();dplyr::sample_frac()


