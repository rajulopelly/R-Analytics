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
