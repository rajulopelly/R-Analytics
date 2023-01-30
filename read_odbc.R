# read_odbc.R
library(DBI); library(odbc);library(dbplyr);library(tidyverse);library(lubridate);library(stringr)

# Make connections ####
# Requires that user has a system DSN using Windows authentication for each DB names below, with same names
# swmbh_db <- DBI::dbConnect(odbc::odbc(), "swmbh")
# ref_tables_bh_db <- DBI::dbConnect(odbc::odbc(), "ref_tables_bh")

swmbh_db <- DBI::dbConnect(odbc::odbc(), 
                           Driver = "SQL Server", 
                           Server = "172.28.30.25", 
                           Database = "swmbh", 
                           UID = "prodigydba", 
                           PWD = "3FsRxlD9ermiU1A!", 
                           Port = 1433)

df<-dbGetQuery(connection,"select*from raju")
ref_tables_bh_db <- DBI::dbConnect(odbc::odbc(), 
                                   Driver = "SQL Server", 
                                   Server = "172.28.30.25", 
                                   Database = "ref_tables_bh", 
                                   UID = "prodigydba", 
                                   PWD = "3FsRxlD9ermiU1A!", 
                                   Port = 1433)

# Create local references to SWMBH tables ####
db <- list()
db$locus_to_auths <- tbl(swmbh_db, "locus_to_auths")
db$fas_to_auths <- tbl(swmbh_db, "fas_to_auths")
db$service_groups_ref_db <- tbl(swmbh_db, "service_groups_ref")

# Create local refs to mapping tables ####
db$ebp_service_mins_ref_db <- tbl(ref_tables_bh_db, "ebp_service_mins_ref")



