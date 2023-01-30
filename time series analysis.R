#ARIMA#
data("AirPassengers")
class(AirPassengers)#to know it is time series or not
start(AirPassengers)#starting time
end(AirPassengers)
frequency(AirPassengers)# to know the time period of it
summary(AirPassengers)
library(dplyr)
library(ggplot2)
plot(AirPassengers)
abline(reg = lm(AirPassengers~time(AirPassengers)))# this will fit a line
cycle(AirPassengers)  ##This will print the cycle across years.
data()
data(package = .packages(all.available = TRUE))
