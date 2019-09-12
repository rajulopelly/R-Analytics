library(tidyverse)
library(ggmap)
library(readxl)
library(dplyr)
library(devtools)
library(DBI)
library(odbc)
library(RODBC)
library(sqldf)
con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "172.28.30.25", 
                      Database = "NPIData", 
                      UID = "prodigydba", 
                      PWD = "3FsRxlD9ermiU1A!", 
                      Port = 1433)
list <- dbListTables(con)
View(list)
Census_Tract<- DBI::dbGetQuery(con,"select top 10 * from [test_geocoding]")
View(Census_Tract)
names(Census_Tract)


Census_Tract<-within(Census_Tract, address <- paste(Census_Tract$street_address,Census_Tract$city,Census_Tract$state,Census_Tract$zip,sep=','))


#Address <- distinct(Census_Tract, address)
#Address

Result_df<-data.frame(Census_Tract$id,Address)
view(Result_df)
register_google(key ="AIzaSyDeMPVHR7TwAPpMREvvYvOG7_PDAun8I_k")
locations_df<- mutate_geocode(Result_df,address)
locations_df

