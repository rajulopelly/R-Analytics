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

Address<-paste0("[",paste(paste0("\"",data$input,"\""),collapse=","),"]")

url  <- "http://www.datasciencetoolkit.org/street2coordinates"

response <- POST(url,body=Address)

#class(content(response))
length(content(response))
json     <- fromJSON(content(response,type="text",encoding = "UTF-8"))
length(json)
geocode  <-sapply(json,function(x) c(addr=x$address,long=x$longitude,lat=x$latitude))
length(geocode)
class(geocode)
library(dplyr)
df <- data.frame(matrix(unlist(geocode), ncol = max(lengths(geocode)), byrow = TRUE))
#geocode<-as.data.frame(do.call(rbind,geocode))
#bind_rows(lapply(geocode, as.data.frame(geocode)))
#a<-as.data.frame(data.table::transpose(geocode), col.names = names(geocode[[1]]))
#setNames(do.call(rbind.data.frame, geocode), c("address","longitude","latitude"))

mydf<-cbind(rownames(geocode),geocode)
rownames(mydf)<-NULL
colnames(mydf)<-c("address","longitude","latitude")
#merge(Census_Tract, mydf, by="address")
library(plyr)
final_output<-join(input, mydf, by="address", type="inner")

dbWriteTable(connection = connection, 
             name = "Geocode", 
             value = final_output,
             overwrite = T)
          