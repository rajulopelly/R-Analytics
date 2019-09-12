#sub() and gsub() function in R
#sub() and gsub() function in R are replacement functions, which replaces the occurrence of a substring with other substring
#sub() Function in R replaces the first instance of a substring
#gsub() function in R replaces all the instances of a substring
#Syntax for sub() and gsub() function in R:
#sub(old, new, string)
#gsub(old, new, string)

# sub function in R
mysentence <- "England is Beautiful. England is not the part of EU."
sub("England", "UK", mysentence)
gsub("England", "UK", mysentence)
x <- c("This is a sentence about axis","A second pattern is also listed here")
sub("is", "XY", x)
gsub("is", "XY", x)

###Round Function in R:Round function in R, rounds off the values in its first argument to the specified number of decimal places.
#Syntax of Round() function in R: round(x, digits = 0)
#x -> numeric value or vector to be rounded off
#digits ->number of digits to which the value has to be rounded off.
# round off in R with 2 decimal places - with R round function
round(125.2395,)
# round off in R with 0 decimal places - with R round function
round(125.2395, digits=0)
# round function in R with 2 decimal places for a vector
round(c(1.234,2.342,4.562,5.671,12.345,14.567),digits = 2)
##Signif() function in R for rounding off:Signif() function is similar to round function, but digits argument in signif() function denotes the total digits, not the digits after decimal.
# signif function in R with total of 4 digits
signif(125.2395, digits=4)#digits argument is 4 which means the total number of digits will be 4


#Floor and ceiling in R
#floor(x) function in R rounds to the nearest integer that's smaller than x.
#ceiling(x) function in R rounds to the nearest integer that's larger than x

# floor function in R
floor(125.2395)
# ceiling function in R
ceiling(125.2395)
# floor function in R for vector
floor(c(1.234,2.342,4.562,5.671,12.345,14.567))
# ceiling() function in R for vector
ceiling(c(1.234,2.342,4.562,5.671,12.345,14.567))

###Truncate function in R
#trunc(x) is a truncate function in R, which rounds to the nearest integer in the direction of 0
# truncate function in R
trunc(125.2395)
# truncate function in R for negative decimal value
trunc(-125.2395)
b# truncate function in R for a vector
trunc(c(1.234,2.342,-4.562,5.671,12.345,-14.567))

##Substring Function in R
#The substring function in R can be used either to extract parts of character strings, or to change the values of parts of character strings
#SYNTAX
#substr(text, start, stop)
#substring(text, first, last = 1000000L)
#First Argument (Text) is the string,
#second argument (start/first)  is start position of the substring
#Third argument(stop/last) is end position of the substring

## Extracting values with substring in R
substring("HumptyDumpty sat on a wall",5,9)
#Here,string staring from the 5th letter to 9th letter is extracted as a substring

#Replacing values with substring function in R:
#Substring function in R is not just used for extraction, but also used for replacing the part of substring.
## Replacing values with substring in R

mystring<-"Humpty_Dumpty sat on a wall"
substring(mystring,7,7)=";"
mystring
#when we execute the above code the underscore(_) is replaced with space(" ").

### Replacement with recycling

z = c("may", "the", "rain", "shower","can")
substring(z, 2, 3) <- c("@", "#")
z
#substring function replaces every second letter with @ and # consecutively


#Paste Function in R
#Paste function in R is used to concatenate Vectors by converting them into character. paste0 function in R simply concatenates the vector with space separator.
#Syntax for Paste Function in R
#paste (., sep = " ", collapse = NULL)
#.	one or more R objects, to be concatenated together.
#sep	a character string to separate the terms.
#collapse	an optional character string to separate the results.

# paste function in R
paste('one',2,'three',4,'five')
# paste function in R with sep argument
paste('X',1:5,sep='')
# paste function in R with collapse argument
paste(c('one','two','three','four'),collapse=' and ')
# paste function in R with separator and collapse Argument
paste(c('X','Y'),1:5,sep='_',collapse=' and ')

