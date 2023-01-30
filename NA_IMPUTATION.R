#Loading the mice package
library(mice)
#Loading the following package for looking at the missing values
library(VIM)
library(lattice)
data(nhanes)
colSums(is.na(nhanes))
md.pattern(nhanes)
#plot the missing values
nhanes_miss = aggr(nhanes, col=mdc(1:2), numbers=TRUE, sortVars=TRUE, labels=names(nhanes), cex.axis=.7, gap=3, ylab=c("Proportion of missingness","Missingness Pattern"))
#This marginplot is useful to understand if the missing values are MCAR.
#Drawing margin plot
marginplot(nhanes[, c("Ozone", "Solar.R")], col = mdc(1:2), cex.numbers = 1.2, pch = 19)

#Imputing missing values using mice
mice_imputes = mice(nhanes, m=5, maxit = 40)
mice_imputes$method

#Imputed dataset
Imputed_data=complete(mice_imputes,5)

# Goodness of fit
# The values are imputed but how good were they? The xyplot() and densityplot() functions 
# come into picture and help us verify our imputations
#Plotting and comparing values with xyplot()
xyplot(mice_imputes, Solar.R ~ Ozone | .imp, pch = 20, cex = 1.4)

#make a density plot
densityplot(mice_imputes)

#fit a linear model on all datasets together
lm_5_model=with(mice_imputes,lm(Ozone~Solar.R+Wind+Temp+Month+Day))

#Use the pool() function to combine the results of all the models
combo_5_model=pool(lm_5_model)



