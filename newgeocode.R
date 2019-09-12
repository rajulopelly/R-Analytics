library("httr")
library(tidyverse)
library(devtools)
library(RCurl)
library(urltools)
library(DBI)
library(odbc)
library(RODBC)

#Establish database connection 
connection <- DBI::dbConnect(odbc::odbc(), 
                             Driver = "SQL Server", 
                             Server = "172.28.30.25", 
                             Database = "NPIData",
                             UID = "prodigydba", 
                             PWD = "3FsRxlD9ermiU1A!", 
                             Port = 1433)

#Query to fetch the data from SQL  
Census_Tract<- DBI::dbGetQuery(connection,"select * from [test_geocoding]")

#store the data in a temp .csv file
geo <- tempfile(fileext = ".csv")
write.csv(Census_Tract, geo, row.names = FALSE)

#Function to conver the input address to desiered output
apiurl <- "https://geocoding.geo.census.gov/geocoder/geographies/addressbatch"
list_output <- POST(apiurl, body= list(addressFile = upload_file(input), 
                                       benchmark = "Public_AR_Current",
                                       vintage = "Current_Current"
), 
encode="multipart"
)

content(list_output)


cat(content(list_output, "text", encoding = "UTF-8"), "\n")

#Storing the Encoded data in a file  
cat(content(list_output, "text", encoding = "UTF-8"), file="output.csv")

#Converting the output to a data frame
df_output<-read.csv(file ="output.csv",header = FALSE,
                    col.names = c("RECORD_ID_NUMBER", "INPUT_ADDRESS", 
                                  "TIGER_ADDRESS_RANGE_MATCH_INDICATOR", 
                                  "TIGER_MATCH_TYPE","TIGER_OUTPUT_ADDRESS", 
                                  "LONGITUDE_LATITUDE", "TIGERLINE_ID",
                                  "TIGERLINE_ID_SIDE", "STATE_CODE", "COUNTY_CODE",
                                  "TRACT_CODE", "BLOCK_CODE"))