#Paste0() Function in R
#Paste0()  is a simple paste() function with default separator " "
#syntax is
#paste0(., collapse = NULL) ... with only two arguments ... & collapse
# paste0() function in R
paste0('X',1:5)
# paste0() function in R with collapse agrument
paste0('X',1:5,collapse=",")


###Table Function in R - Frequency table in R & cross table in R
## Frequency table with table() function in R
table(iris$Species)
prop.table(iris$Species)
## Frequency table with condition using table function in R
table(iris$Sepal.Length>5.0,iris$Petal.Length>5.0)
prop.table(table(iris$Sepal.Length>5.0))*100
##2 way cross table in R
## cross tabulation gear * carb 
table(mtcars$gear,mtcars$carb)
##3 way cross table in R
## 3 way cross tabulation gear * carb* cyl with table function in R
table(mtcars$gear,mtcars$carb,mtcars$cyl)
library(dplyr)



##String Split with strsplit function in R
#strsplit function in R is used to split the string into substrings with the specified delimiter. So that the resultant substrings are separated by a delimiter.
#Syntax for strsplit function in R:
#strsplit() function in R takes two arguments, the string and the delimiter of the substrings
#strsplit(string, delimiter) ;The delimiter can be either a simple string or a regular expression

## strsplit function in R with space delimiter
mysentence<- "india won the worldcup on 2018"
strsplit(mysentence," ")
## strsplit function in R with / as delimiter
path <- "home/lincon/data/output.csv"
strsplit(path,"/")
## strsplit() function in R with regular expression
mysentence <- "mike19sana17are1siblings"
strsplit(mysentence, "[0-9]+")


###With and Within Function in R
#With Function in R evaluate the R expression in an environment constructed locally by the data. It doesn't create a copy of the data.
#Within Function in R evaluates the R expression in an environment constructed locally and it creates a copy of data.
#Syntax for with and within function in R:
#with(data,expression)
#within(data,expression)

# data frame creation
df <- data.frame(a=1:5,b=2:6)
df
# with function in R
with(df, {c <- a + b; df;} )

#In with function, while executing the expression in an environment. It doesn't save the copy of data frame. so the addition of two columns will not be reflected in the output. 
# with function in R
df$c<-with(df, c <- a + b)
df
#In order to save the addition of two columns create an extra column with $ symbol

# within function in R
within(df, {c <- a + b; df;} )


###Generate sequence with seq() function in R
#seq() function in R generates a sequence of numbers
#Syntax for seq() function in R:seq(from, to, by, length.out)
#from ->	beginning of the sequence; to->	end of the sequence;->by	increment by (default is 1);length.out->	length of the sequence
# sequence from 5 to 10 with R seq function
seq(5,10)
# Generate sequence from 0 to 20 incremented by 2 with R seq function
seq(from=0, to=20, by=2)
#length.out option is used when we don't know the increment value, but we want some evenly distributed numbers of predefined length
# Generate sequence from 0 to 20 with length.out=5 with R seq function
seq(from=0, to=20, length.out=5)

##Seq function in R with Fractional increment:
#The increment need not be an integer. R can create sequences with fractional increments too
# Generate sequence from 1 to 3 with length.out=5 with R seq function
seq(from=1.0, to=3.0, length.out=5)


###Aggregate() Function in R
#Aggregate() Function in R Splits the data into subsets, computes summary statistics for each subsets and returns the result in a group by form. Aggregate function in R is similar to group by in SQL.
#Syntax for Aggregate() Function in R:aggregate(x, by, FUN, simplify = TRUE)
#x->	an R object, mostly a data frame
#by->	a list of grouping elements, by which the subsets are grouped by
#FUN->	a function to compute the summary statistics which can be applied to all data subsets
#Simplify->	logical indicating the simplification of results
# Aggregate function in R with mean summary statistics
agg_mean <- aggregate(iris[,1:4],by=list(iris$Species),FUN=mean, na.rm=TRUE)
agg_mean

####note: When using the aggregate() function, the by variables must be in a list.####

# Aggregate function in R with sum summary statistics
agg_sum<-aggregate(iris[,1:4],by=list(iris$Species),FUN=sum, na.rm=TRUE)
agg_sum



