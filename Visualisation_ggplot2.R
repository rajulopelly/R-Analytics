library(ggplot2)
head(mtcars)
## scatterplot
ggplot(mtcars,aes(x=mpg,y=wt,fill=wt))+geom_point()+theme_classic()
## Histogram
ggplot(mtcars,aes(x=mpg,fill=mpg))+geom_histogram(colour="red")+theme_gray()
### Barplot
ggplot(mtcars,aes(x=gear,fill=gear))+geom_bar(color="black")+theme_grey()
ggplot(mtcars,aes(x=gear,fill=mpg))+geom_bar(colour="black")+theme_grey()
ggplot(mtcars, aes(x=gear, y=mpg, fill=gear)) +
  geom_bar(stat='identity', position='dodge')+theme_bw()
## Boxplot
ggplot(mtcars,aes(x=mpg,y=wt))+geom_boxplot()+theme()
##
pie <- ggplot(mtcars, aes(x = "", fill = factor(`gear`))) + 
  geom_bar(width = 1) +
  theme(axis.line = element_blank(), 
        plot.title = element_text(hjust=0.5)) + 
  labs(fill="gear", 
       x=NULL, 
       y=NULL, 
       title="Pie Chart of class", 
       caption="Source: LEAD")

pie + coord_polar(theta = "y", start=0)

