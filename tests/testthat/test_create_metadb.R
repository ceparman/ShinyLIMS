##tests


#for testing only - to be removed
library(testthat)
library(mongolite)
library(jsonlite)


source("test_files/lims_config.R")



#Requires lims_database to be defined
#lims_database <- "lims_development"
creds <- readRDS("../../credentials/creds.RDS")
#test for create_metab


url_path = paste0("mongodb+srv://",creds$user,":",creds$pass,"@cluster0-wz8ra.mongodb.net/admin")

lims_database <- "lims_test"


d <- drop_database(lims_database,creds)

db <- mongo(db=lims_database,url = url_path )  


create_metadb(db,valdoc)



metadb <- mongo(db=lims_database,url = url_path ,collection = "metadb",verbose = T)  


field1<- list(  name="vol",
                fieldtype="float",
                fieldreq = "t",
                controled_vocab = NULL
)

field2<- list(  name="format",
                fieldtype="enum",
                fieldreq = "t",
                controled_vocab = c("long","short")
)

field3<- list(  name="material",
                fieldtype="string",
                fieldreq = "f",
                controled_vocab = NULL
)


fields <- list(field1=field1,field2=field2,field3=field3)



fieldList <- toJSON(fields,auto_unbox = T)





test_that("required fields work", {

  entry <- data.frame(type="thing",count=1)
   
  expect_error(metadb$insert(entry))
  
}) 
  
test_that(" create_metadb_entry works", {

  
  result  <- create_metadb_entry(metadb,"Vial","thingsdb","container",fieldList,"V") 
  expect_equal(length(result$writeErrors) ,expected =  0)
  
})
  

test_that("duplicate entry fails", {



  # result
  expect_error(create_metadb_entry(metadb,"Vial","thingsdb","container",fieldList,"V") )



})

test_that("duplicate bc prefix fails", {


  expect_error(create_metadb_entry(metadb,"Vial2","thingsdb","container",fieldList,"V") )



})


test_that("duplicate name fails", {


  expect_error(create_metadb_entry(metadb,"Vial","thingsdb","container",fieldList,"V2") )



})
# 
# 
# #entry3<- data.frame(name ="vial",table ="thingsdb",type="container",reqfields=paste("vol","format",sep=","),bccount =as.integer(0),bcprefix="Tub",stringsAsFactors = F
# #)
# 
# #expect_error(metadb$insert(entry3))
# 
# 
# 
# #entry4 <- data.frame(name ="vial",table ="thingsdb",type="container",reqfields=paste("vol","format",sep=","),bccount =as.integer(0),bcprefix="Vial",stringsAsFactors = F
# #)
# 
# #result <- metadb$insert(entry4)
# #expect_equal(length(result$writeErrors) ,expected =  0)
# #})
# 
