library(tidyverse)
library(ggmap)
library(osmdata)
library(dplyr)
library(DBI)
library(odbc)
library(RODBC)
library(httr)
library(rjson)
library(sf)
library(tmap)
library(tmaptools)
library(rvest)
library(stringi)
#library(nominatim)
#devtools::install_github("hrbrmstr/nominatim")
#choose.files()
connection <- DBI::dbConnect(odbc::odbc(), 
                             Driver = "SQL Server", 
                             Server = "172.28.30.25", 
                             Database = "lara_data", 
                             UID = "prodigydba", 
                             PWD = "3FsRxlD9ermiU1A!", 
                             Port = 1433)

data<- DBI::dbGetQuery(connection,"select top 78 [id]
                      ,[street_address]+','+ [city]+','+ [state]
                       AS input from [dbo].[test_geocoding]")

data1<-geocode_OSM("6680 Adrian Avenue SE,Grand Rapids,MI", 
                   projection = NULL, 
                   return.first.only = TRUE,
                   details = TRUE, 
                   as.data.frame = , 
                   as.sf = FALSE,
                   server = "https://overpass.nchc.org.tw/")










geocode_OSM(q, projection = PROJ4, return.first.only = TRUE,
            details = FALSE, as.data.frame = NA, 
            as.SPDF = TRUE, server = "http://nominatim.openstreetmap.org")
                   
##################################################################################
Address<-paste("[",paste(paste("\"",data$street_address,"\""),collapse=","),"]")

url  <- "http://nominatim.openstreetmap.org"

response <- POST(url,body=Address)
json     <- fromJSON(content(response,type="text",encoding = "UTF-8"))
#geocode  <-sapply(json,function(x) c(long=x$longitude,lat=x$latitude))
#class(geocode)
#
LonLat <- data.table::rbindlist(
  lapply(json, function(x, key) {
    
    lon_lat <- osm_geocode(x, key = key)
    
    lat <- ifelse(is.null(lon_lat$lat), NA, lon_lat$lat)
    lon <- ifelse(is.null(lon_lat$lon), NA, lon_lat$lon)  
    
    return(list(json = x, Lat = lat, Lon = lon))
    
  } , key = "AIzaSyB36hx__LXqedoADWaAOXO7Q5OGdP8lYM8"))
