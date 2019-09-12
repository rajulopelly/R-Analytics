library(tidyverse)
library(dplyr)
library(DBI)
library(odbc)
library(RODBC)
library(httr)
library(rjson)
#choose.files()
connection <- DBI::dbConnect(odbc::odbc(), 
                             Driver = "SQL Server", 
                             Server = "172.28.30.25", 
                             Database = "lara_data", 
                             UID = "prodigydba", 
                             PWD = "3FsRxlD9ermiU1A!", 
                             Port = 1433)

data<- DBI::dbGetQuery(connection,"select distinct [street_address]+','+ [city]+','+ [state]+','+ [zip] AS input from [dbo].[test_geocoding]")

LonLat <- data.table::rbindlist(
  lapply(Location, function(x, key) {
    
    lon_lat <- osm_geocode(x, key = key)
    
    lat <- ifelse(is.null(lon_lat$lat), NA, lon_lat$lat)
    lon <- ifelse(is.null(lon_lat$lon), NA, lon_lat$lon)  
    
    return(list(Location = x, Lat = lat, Lon = lon))
    
  } , key = "enter your key"))