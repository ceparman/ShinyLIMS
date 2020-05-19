##tests


#for testing only - to be removed

library(mongolite)
library(jsonlite)

print(getwd())

source("test_files/lims_config.R")
# source("../CreateScripts/create_metadb.R")
# source("../CreateScripts/Create_dB.R")
# source("../CreateScripts/drop_database.R")
# 
creds <- readRDS("../../credentials/creds.RDS")
# 
# 
 lims_database <- "lims_test"
# 
# #for testing only - to be removed
# 
# 
 d <- drop_database(lims_database,creds)
# 
 expect_equal(d$ok,1)
# 
# 
# 
# 
# 
 lims <- lims_create(lims_database,creds,lims_types,valdoc)
 
 test_that("created LIMS successful", {
expect_equal(lims$createdCollectionAutomatically,F)
}
)

lims_fail <- lims_create(lims_databas,creds,lims_types)

test_that("failed LIMS", {
  expect_equal(lims_fail,"Error Creating database")
   }
)


url_path = paste0("mongodb+srv://",creds$user,":",creds$pass,"@cluster0-wz8ra.mongodb.net/",lims_database)


metadb <- mongo(db=lims_database,url = url_path ,collection = "metadb",verbose = T)


test_that(" create_metadb_entry works", {
  
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
  
  # toJSON(fields,auto_unbox = T,pretty = T)
  
  fieldList <- toJSON(fields,auto_unbox = T)
  
  
  result  <- create_metadb_entry(metadb,"Vial","thingsdb","container",fieldList,"V") 
  # result
  
  expect_equal(length(result$writeErrors) ,expected =  0)
  
})






print("pausing")

Sys.sleep(10)

d <- drop_database(lims_database,creds)

expect_equal(d$ok,1)



