data("iris")
View(iris)
names(iris)
head(iris)
tail(iris)
V <- data.frame(iris)
View(V)
A<-subset(iris,Species=="setosa") 
View(A)
barplot(iris$Sepal.Length)
library(ggplot2)
ggplot(iris,aes(x=Sepal.Length , y=Petal.Length)) + geom_point()
ggplot(iris , aes(x=Sepal.Length , y=Petal.Length)) + geom_point(aes(colour = Species))
###density plot

vol <- ggplot(data=iris, aes(x = Sepal.Length))
vol + stat_density(aes(ymax = ..density..,  ymin = -..density.., 
                       fill = Species, color = Species), 
                   geom = "ribbon", position = "identity") +
  facet_grid(. ~ Species) + coord_flip() + xlab("Sepal Length") 
###heat map
library(ggplot2)
library(reshape2)
dat <- iris[,1:4]
cor <- melt(cor(dat ,use = "p"))
head(cor)
heat <- ggplot(data=cor, aes(x=Var1, y=Var2, fill=value)) 
heat + geom_tile() + labs(x = "", y = "") + scale_fill_gradient2(limits=c(-1, 1))