###by() Function in R
#by() function in R applies a function to specified subsets of a data frame.First parameter of by() function, takes up the data and second parameter is by which the function is applied and third parameter is the function.
#Syntax of by() function in R: by(data, data$byvar, FUN)
#data->	an R object, normally a data frame, possibly a matrix.
#data$byvar->	a factor or a list of factors by which the function is applied
#FUN->	a function to be applied to the subsets of data.

# by() function in R with mean
mydata <- iris
by(mydata$Sepal.Length,list(mydata$Species),mean)
# by() function in R with more than one list
mydata1<-mtcars
by(mydata1$hp,list(mydata1$gear,mydata1$cyl),mean)

#mean of hp is calculated for distinct gear and cyl combination

###Union in R-or Vector and data frame
# union in R - Union of two vectors in R
x <- c(1:4)
y <- c(2:7)
union(x,y)

##union in R- union of data frames : 
#Union of two data frames in R can be easily achieved by using merge() function
# Create two data frames

df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Oven", 3), rep("Television", 3)))
df2 = data.frame(CustomerId = c(4:7), Product = c(rep("Television", 2), rep("Air conditioner", 2)))
# union in R - union of data frames in R
df_union1<-merge(df1,df2,all=TRUE)
df_union1

#There is an indirect way for union of two data frames in R. it can done In two steps.
#->First row bind (rbind) all the data frames ·
#->Then Remove the duplicates
#row bind the data frames.
df_cat<-rbind(df1,df2)
df_cat
#Retrieve only unique rows from the above df_cat data frame using unique fun
#unique function.
df_union <- unique(df_cat)
df_union


###Intersect in R with intersect function
#intersect() function in R performs intersection of two or more vectors and data frames.
# intersection of two vectors in R with intersect function
x <- c(1:4)
y <- c(2:7)
intersect(x,y)
##intersect in R - intersection of data frames: 
#Intersection of two data frames in R can be easily achieved by using merge() function
# intersection of data frames in R
df_intersect<-merge(df1,df2,all=TRUE)
df_intersect

#rbind or cbind works great when we have two datasets with either identical columns 
#(both the number of and names) or the same number of rows.

###Row bind data frames with Rbind function
#Rbind in R appends or combines vector, matrix or data frame by rows. 
#***Note: Column names and the number of columns of the two dataframes needs to be same
#Syntax for Rbind function in R:rbind(x1,x2)
#x1,x2 can be data frame, matrix or vector
# row bind the data frames with rbind function in R.

rbinded_df<-rbind(df1,df2)
rbinded_df

###cbind in R - Column bind using cbind function
#Column Bind - Cbind  in R appends or combines vector, matrix or data frame by columns
#***Note : The number of rows in two dataframes needs to be same
#Syntax for Cbind in R:cbind(x1,x2)
#x1,x2 can be data frame, matrix or vector
#Create two data frames
df1 = data.frame(name = c("Rahul","joe","Adam","Brendon"), married_year = c(2016,2015,2016,2008))
df2 = data.frame(Birth_place = c("Delhi","Seattle","London","Moscow"), Birth_year = c(1988,1990,1989,1984))
# cbind in R: column bind the data frames.
cbinded_df<-cbind(df1,df2)
cbinded_df


###Which Function in R - which()
#Which function in R, returns the indices of the logical object when it is TRUE. In other words, which() function in R returns the position of value when it satisfies the specified condition.
#Syntax of which function in R:which(x, arr.ind = FALSE)
#x -> logical vector
#ind-> logical; should array indices be returned when xis an array?
# which function in R
which(letters=="z")
which(letters=="s")#Returns the position of "Z" and "S" in the letters object
# which function in R for vector
x <- c(1,3,5,7,8)
which(x==3)
which(x>=7)
# which function in R for a data frame
which(women$height==66,arr.ind = FALSE)
which(women$height>=70,arr.ind = FALSE)
## matrix creation 
m = matrix(rep(c(-1, 0, 1), 4), nrow = 4)
m
# which function in R for matrix
which(m==0,arr.ind=TRUE)#t will return array index of the matrix when m==0 


