setwd("D:\\BSH\\TDS\\Batch4\\Data")
Lc<-read.csv("LungCapData.csv",header=T,sep=",")
attach(Lc)
###Modifying plots 
library(ggplot2)
library(dplyr)
help(par)
?par
#par can be used to set or query graphical parameters
plot(Age,Height,main = "Scatterplot")

#changing the size of plotting characters using "CEX" argument
plot(Age,Height,main = "Scatterplot",cex=3)
plot(Age,Height,main = "Scatterplot",cex=0.5,cex.main=0.5)
plot(Age,Height,main = "Scatterplot",cex=0.5,cex.main=2,cex.lab=1.5)
plot(Age,Height,main = "Scatterplot",cex=0.5,cex.main=2,cex.lab=1.5,cex.axis=0.7)
#70%of org size
#Changing font using"font" argument
plot(Age,Height,main = "Scatterplot",font.main=3)
plot(Age,Height,main = "Scatterplot",font.main=4)
plot(Age,Height,main = "Scatterplot",font.main=4,font.lab=2)
plot(Age,Height,main = "Scatterplot",font.main=4,font.lab=2,font.axis=3)

colours()
mode(colours())
grep("red",colours(),value=TRUE)
#Changing colors using"col"
plot(Age,Height,main = "Scatterplot")
plot(Age,Height,main = "Scatterplot",col=2)

plot(Age,Height,main = "Scatterplot",col=5,col.main=4,col.lab=2,col.axis=3)
#changing plotting characters
plot(Age,Height,main = "Scatterplot",pch=2)#triangle
plot(Age,Height,main = "Scatterplot",pch="w")#uses char w
#adding regline to plot
abline(lm(Height~Age),col=4,lty=2,lwd=6) #color & line type,width
#to find gender using different plots & char

plot(Age[Gender=="male"],Height[Gender=="male"],col=4,pch="m")
plot(Age[Gender=="male"],Height[Gender=="male"],col=4,pch="m",xlab="Age",ylab = "Height",main="Height Vs Age")
points(Age[Gender=="female"],Height[Gender=="female"],col=6,pch="f")

#Add more plots to existing screen
#R makes it easy to combine multiple plots into one overall graph,
#using either the par( ) or layout( ) function
#With the par( ) function, you can include the option mfrow=c(nrows, ncols) to create a matrix of nrows x ncols plots that are filled in by row. 
#mfcol=c(nrows, ncols) fills in the matrix by columns.

par(mfrow=c(1,2))
plot(Age[Gender=="male"],Height[Gender=="male"],xlab="Age",ylab="Height",main="Height Vs age for males")
?par
par(mfrow=c(1,2))
plot(Age[Gender=="male"],Height[Gender=="male"],xlab="Age",ylab="Height",main="Height Vs age for males",xlim=c(0,20),ylim=c(45,85))
plot(Age[Gender=="female"],Height[Gender=="female"],xlab="Age",ylab="Height",main="Height Vs age for females",xlim=c(0,20),ylim=c(45,85))
#layout()
#layout( ) function has the form	layout(mat) where 
#mat is a matrix object specifying the location of the N figures to plot.
# One figure in row 1 and two figures in row 2
attach(mtcars)
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)
#optionally, you can include widths= and heights= options in the layout( ) function to control the size of each figure more precisely. 
#These options have the form widths= a vector of values for the widths of columns
#heights= a vector of values for the heights of rows.
#Relative widths are specified with numeric values. Absolute widths (in centimetres) are specified with the lcm() function.

#Relabelling the axis
par(mfrow=c(1,1))
plot(Age,Height,main = "title")
#to appear only certain values on x-axis/ to include 
plot(Age,Height,main = "title",axes=F)#not to have lable
#relabel axes using axis command
axis(side=1,at=c(7,12.3,15),labels=c("sev","mean","15"))
#y-axis
axis(side=2,at=c(55,65,75),labels=c(55,65,75))
#add box around fig
box()
#side=4 shows on rt side 
axis(side=4,at=c(50,60,70),labels=c(50,60,70))
####Adding legends to plots
help(legend)
?legend
#This function can be used to add legends to plots
plot(Age[Smoke=="no"],LungCap[Smoke=="no"],main="LungCap Vs Age for Smoke/nonSmoke",col=4)
plot(Age[Smoke=="no"],LungCap[Smoke=="no"],main="LungCap Vs Age for Smoke/nonSmoke",col=4,xlab = "Age",ylab = "LungCap")
points(Age[Smoke=="yes"],LungCap[Smoke=="yes"],col=2)
legend(x=3.5,y=14,legend=c("Non-Smoke","Smoke"),fill=c(4,2))
plot(Age[Smoke=="no"],LungCap[Smoke=="no"],main="LungCap Vs Age for Smoke/nonSmoke",col=4,xlab = "Age",ylab = "LungCap",pch=16)
points(Age[Smoke=="yes"],LungCap[Smoke=="yes"],pch=17)
legend(x=3.5,y=14,legend=c("Non-Smoke","Smoke"),col=c(4,2),pch=c(16,17))
legend(x=3.5,y=14,legend=c("Non-Smoke","Smoke"),col=c(4,2),pch=c(16,17),bty="n")

