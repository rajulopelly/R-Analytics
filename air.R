data("airquality")
names(airquality)
summary(airquality$Ozone)
colSums(is.na(airquality))
which(is.na(airquality$Ozone,airquality$Solar.R))
str(airquality)
#missing values
library(mice)
md.pattern(airquality)
cleaned_airquality<-mice(airquality,m=5,maxit = 40)

#Imputed dataset
Imputed_data=complete(cleaned_airquality,5)


maximum<-