###Subset Function in R
#Subset Function in R, returns subset of dataframe, vectors or matrices which meet the specified conditions.
#Syntax of Subset Function in R:   subset(x, condition,select)
#x -> can be a matrix ,data frame or vector
#condition-> condition to be satisfied
#select - > columns to be selected
# subset() function in R
newdata<-subset(mtcars,mpg>=30)   
newdata
# subset() function in R with select specific columns
newdata<-subset(mtcars,mpg>=30, select=c(mpg,cyl,gear))
newdata
# subset() function in R with select option
newdata<-subset(mtcars,mpg>=30, select=mpg:drat)  
newdata


###Reshape in R from wide to long and from long to wide
#Reshape function in R transforms the data from wide to long and also transforms back the data from long to wide. Reshape in R - reshape(), is one of the efficient function to transform the data.
# create data frame
country<-data.frame(c("A","B","C"),c(100,200,120),c(2000,7000,15000))
colnames(country)<- c("countries","population_in_million","gdp_percapita")
country   
## reshape in R from wide to long example
country_w_to_L<- reshape(data=country, idvar="countries",
                         varying = c("population_in_million","gdp_percapita"),
                         v.name=c("value"),
                         times=c("population_in_million","gdp_percapita"),
                         new.row.names = 1:1000,
                         direction="long")

country_w_to_L
## reshape in R from long to wide example
country_L_to_w <- reshape(data=country_w_to_L,idvar="countries",
                          v.names = "value",
                          timevar = "time",
                          direction="wide")


###%in% operator in R
#%in% operator in R, is used to identify if an element belongs to a vector
# R %in% operator
v1 <- 3
v2 <- 101
t <- c(1,2,3,4,5,6,7,8)
v1 %in% t
# R %in% operator
v2 %in% t
# R %in% operator for mtcars data frame
mtcars$cyl %in% 4

######Pipe operators#####
####pipes in dplyr
library(dplyr)
#library(tidyverse)
data("iris")
iris1<-select(iris,-Sepal.Width)
iris2<-filter(iris1,Species=='setosa'&Sepal.Length>5)

arrange(iris,desc(Sepal.Length),desc(Sepal.Width))
#Mutate adds new variables and preserves existing; transmute drops existing variables
iris3<-mutate(iris,Sepal.Diff=Sepal.Length*2)
iris4<-mutate(iris,size=ifelse(Sepal.Length>6,'Large','Small'))
summarize(iris,ave_sepal_length=mean(Sepal.Length),med_sepal_width=median(Sepal.Width))

###OR
iris%>%
  select(-Sepal.Width)%>%
  filter(Species=='setosa'& Sepal.Length>5)%>%
  arrange(desc(Petal.Length))%>%
  mutate(petal_diff=Petal.Length-Petal.Width)


###grep() and grepl()
##R provides such functions (grep and grepl) that match character patterns in specified vector.  While both of these functions find patterns, they return different output types based on those patterns.  
#Specifically, grep returns numeric values that correspond to the indexed locations of the patterns and grepl returns a logical vector in which "TRUE" represents a pattern match.
head(CO2)
tail(CO2)
#grep return the index value of each matched pattern
grep("non", CO2$Treatment)
#grepl returns a logical output for each indices in the original vector 
#with "TRUE" representing matched patterns
grepl("non", CO2$Treatment)
##Filtering with grep: 
#position indexing application 
#filter data set based on values in a column 
filter_for_value<-CO2[grep("non", CO2$Treatment), ]
head(filter_for_value)
#filter data set based on values that do not match the specified pattern
filter_for_not_a_value<-CO2[-(grep("non", CO2$Treatment)),]
head(filter_for_not_a_value)

#filter discards rownames, while subset doesn't:
#filter requires additional packages where as subset doesn't require


##Selecting columns with grep:
select_columns<-CO2[, grep("T", colnames(CO2))]
head(select_columns)
dont_select_columns<-CO2[, -(grep("T", colnames(CO2)))]
head(dont_select_columns)

