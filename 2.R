library(tidyverse)
library(dplyr)
library(DBI)
library(odbc)
library(RODBC)
library(httr)
library(rjson)
library(jsonlite)
#choose.files()
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
data_all <- data.frame()
for (row in 1:nrow(data)) {
  input <- data[row, "input"]
  id <- data[row, "id"]
  
  
  print(paste(id))
  
  Address<-paste0("[",paste(paste0("\"",input,"\""),collapse=","),"]")
  
  url  <- "http://www.datasciencetoolkit.org/street2coordinates"
  
    response <- POST(url,body=Address,handle = NULL)
    json     <- fromJSON(content(response,type="text",encoding = "UTF-8"))
    data_all <- bind_rows(data_all, json)
     
}






data_all <- data.frame()
response <- toJSON(mtcars, pretty=TRUE)
for(i in 1:3){
  data <- fromJSON(response)
  data_all <- bind_rows(data_all, data)
}




