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

data<- DBI::dbGetQuery(connection,"select top 200 * from [dbo].[test_geocoding]")

Address<-paste("[",paste(paste("\"",data$street_address,"\""),collapse=","),"]")

url  <- "http://www.datasciencetoolkit.org/street2coordinates"

response <- POST(url,body=Address)
json     <- fromJSON(content(response,type="text",encoding = "UTF-8"))
geocode  <-sapply(json,function(x) c(long=x$longitude,lat=x$latitude))
geocode<-as.data.frame(t(geocode))

mydf<-cbind(rownames(geocode),geocode)
rownames(mydf)<-NULL
colnames(mydf)<-c("address","longitude","latitude")
#merge(Census_Tract, mydf, by="address")
library(plyr)
final_output<-join(format_lat_long, mydf, by="address", type="inner")

#Storing the formated output in the database
dbWriteTable(connection = connection, 
             name = "Geocode", 
             value = final_output,
             overwrite = T)

##################################################################################
data<-as.tibble(final_output)
#mapview
library(sf)
library(mapview)
locations_sf <- st_as_sf(data, coords = c("longitude","latitude"), crs = 4326)
mapview(locations_sf)

