library(tidyverse)
library(osmdata)
library(sf)
library(ggmap)
library(readxl)
library(remotes)
library(ggmap)
library(nominatim)
remotes::install_github("hrbrmstr/nominatim")
location <- read_excel("C:/Users/raju/Desktop/location.xlsx")
View(location)
#geocode_OSM(q, projection = NULL, return.first.only = TRUE,details = FALSE, as.data.frame = NA, as.sf = FALSE,server = "http://nominatim.openstreetmap.org")
LonLat <- data.table::rbindlist(
  lapply(location, function(x, key) {
    
    lon_lat <- osm_geocode(x, key = key)
    
    lat <- ifelse(is.null(lon_lat$lat), NA, lon_lat$lat)
    lon <- ifelse(is.null(lon_lat$lon), NA, lon_lat$lon)  
    
    return(list(location = x, Lat = lat, Lon = lon))
    
  } , key = "AIzaSyBFLk3XoKRNv6l7-7JmHciGdxGqYRqFUeA"))
setRepositories()
