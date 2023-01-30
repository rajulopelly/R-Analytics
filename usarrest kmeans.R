library(tidyverse);library(cluster);library(psych);library(ggplot2);library(factoextra);library(NbClust)
data("USArrests")
names(USArrests)
#K-Means clustering method considers two assumptions regarding the clusters - 
#first that the clusters are spherical 
#second that the clusters are of similar size.
plot(USArrests)
plot(USArrests)
describe(USArrests)
a<-ggplot(USArrests,aes(x=Murder,y=Assault))
a+geom_point()

b<-ggplot(USArrests,aes(x=UrbanPop,y=Rape))
b+geom_point()

#scaling or standardisation of data
scaleing<-scale(USArrests)

#elbow method
set.seed(123)
#fviz_nbclust(x, FUNcluster, method = c("silhouette", "wss", "gap_stat"))
fviz_nbclust(scaleing, kmeans, method = "wss")
#or
NbClust(data = scaleing, distance = "euclidean",min.nc = 2, max.nc = 15, method = "kmeans")
#k-means model apply
kclustering<-kmeans(scaleing,4)

#within sum of square should be low compare with between sumof suare
kclustering$withinss
kclustering$betweenss
kclustering$cluster
kclustering
#checking the coefficients
#visualize the clusterings
fviz_cluster(kclustering,data = scaleing)
#clusplot(scaleing,kclustering$cluster,colour=TRUE,shade=TRUE,labels=3,lines=0)
