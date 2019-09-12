library(tidyverse)
library(ggmap)
library(osmdata)
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
library(jsonlite)
library(tibble)
connection <- DBI::dbConnect(odbc::odbc(), 
                             Driver = "SQL Server", 
                             Server = "172.28.30.25", 
                             Database = "lara_data", 
                             UID = "prodigydba", 
                             PWD = "3FsRxlD9ermiU1A!", 
                             Port = 1433)

data<- DBI::dbGetQuery(connection,"select top 200 * from [dbo].[test_geocoding]")

names(data)

# REMOVE SPACE FROM COLUMNS
colnames(data) <- str_replace_all(colnames(data)," ", "_")

# CLEAN SPECIAL CASES (e.g. 1 N MAY BLDG)
query <- str_replace_all(string = data$street_address, 
                         pattern = "BLDG", 
                         replacement = " ")
# CLEAN SPECIAL CASES (e.g. 3333-3339 N CLARK)
query <- stri_replace(str = query, 
                      replacement = " ", 
                      regex = "(-[0-9]+\\s)")
# REPLACE SPACES (\\s) OR COMMAS (,) WITH PLUS SIGN (+)
query <- str_replace_all(string = query, 
                         pattern = "\\s|,", 
                         replacement = "+")

format_lat_long<-within(data, address <- paste(query,data$city,data$state,data$zip,sep=','))

#geocode <- function( id,street_address,city,state,zip)
#OSM Api URL
osm_url <- "https://z.overpass-api.de/api/interpreter"
response <- POST(osm_url,body=Address)
# CREATE A FULL ADDRESS
addr <- paste(data$street_address, data$city,data$state,data$zip, sep = "%2C")


#create search url based on OSM Api to geojson
requests <- paste0(osm_url,query,"&format=geojson")

# iterate url to get APIS
for (i in 1:length(requests)) {
    
# QUERY THE API TRANSFORM RESPONSE FROM JSON TO R LIST
response <- read_html(requests[i]) %>%
      html_node("p") %>%
      html_text() %>%
      fromJSON()
}
    # FROM THE RESPONSE EXTRACT LATITUDE AND LONGITUDE COORDINATES
    lon <- response$features$geometry$coordinates[[1]][1]
    lat <- response$features$geometry$coordinates[[1]][2]
    
    # CREATE A COORDINATES DATAFRAME
    if(i == 1) {
      loc <- tibble(name = name[i], 
                    address = str_replace_all(addr[i], "%2C", ","),
                    latitude = lat, longitude = lon)
    }else{
      df <- tibble(name = name[i], 
                   address = str_replace_all(addr[i], "%2C", ","),
                   latitude = lat, longitude = lon)
      loc <- bind_rows(loc, df)
    }
  
  return(loc)


df <- geocode(id = data$id,
              address = query,
              city = data$city, 
              state = data$state,
              zipcode = data$zip)