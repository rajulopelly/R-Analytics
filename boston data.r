library(MASS)
data("Boston")
str(Boston)
View(Boston)
r=Boston
summary(r)
library(dplyr)
glimpse(r)
library(psych)
describe(r)
boxplot(r)
boxplot(r$crim)
summary(r$crim)
#discaing the outliers from data set
bench<- 3.67+1.5*3.59
bench
r$crim[r$crim>9.055]
r$crim[r$crim<9.055]

a<-r$crim[r$crim<bench]
a
a=r$crim
