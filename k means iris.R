data("iris")
View(iris)
sapply(iris,class)
# applying k.means cluster
set.seed(100)
b= factor(iris$Species , levels=c("setosa","versicolor","virginica"),labels =c(1,2,3))
iris$Species <- b
a=sample(nrow(iris),105)
train=iris[a,]
test=iris[-a,]
fix=kmeans(iris,3)
fix
fix$withinss
fix$betweenss
fix$size
plot(iris, col= fix$cluster,pch=15)
##silhotei coeef
library(cluster)
c=daisy(iris)
d=c^2
sk=silhouette(fix$cluster,d)
plot(sk)

#cluster stats
ac=dist(iris)
library(fpc)
cluster.stats(ac,fix$cluster)


##cluster validation
plotcluster(iris,fix$cluster)


###cluster means
aggregate(iris,by=list(fix$cluster),FUN = mean)

##append cluster assignment
iris <-data.frame(iris, fix$cluster)
head(iris)
#cluster plot against 1st to principal components
#vary parameters for most readable graph

library(cluster)
clusplot(iris, fix$cluster, color=TRUE, shade =TRUE,labels=2,lines=0)