###grep &grepl() with dplyr
library(dplyr)
CO2_dplyr<-tbl_df(CO2) #converting CO2 into a local data frame 
#dplyr filtering with grepl
filter_dplyr_for_value_non<-CO2_dplyr %>% filter(grepl("non", Treatment))
filter_dplyr_for_value_non

filter_dplyr_for_not_a_value<-CO2_dplyr %>% filter(!(grepl("non", Treatment)))
filter_dplyr_for_not_a_value

#dplyr selecting with grep
select_dplyr_columns<-CO2_dplyr %>% select(grep("T", colnames(CO2_dplyr)))
select_dplyr_columns
dont_select_dplyr_column<-CO2_dplyr %>% select(-grep("T", colnames(CO2_dplyr)))
dont_select_dplyr_column


###any and all function in R
#any() function in R checks whether at least one value remains true of the logical vector
#all() function in R checks whether all values remains true of the logical vector
# any function in R
v1 <- c(3,4)
v2 <- c(101,4)
t <- c(1,2,3,4,5,6,7,8)
any(v1 %in% t)   #checks whether any value of v1 present in t
# any function in R
any(v2 %in% t)   #checks whether any value of v2 present in t 
# all function in R
all(v2 %in% t)   #checks whether all value of v2 present in t 
# any function in R for mtcars data frame
any(mtcars$cyl %in% 4)  #checks whether atleast one value of cyl column of mtcars data frame have value 4 in it
# all function in R for mtcars data frame
all(mtcars$cyl %in% 4)   #checks whether all the values of cyl column of mtcars data frame have value 4 in it
# all function in R for mtcars data frame
all(mtcars$am %in% c(1,0))   #checks whether all the values of am column of mtcars data frame have value 0 or 1 in it


###Apply Function in R - apply vs lapply vs sapply vs mapply vs tapply vs rapply vs vapply
#The Family of Apply functions pertains to the R base package, and is populated with functions to manipulate slices of data from matrices, arrays, lists and data frames in a repetitive way. 
#Apply Function in R are designed to avoid explicit use of loop constructs. They act on an input list, matrix or array, and apply a named function with one or several optional arguments.

#Apply Function in R:Returns a vector or array or list of values obtained by applying a function to margins of an array or matrix
#Syntax for Apply function in R:Apply(x,1,sum)
#Where the first Argument X is a data frame or matrix
#Second argument 1 indicated Processing along rows .if it is 2 then it indicated processing along the columns
#Third Argument is some aggregate function like sum, mean etc or some other user defined functions.

Age<-c(56,34,67,33,25,28)
Weight<-c(78,67,56,44,56,89)
Height<-c(165, 171,167,167,166,181)

BMI_df<-data.frame(Age,Weight,Height)
BMI_df
# row wise sum up of dataframe using apply function in R
apply(BMI_df,1,sum)
# column wise sum up of dataframe using apply function in R
apply(BMI_df,2,sum)
# column wise mean of dataframe using apply function in R
apply(BMI_df,2,mean)

##lapply function in R:lapply function takes list, vector or Data frame  as input and returns only list as output.
lapply(BMI_df, function(BMI_df) BMI_df/2)
# lapply function in R
lapply(BMI_df, mean)


##Sapply function in R:sapply function takes list, vector or Data frame  as input. It is similar to lapply function but returns only vector as output
sapply(BMI_df, function(BMI_df) BMI_df/2)
# sapply function in R
sapply(BMI_df, mean)


##mapply function in R:  mapply is a multivariate version of sapply. 
#mapply applies FUN to the first elements of each (.) argument, the second elements, the third elements, and so on.
#i.e. For when you have several data structures (e.g. vectors, lists) and you want to apply a function to the 1st elements of each, and then the 2nd elements of each, etc., coercing the result to a vector/array as in sapply
# mapply function in R
mapply(sum, 1:4, 1:4, 1:4)   #mapply sums up all the first elements(1+1+1) ,sums up all the second elements(2+2+2) and so on
# mapply function in R
mapply(rep,1:4,1:4)#it repeats the first element once ,second element twice and so on


