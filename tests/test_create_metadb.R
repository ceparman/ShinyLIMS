##tests


#for testing only - to be removed
library(testthat)
library(mongolite)
library(jsonlite)

print(getwd())

source("../lims_config.R")
source("../CreateScripts/create_metadb.R")


#Requires lims_database to be defined
#lims_database <- "lims_development"
creds <- readRDS("../CreateScripts/creds.RDS")
#test for create_metab


url_path = paste0("mongodb+srv://",creds$user,":",creds$pass,"@cluster0-wz8ra.mongodb.net/admin")



db <- mongo(db=lims_database,url = url_path )  


create_metadb(db)



metadb <- mongo(db=lims_database,url = url_path ,collection = "metadb",verbose = T)  

test_that("required fields work", {

  entry <- data.frame(type="thing",count=1)
   
  expect_error(metadb$insert(entry))
  
  entry2 <- data.frame(name ="tube",table ="thingsdb",type="container",reqfields=paste("vol","format",sep=","),
                       bccount =as.integer(0),bcprefix="Tub",stringsAsFactors = F
                       )
  result <- metadb$insert(entry2)
  expect_equal(length(result$writeErrors) ,expected =  0)
  






entry3<- data.frame(name ="vial",table ="thingsdb",type="container",reqfields=paste("vol","format",sep=","),bccount =as.integer(0),bcprefix="Tub",stringsAsFactors = F
)

expect_error(metadb$insert(entry3))



entry4 <- data.frame(name ="vial",table ="thingsdb",type="container",reqfields=paste("vol","format",sep=","),bccount =as.integer(0),bcprefix="Vial",stringsAsFactors = F
)

result <- metadb$insert(entry4)
expect_equal(length(result$writeErrors) ,expected =  0)
})

