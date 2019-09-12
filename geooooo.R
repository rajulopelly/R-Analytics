library(tidyverse)
library(ggmap)
library(readxl)
library(dplyr)
library(devtools)
ex <- read_excel("ex.xlsx")
df<-ex
rm(ex)
names(df)
df
Street_Address <- distinct(df, Street_Address)
Street_Address
#destinations <- distinct(df, destination)
#destinations
#cities <- full_join(sources, destinations, by = c("source" = "destination"))
#cities
#cities <- rename(cities, place = source)
#head(cities, n = 2)
#cities_df <- as.data.frame(cities)
register_google(key ="AIzaSyCBR5i4G1XMpkr-hu4IHlUlOnUKCVXKZ_Q")
#geocode("cities_df")
locations_df <- mutate_geocode(Street_Address,Street_Address)
locations_df
locations <- as_tibble(locations_df)