##tapply function in R: For when you want to apply a function to subsets of a vector and the subsets are defined by some other vector, usually a factor
# tapply function in R
attach(iris)
# mean sepal length by species
tapply(iris$Sepal.Length, iris$Species, mean)


##rapply function in R: rapply function in R is nothing but recursive apply, as the name suggests it is used to apply a function to all elements of a list recursively
# rapply function in R
x=list(1,2,3,4)
rapply(x,function(x){x^2},class=c("numeric"))
# rapply function in R for sublists
x=list(3,list(4,5),6,list(7,list(8,9)))
str(x)
rapply(x,function(x) x^2,class=c("numeric"))

##vapply function in R: vapply function in R is similar to sapply, but has a pre-specified type of return value, so it can be safer (and sometimes faster) to use
# vapply function in R
vapply(1:5, sqrt, 1i)



###How to sort in R with sort function and order function
#Sorting a vector in R can be done with sort () function.
#Sorting a data frame in R can be done with order() function.
# sort by mpg - using order function in R
mtcars[order(mtcars$mpg),]
#Sort by more than one column in R: sort mtcars by carb  and then by cyl  
# sort by carb and cyl - using order function in R
mtcars[order(mtcars$carb,mtcars$cyl),]
#Sort one column by descending and other column by ascending in R: 
#In mtcars table, lets sort carb by ascending and cyl by descending. 
#In order to sort by descending include a minus sign in front 
#sort carb by ascending and cyl by descending -with sort function in R
mtcars[order(mtcars$carb,-mtcars$cyl),]

##How to sort in R - sorting a vector: A vector in R can be sorted using a simple sort() function 
# sort function in R: Ascending order
x<-c(3,5,1,2,4,7)
sort(x,decreasing=FALSE)
# sorting with sort function in R: descending order 
sort(x,decreasing=TRUE)


###Correlation in R
#Cor() function is used to calculate correlation among vectors, Matrices and data frames.
#Syntax for correlation function in R: cor(x, y,method = c("pearson", "kendall", "spearman"))
# correlation of vectors in R
x <- c(0,1,1,2,3,5,8,13,21,34)
y <- log(x+1)
cor(x,y)

#Correlation of vector in R with NA:
#***Note: Correlation in R cannot be calculated if values has NA. So use = "complete.obs"  neglects NAs while calculating correlation coefficient in R
# correlation in R : handling NA
x <- c(0,1,1,2,3,5,8,13,21,NA)
y <- log(x+1)
cor(x,y)
cor(x,y,use = "complete.obs")

#Correlation matrix of data frame in R:
# correlation matrix in R using mtcars dataframe
x <- mtcars[1:4]
y <- mtcars[10:11]
cor(x, y)
# correlation of Matrix in R
matA<-matrix(1:9,3,3)
matB<-matrix(c(10,11,12,15,16,20,21,26,28),3,3)
cor(matA,matB)


###Rank Function in R
##rank() function in R returns the ranks of the values in a vector. rank function in R also handles Ties and missing values in several ways
#Syntax for rank function in R: rank(x, na.last = TRUE, ties.method = c("average", "first", "random", "max", "min"))
#x->	 numeric, character or logical vector
#na.last->	Treatment of NAs. How to Handle NAs
#ties.method->	Treatment of Ties. How to Handle Ties
#Rank function in R with NAs as last:
x <- c(2,7,1,-17,NA,Inf,35,21)
rank(x)
#***by default NAs are ranked last
#Rank function in R with NAs as First:NAs are ranked first
x <- c(2,7,1,-17,NA,Inf,35,21)
rank(x,na.last = FALSE) #NA FIRST
#Rank function in R with NAs are removed:NAs are neglectled by rank function
x <- c(2,7,1,-17,NA,Inf,35,21)
rank(x,na.last = NA) #NA removed
#Rank function in R with NAs are ranked as NA:NAs are kept and ranked as NAs by rank function
x <- c(2,7,1,-17,NA,Inf,35,21)
rank(x,na.last = "keep") #NA is kept with rank NA
#Rank function in R with Ties="Average":Average of the rank is allocated to the elements of vector when ties are encountered
x <- c(2,7,1,-17,NA,Inf,35,21,7)
rank(x,na.last = TRUE,ties.method = "first")
#Rank function in R with Ties="random":
x <- c(2,7,1,-17,NA,Inf,35,21,7)
rank(x,na.last = TRUE,ties.method = "random")
#Rank function in R with Ties="max":Maximum value of the rank is allocated to the elements of vector when ties are encountered
x <- c(2,7,1,-17,NA,Inf,35,21,7)
rank(x,na.last = TRUE,ties.method = "max")
#Rank function in R with Ties="min":Minimum value of the rank is allocated to the elements of vector when ties are encountered
x <- c(2,7,1,-17,NA,Inf,35,21,7)
rank(x,na.last = TRUE,ties.method = "min")
#Ranking of character vector in R:Rank() function can also be used to rank character vector
y<-c("a","h","e","d")
rank(y)


