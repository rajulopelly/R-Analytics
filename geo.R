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




































################
# Geocoding a excel column of "addresses" in R

# load ggmap
library(ggmap)

# Select the file from the file chooser
fileToLoad <- file.choose(new = TRUE)

# Read in the excel data and store it in a variable 
origAddress <- read.csv(fileToLoad, stringsAsFactors = FALSE)
library(googleway)

key <- "AIzaSyBm-lM73H3TNqbrBwfUX08_FwFCUXBFKT4"

library(devtools)  
devtools::install_github(repo = 'rCarto/photon',force = TRUE)


# Loop through the addresses to get the latitude and longitude of each address and add it to the
# origAddress data frame in new columns lat and lon
for(i in 1:nrow(origAddress)) {
  result <- tryCatch(geocode(origAddress$city[i], output = "latlona", source = "google"),
                     warning = function(w) data.frame(lon = NA, lat = NA, city = NA))
  origAddress$lon[i] <- as.numeric(result[1])
  origAddress$lat[i] <- as.numeric(result[2])
  origAddress$city[i] <- as.character(result[3])
}
# Write a CSV file containing origAddress to the working directory
write.csv(origAddress, "geocoded.csv", row.names=FALSE)

library(googleway)

key <- "AIzaSyBXveym5tVqqJzqenbpQQM15Pi2S0P8E-o"

google_geocode(address = "San Francisco",
               key = key)

###############