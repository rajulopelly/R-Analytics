library(datasets)
mtcars
K<-data(mtcars)
K<-scale(mtcars)  
View(K)
??cluster
a<-sample(nrow(K),22)
train<-K[a,]
test<-K[-a,]
#Elbow Method for finding the optimal number of cluster
# Compute and plot wss for k = 2 to k = 15.
k.max<-10
data<-K
wss<-sapply(1:k.max, 
              function(k){kmeans(K,k,nstart=50,iter.max =15)$tot.withinss})
wss
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")
fix=kmeans(mtcars,3)
fix
fix$withinss
fix$betweenss
fix$size
plot(mtcars,col=fix$cluster,pch=10)
points(fix$centers,col=1:10,pch=10)
#silhouteecoefficient
library(cluster)
Km<-daisy(mtcars)
C<-Km^2
sk<-silhouette(fix$cl,C)
plot(sk)
#clusterstats
H<-dist(mtcars)#for distance matrix
library()
install.packages("fpc")
library(fpc)
cluster.stats(H,fix$cluster)
#cluster validation
plotcluster(mtcars,fix$cluster)

points(fix$centers,col=1,pch=5)
#cluster means
aggregate(mtcars,by=list(fix$cluster),FUN=mean)
#append cluster assignment
Vec<-data.frame(mtcars,fix$cluster)
library(cluster)
clusplot(mtcars,fix$cluster,colour=TRUE,shade=TRUE,labels=3,lines=0)
