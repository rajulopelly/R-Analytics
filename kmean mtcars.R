datasets::mtcars
data("mtcars")
View(mtcars)
levels(mtcars)
names(mtcars)
is.na(mtcars)
sapply(mtcars)
a<-scale(mtcars)
View(a)
sapply(a)
head(a )
distance <- get_dist(a)
distance
fviz_dist(distance, gradient = list(low = "blue", mid = "White", high = "orange"))
clusplot(k,data=a)

library(dplyr)
library(tidyverse)
library(cluster)
library(factoextra)
#applying kmeans cluster
set.seed(100)
nrow(mtcars)
b =sample(nrow(a),20)
train =mtcars[b,]
test =mtcars[-b,]
fix =kmeans(mtcars,2)
fix
fix$betweenss
fix$withinss
k<-kmeans(a,centers = 2)
str(k)
k
clusplot(mtcars,fix$cluster)
