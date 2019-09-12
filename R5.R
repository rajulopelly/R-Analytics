library("rvest")
library("stringi")
library("jsonlite")

connection <- DBI::dbConnect(odbc::odbc(), 
                             Driver = "SQL Server", 
                             Server = "172.28.30.25", 
                             Database = "lara_data", 
                             UID = "prodigydba", 
                             PWD = "3FsRxlD9ermiU1A!", 
                             Port = 1433)

data<- DBI::dbGetQuery(connection,"select top 78 [id]
                       ,[street_address]+','+ [city]+','+ [state] AS input 
                       from [dbo].[test_geocoding]")


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