###Min and Max Function in R
#min() function in R computes the minimum value of a vector or data frame.
#max() function in R computes the maximum value of a vector or data frame.
#Syntax for min and Max function in R:min(x, na.rm = FALSE); max(x, na.rm = FALSE)
#x -> is numeric or character vector
#na.rm -> a logical indicating whether missing values should be removed.
# max function in R for a numeric vector
x <-c(1.234,2.342,-4.562,5.671,12.345,-14.567)
max(x)
#***Note:Max/min function doesn't give desired output, If NAs are present in the vector. So it has to be handled by using na.rm=TRUE in max() function
# max function in R for a numeric vector
x <-c(1.234,2.342,-4.562,5.671,12.345,-14.567,NA)
max(x, na.rm=TRUE)
# max function in R for a character vector
y<-c("d","e","a","x")
max(y)
# max function in R for a data frame
max(mtcars$mpg)
# min function in R for a numeric vector
x <-c(1.234,2.342,-4.562,5.671,12.345,-14.567)
min(x)
# min function in R for a numeric vector
x <-c(1.234,2.342,-4.562,5.671,12.345,-14.567,NA)
min(x, na.rm=TRUE)
# min function in R for a character vector
y<-c("d","e","a","x")
min(y)
# min function in R for a data frame
min(mtcars$mpg)


###Mean function in R: Calculate arithmetic mean
#Syntax for mean() function in R:  mean(x, na.rm = FALSE, .)
#x -> numeric vector
#rm-> whether NA should be removed, if not, NA will be returned
# R mean function
x <-c(1.234,2.342,-4.562,5.671,12.345,-14.567)
mean(x)
# mean function for input vector which has NA.
x <-c(1.234,2.342,-4.562,5.671,12.345,-14.567,NA)
mean(x,na.rm=TRUE)
# R mean function - for column in data frame
mean(mtcars$mpg)

###Median function in R
#Syntax for median function in R:  median(x, na.rm = FALSE, .)
#x -> numeric vector
#rm-> whether NA should be removed, if not, NA will be returned
# R median function with 7(odd) observation
x <-c(1.234,2.342,3.4,-4.562,5.671,12.345,-14.567)
median(x)
# R median function with 6(even) observation
x <-c(1.234,2.342,-4.562,5.671,12.345,-14.567)
median(x)
# R median function for input vector which has NA.
x <-c(1.234,2.342,-4.562,5.671,12.345,-14.567,NA)
median(x,na.rm=TRUE)
# median function for column in data frame
median(mtcars$mpg)


###Standard Deviation in R
#Syntax for standard deviation function in R:sd(x, na.rm = FALSE, .)
#x -> numeric vector
#rm-> whether NA should be removed, if not, NA will be returned
# standard deviation in R: sd() function
x <-c(1.234,2.342,-4.562,5.671,12.345,-14.567)
sd(x)
# sd() function in R for input vector which has NA.
x <-c(1.234,2.342,-4.562,5.671,12.345,-14.567,NA)
sd(x,na.rm=TRUE)
# standard deviation in R for a column in data frame
sd(mtcars$mpg)