plot(Age[Smoke=="no"],LungCap[Smoke=="no"],main="LungCap Vs Age for Smoke/nonSmoke",col=4,xlab = "Age",ylab = "LungCap",pch=16)
points(Age[Smoke=="yes"],LungCap[Smoke=="yes"],pch=17)
#add lines to existing 
lines(smooth.splines(Age[smoke=="no"],LungCap[Smoke=="no"],col=4,lwd=3))#lwd=3 make three times default width
lines(smooth.splines(Age[smoke=="yes"],LungCap[Smoke=="yes"],col=2,lwd=3))

legend(x=3.5,y=14,legend=c("Non-Smoke","Smoke"),color=c(4,2),lty=1,bty="n")
#bty-the type of box to be drawn around the legend. The allowed values are "o" (the default) and "n"
legend(x=3.5,y=14,legend=c("Non-Smoke","Smoke"),color=c(4,2),lty=1,bty="n",lwd=3)

plot(Age[Smoke=="no"],LungCap[Smoke=="no"],main="LungCap Vs Age for Smoke/nonSmoke",col=4,xlab = "Age",ylab = "LungCap",pch=16)

points(Age[Smoke=="yes"],LungCap[Smoke=="yes"],pch=17)


lines(smooth.spline(Age[Smoke=="no"],LungCap[Smoke=="no"]),col=4,lwd=3,lty=2)
lines(smooth.spline(Age[Smoke=="yes"],LungCap[Smoke=="yes"]),col=2,lwd=3,lty=3) 

legend(x=3.5,y=14,legend=c("Non-Smoke","Smoke"),color=c(4,2),lty=c(2,3),bty="n",lwd=3)

# geom_point
#The point geom is used to create scatterplots.The biggest potential problem with a scatterplot is overplotting: whenever you have more than a few points, points may be plotted on top of one another. This can severely distort the visual appearance of the plot. 
#Technique to make the points transparent (e.g. geom_point(alpha = 0.05)) or very small (e.g. geom_point(shape = ".")).
#Aesthetics--- abt beauty of the plot
#syntax
#geom_point(mapping = NULL, data = NULL, stat = "identity", position = "identity", ..., na.rm = FALSE, show.legend = NA, inherit.aes = TRUE)
library(ggplot2)
data(mtcars)
dim(mtcars)
attach(mtcars)
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point()
# Add aesthetic mappings
p + geom_point(aes(colour = factor(cyl)))
p + geom_point(aes(shape = factor(cyl)))
p + geom_point(aes(size = qsec))

# Change scales
p + geom_point(aes(colour = cyl)) + scale_colour_gradient(low = "blue")
p + geom_point(aes(shape = factor(cyl))) + scale_shape(solid = FALSE)
p + geom_point(aes(shape = factor(cyl))) + scale_shape(solid = TRUE)

# Set aesthetics to fixed value
ggplot(mtcars, aes(wt, mpg)) + geom_point(colour = "red", size = 5)
# Varying alpha is useful for large datasets
d <- ggplot(diamonds, aes(carat, price))
d + geom_point(alpha = 1/10)
d + geom_point(alpha = 1/20)
d + geom_point(alpha = 1/100)

# For shapes that have a border (like 21), you can colour the inside and # outside separately. 
#Use the stroke aesthetic to modify the width of the border
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(shape = 9, colour = "black", fill = "white", size = 5, stroke = 5)

# You can create interesting shapes by layering multiple points of different sizes
p <- ggplot(mtcars, aes(mpg, wt, shape = factor(cyl)))
p + geom_point(aes(colour = factor(cyl)), size = 4) +
  geom_point(colour = "grey90", size = 1.5)
p + geom_point(colour = "black", size = 4.5) +
  geom_point(colour = "pink", size = 4) +
  geom_point(aes(shape = factor(cyl)))

# These extra layers don't usually appear in the legend, but we can force their inclusion
p + geom_point(colour = "black", size = 4.5, show.legend = TRUE) +
  geom_point(colour = "pink", size = 4, show.legend = TRUE) +
  geom_point(aes(shape = factor(cyl)))

# geom_point warns when missing values have been dropped from the data set
# and not plotted, you can turn this off by setting na.rm = TRUE
mtcars2 <- transform(mtcars, mpg = ifelse(runif(32) < 0.2, NA, mpg))
ggplot(mtcars2, aes(wt, mpg)) + geom_point()
ggplot(mtcars2, aes(wt, mpg)) + geom_point(na.rm = TRUE)
