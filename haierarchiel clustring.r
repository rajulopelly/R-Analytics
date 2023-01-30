# data manipulation
library(tidyverse) 
# clustering algorithms
library(cluster)   
# clustering visualization
library(factoextra)

# for comparing two dendrograms
library(dendextend)

data("USArrests")
View(USArrests)
sum(is.na(USArrests))
class(USArrests$Rape)
USArrests$Murder<-round(USArrests$Murder)
USArrests$Rape<-round(USArrests$Rape)
#scaleing
USArrests<-scale(USArrests)
tail(USArrests)
# Dissimilarity matrix
d <- dist(USArrests, method = "euclidean")
d
# IN HEIRARICHAL clustering THERE are COMPLETE ,SINGLE,AVERAGE, 
#WARDEN Distances, CENTROID LINKAGE ARE THERE
# Hierarchical clustering using Complete Linkage
hcluster1<- hclust(d, method = "complete" )
hcluster1$height
hcluster1$order
hcluster1$labels
hcluster1$method
hcluster1$call
hcluster1$dist.method
# Plot the obtained dendrogram
plot(hcluster1, cex = 0.7, hang = -1)
group1<-cutree(hcluster1,k=2)
rect.hclust(hcluster1, k=2, border="red") 
# Hierarchical clustering usingsingl Linkage
hcluster2<- hclust(d, method = "single" )
hcluster2$height
hcluster2$order
hcluster2$labels
hcluster2$method
hcluster2$call
hcluster2$dist.method
# Plot the obtained dendrogram
plot(hcluster2, cex = 0.6, hang = -1)
group2<-cutree(hcluster2,k=2)
rect
# Hierarchical clustering using average Linkage
hcluster3<- hclust(d, method = "average" )
hcluster3$height
hcluster3$order
hcluster3$labels
hcluster3$method
hcluster3$call
hcluster3$dist.method
# Plot the obtained dendrogram
plot(hcluster3, cex = 0.6, hang = -1)
# Hierarchical clustering using centroid Linkage
hcluster4<- hclust(d, method = "ward.D" )
hcluster4$height
hcluster4$order
hcluster4$labels
hcluster4$method
hcluster4$call
hcluster4$dist.method
# Plot the obtained dendrogram
plot(hcluster4, cex = 0.6, hang = -1)
# Hierarchical clustering using centroid Linkage
hcluster5<- hclust(d, method = "centroid" )
hcluster5$height
hcluster5$order
hcluster5$labels
hcluster5$method
hcluster5$call
hcluster5$dist.method
# Plot the obtained dendrogram
plot(hcluster5, cex = 0.6, hang = -1)

#hclust [in stats package] and ****"agnes"**** [in cluster package]
#for agglomerative hierarchical clustering (HC)
#****"diana"**** [in cluster package] for divisive HC
# Compute with ""agnes""
# Dissimilarity matrix
# Compute with agnes
#**************************************************************
#first we find which linkage is going to give good
#efficiency for agglomorative
#**************************************************************

Dhc <- agnes(USArrests, method = "complete")
Dhc$order
Dhc$height
Dhc$diss
Dhc$call
Dhc$method             
Dhc$order.lab
Dhc$merge
Dhc$data
# Agglomerative coefficient
Dhc$ac
m <- c( "average", "single", "complete", "ward")
names(m) <- c( "average", "single", "complete", "ward")
# function to compute coefficient
ac <- function(x) {agnes(USArrests, method = x)$ac}
#Here we see that Ward's method identifies the strongest clustering structure of the four methods assessed.
map_dbl(m, ac)
#visualize the ward dendrogram:                                                                                                                                                                                                                                                                                                                                                                                                                                                          

whc<- agnes(USArrests, method = "ward")
# methods to assess
#Single-link clustering defines the distance between two clusters as the minimum distance between their members
#The last of the three most common techniques is "complete-link clustering,where the distance between clusters is the maximum distance between their members.
#average linkage
#ward linkages

pltree(whc3, cex = 0.6, hang = -1, main = "Dendrogram of agnes")
# compute divisive hierarchical clustering***diana*** function
Dhc4 <- diana(USArrests)

# Divise coefficient; amount of clustering structure found
Dhc4$order
Dhc4$height
Dhc4$merge
Dhc4$diss
Dhc4$call
Dhc4$call
Dhc4$order.lab
Dhc4$data
Dhc4$dc
# plot dendrogram
pltree(Dhc4, cex = 0.6, hang = -1, main = "Dendrogram of diana")
fviz_nbclust(USArrests, FUN = hcut, method = "wss")
# Ward's method
hc5 <- hclust(d, method = "ward.D2" )

# Cut tree into 4 groups
sub_grp <- cutree(hc5, k = 4)

# Number of members in each cluster
table(sub_grp)
