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
library(jsonlite)
library(tibble)
# READ THE DATA
library(readxl)
data<- read_excel("C:/Users/raju/Desktop/chicago.xlsx")
View(chicago)
# REMOVE SPACE FROM COLUMNS
colnames(data) <- str_replace_all(colnames(data)," ", "_")

# REMOVE SPACE FROM RESULTS
data$Results <- data$Results %>% 
  str_replace_all(" w/ ", " with ") %>% 
  str_replace_all(" ", "_")
# EXTRACT RISK LEVEL 
data$Risk <- tolower(data$Risk) %>% 
  str_extract("\\(.*\\)") %>% 
  str_extract("[a-z]+")
head(data)
df <- geocode(name = data$DBA_Name,
              address = query,
              city = data$City, 
              state = data$State,
              zipcode = data$Zipcode)

geocode <- function(name, address, city, state, zipcode){
  # NOMINATIM SEARCH API URL
  src_url <- "https://nominatim.openstreetmap.org/search?q="
  
  # CREATE A FULL ADDRESS
  addr <- paste(address, city, state, zipcode, sep = "%2C")
  
  # CREATE A SEARCH URL BASED ON NOMINATIM API TO RETURN GEOJSON
  requests <- paste0(src_url, query, "&format=geojson")
  
  # ITERATE OVER THE URLS AND MAKE REQUEST TO THE SEARCH API
  for (i in 1:length(requests)) {
    
    # QUERY THE API TRANSFORM RESPONSE FROM JSON TO R LIST
    response <- read_html(requests[i]) %>%
      html_node("p") %>%
      html_text() %>%
      fromJSON()
    
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
  }
  return(loc)
}























