#Some Basics
# variable, vectors, selection of an element of vector,
# entering data into R, Data frame
#---writing a comment
pi
sqrt(25)
2^2+5 #can do all airthmatic operations

# Setting Variables
# assignment operator <- or = (less than character and a hyphen with no space between them)
x <- 5
y<-10
x < -5 #comparision
z <- 3^2+4^2
z
#when we define a variable at the command prompt like this, the varibale is held in the
#workspace

# over writing a varibale
z<- "TDS"
z<-"5"
# less common assignment operators
fun=6
fun
8 -> foo
foo

# listing all the variables and functions defined in the workspace
# ls() returns a vector of character string in which each string is the name of the
# variable
ls()

data()
c<-data("co2")
data("iris")

# ls.str() tells more than varibale of names
ls()
data(iris)
dim(iris)
ls(iris)
names(iris)
str(iris)
levels(iris$Species)
library(dplyr)
glimpse(iris)
ls.str()
library(dplyr)
# Deleting Variables
rm(x) # the rm function removes permanently 
attach(iris)
names(Species)
detach(iris)

rm(z,fun,foo)
ls()

#Creating a Vector
# A vector can contain either numbers, strings, or
# logical values but not the mixture
# c(....)
c(1,29,-4,81,5)
a <- 2
c(a,2*a,3*a)
c("Today", "is", "a", "sunny", "day")
c(TRUE, TRUE, FALSE)
a1 <- c(1,1,1)
a2 <- c(2,2,3)
a3<-c("A","B")
a2
c(a1,a2)
a4<-c(a2,a3)
class(a4)
class(a2)


#Vectors cannot contain mixed data type
c(1,2,"g")
c(TRUE,FALSE,"g")
c(TRUE,FALSE, 3,4)

class(c(TRUE,FALSE,"g"))

#Computing basic statistics
# mean(x), median(x), sd(x), var(x), cor(x,y)

vec1 <- c(1,0,2,1,3,5,6,9)
mean(vec1)
mean(iris$Sepal.Length)

# Creating a sequence
10:15 #creats a simple sequence from 10 to 15 with an incrememnt of 1

# creating  a sequence with an increment other than 1
seq(from=10, to=15, by=2)
seq(from=10,to=15)
seq(from=0, to=20, length.out=5)

# repeating values sequence
rep(10, times=5)

# Selecting vector elements
# Use square brackets to select vector element
color<-c(0,1,2,3,4)
color[3]
color[1]# first element has an index 1 (not 0)

# negative index to exclude the index
color[-3]
# use vector indexing for selecting multiple elements
color[2:4]
color[-(2:4)] #invert sign to exclude

#Use of logical vector for selecting the element
color=="red"
num <- c(1,2, 3,4,5)
num
num %%2==0  # it is true when ever num is even, %% is the modulo operator
num[num%%2==0]
median(num)
num[num>median(num)]

names(num)<- c("n1", "n2","n3","n4","n5") # assigning names
# to the vector elements
num
num["n1"] # we can refer an element by name
num[c("n2","n4")]

#operator precedence
# In genral B, :(seq), */+-
n <- 6
0:n-1
0:(n-1)

# Entering data from the keyboard
data1 <- c(11,23,41,7,-45,-67)
data1


# data frame is a table like structure with rows and columns
# data frame can have different types of columns, numeric,
#character date

# creating empty data frame
#emptydata <- data.frame()
#editdata <- edit(emptydata)
#names(editdata) <- c("values", "numbers", "names")
#editdata

# creating dataframe with c(...)
exampledata <- data.frame(names=c("Amit", "Anne", "Jay"),income=c(80000,75000,60000),Gender=c("M","F","M"))
exampledata

# working directory---default location for all file input and output,
#saving workspace, scriptfiles
getwd()
#setwd("D://TDS")
# saving the workspace
#save.image() #saves in the working directory
#save.image(file="D://TDS//RCourse/image.RData") # saves 
#in a specified file

#displaying the list of packages currently loaded in R
search()

# loading the package into R provided that the package is already installed
#to know the list of packages installed on the your machine
# library()---basic list
# installed.packages() ---detailed information 

library(MASS)
detach(package:MASS) #unloading a package from current session of R

# using buitin datasets of R
library(datasets)
data(airquality) # "datasets" package is already in search path
# so no need to load the package 

head(airquality)
str(airquality)
summary(airquality)
summary(iris)

# To access datasets in other packages
library(MASS)
#Reading Tabular datafiles
#dtfrm <- read.table("filename",...)

#good <- read.table("Sample.csv",sep=",",header=T,stringsAsFactor=F)
# need to specify path, also separator
# need to specify path, also separator

# matrix
matrix(1:12,nrow=3,ncol=4)
matrix(1:12,nrow=3)
matrix(1:12)

# list
vec <- 1:10
mat <- matrix(1:10,5,5)
char <- "TDS"
mylist <- list(vec,mat,char)
mylist
names(mylist) <- c("myvector","mymatrix","name")