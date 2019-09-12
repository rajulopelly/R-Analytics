#### Basic operations of R
### Vectors
car_name <-c("Honda","BMW","Ferrari")
car_name
car_color =c("Black","Blue","Red")
car_color
car_cc =c(2000,3400,4000)
car_cc


### Lists
cars <-list(name =c("Honda","BMW","Ferrari"),
            color =c("Black","Blue","Red"),
            cc =c(2000,3400,4000))
cars

### Matrices
mdat <-matrix(c(1,2,3,11,12,13), nrow =2, ncol =3, byrow =TRUE,
              dimnames =list(c("row1", "row2"),c("A", "B", "C")))
mdat

###Data Frame
L3 <-LETTERS[1:3]
fac <-sample(L3, 10, replace =TRUE)
df <-data.frame(x =1, y =1:10, fac = fac)
df

class(df$x)
class(df$y)
class(df$fac)

### Subsetting/Indexing using vectors
car_name <-c("Honda","BMW","Ferrari")
#Select 1st and 2nd index from the vector
car_name[2]
#Select all except 2nd index
car_name[-2]
#Select 2nd index
car_name[c(FALSE,TRUE,FALSE)]

### Subsetting/Indexing using lists
cars <-list(name =c("Honda","BMW","Ferrari"),
            color =c("Black","Blue","Red"),
            cc =c(2000,3400,4000))
#Select the second list with cars
cars[2]
#select the first element of second list in cars
cars[[c(2,1)]]

### Subsetting/Indexing using Matrices
mdat <-matrix(c(1,2,3, 11,12,13), nrow =2, ncol =3, byrow =TRUE,
              dimnames =list(c("row1", "row2"),
                             c("C.1", "C.2", "C.3")))
#Select first two rows and all columns
mdat[1:2,]
#Select first columns and all rows
mdat[,1:2]
#Select first two rows and first column
mdat[1:2,"C.1"]
#Select first row and first two columns
mdat[1,1:2]

### Subsetting/Indexing using Matrices
L3 <-LETTERS[1:3]
fac <-sample(L3, 10, replace =TRUE)
df <-data.frame(x =1, y =1:10, fac = fac)
#Select all the rows where fac column has a value "A"
df[df$fac=="c",]
#Select first two rows and all columns
df[c(1,2),]
#Select first column as a vector
df$x

### Sorting the data
# Make up a randomly ordered vector
a <- sample(101:110)
# Sort the vector
sort(a)
# Reverse sort
sort(a, decreasing=TRUE)

### Converting between variable types
#Suppose we start with this numeric/integer vector y
n <- c(10:14)
n
#current class of n
class(n)
# Numeric to Character
c <- as.character(n)
class(c)
# Numeric to factor
f <- as.factor(n)
f
#check the type now
class(f)
# Character to Numeric
s<-as.numeric(c)
class(s)
# Character to Factor
f1<-factor(c)
class(f1)
# Factor to Character
c1<-as.character(f1)
class(c1)


###Factor to Numeric
##The way to get the text values converted to numbers is to first convert it to a character, then a numeric vector.
a<-as.numeric(as.character(f))
class(a)
####Looping#########
x <- 10
if(x > 0)
{
  print("This is Positive number")
}

#
x <- -10
if(x >= 0){print("This is Non-negative number")}else{print("This is Negative number")}

## Nested Loop
x <- 5
if (x < 0) 
{
  print("This is Negative number")
} else if (x > 0) 
{
  print("This is Positive number")
} else {print("This is Zero")}

#### for loop
for(i in 1:5)
{
  print (i^2)
}

####nested for loop

for(i in 1:5)
{
  for(j in 1:2)
  {
    print(i*j);
  }
}

###for loop with next statement
x <- 1:5
for (i in x) {
  if (i == 2){
    next
  }
  print(i)
}

# R for loop with break statement
x <- 1:5
for (i in x) {
  if (i == 3){
    break
  }
  print(i)
}

### Reading/Importing and Writing/Exporting data sets
library(readr) # importing for csv files
data<-read.csv("c:/Users/Unitech01/Desktop/diabetes.csv")
View(data)

library(readxl) # importing the Excel files
data<-read_excel("c:/Users/Unitech01/Desktop/lead_conversion2.xlsx")
View(data)


##
write.csv(data,file="c:/Users/Unitech01/Desktop/lead_excel.csv")

### Merging the data sets
# data frame 1
df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Oven", 3), rep("Television", 3)))
df1
# data frame 2
df2 = data.frame(CustomerId = c(1, 3, 5), State = c(rep("California", 2), rep("Texas", 1)))
df2
##Inner join
# It Return only the rows in which the left table have matching keys in the right table.
df11<-merge(x=df1,y=df2,by="CustomerId")
df11
##Outer join
# It Returns all rows from both tables, join records from the left which have matching keys in the right table.
df12<-merge(x=df1,y=df2,by="CustomerId",all=TRUE)
df12
## Left outer join 
#Return all rows from the left table, and any rows with matching keys from the right table.
df13<-merge(x=df1,y=df2,by="CustomerId",all.x=TRUE)
df13
## Right outer join
#Return all rows from the right table, and any rows with matching keys from the left table.
df14<-merge(x=df1,y=df2,by="CustomerId",all.y=TRUE)
df14
##Cross join
#A Cross Join (also sometimes known as a Cartesian Join) results in every row of one table being joined to every row of another table
df15<-merge(x = df1, y = df2, by = NULL)
df15

### Visualization
## Histogram
x<-rnorm(500,20,30)
x
hist(x,main="Histogram",border="red",col="blue")

## Line Plot
v <- c(8,14,26,5,43)
plot(v,type="o",col="blue",xlab="Month",ylab="Rain fall",main="Rain fall chart")

##Bar plot
H <- c(25,12,43,7,51)
M <- c("Delhi","Beijing","Washington","Tokyo","Moscow")
barplot(H,xlab="Month",ylab="Happiness Index",col="red",names.arg=M, main="Happiness Index",border="black")

# Grouped Bar Plot with Colors and Legend
library(datasets)
data("mtcars")
View(mtcars)
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",xlab="Number of Gears", col=c("darkblue","red"),legend = rownames(counts),beside=TRUE)

### Pie Chart
x <- c(32, 12, 30, 45)
labels <- c("California", "Paris", "Moscow", "Mumbai")
pct <- round(x/sum(x)*100)
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(x,labels = lbls, col=rainbow(length(lbls)),main="city_pie_chart")

###3D Pie Chart in R
library(plotrix)
pie3D(x,labels=lbls,explode=0.1,main="city_pie_chart")

### Box plot
boxplot(mpg ~ cyl, data=mtcars,xlab="Number of Cylinders",ylab="Miles Per Gallon",main="Mileage Data")
## Coloured Box plot
boxplot(mpg ~ cyl, data=mtcars,xlab="Number of Cylinders",ylab="Miles Per Gallon",main="Mileage Data",col=c("green","yellow","purple"),names=c("High","Medium","Low"))

# scatter plot in R
input <- mtcars[,c('wt','mpg')]
# Plot the chart for cars with weight between 2.5 to 5 and mileage between 15
#nd 30.
plot(x=input$wt,y=input$mpg,
     xlab="Weight",
     ylab="Mileage",
     xlim=c(2.5,5),
     ylim=c(15,30),
     main="Weight vs Mileage")
# scatter plot matrix in R - 4 variables is plotted against each other.
pairs(~wt+mpg+disp+cyl,data=mtcars,main="Scatterplot Matrix")

