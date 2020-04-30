

source("../CreateScripts/drop_database.R")
creds <- readRDS("../CreateScripts/creds.RDS")
#test for create_metab

lims_database <- paste0(LETTERS[sample(1:24,6)],collapse = "")

url_path = paste0("mongodb+srv://",creds$user,":",creds$pass,"@cluster0-wz8ra.mongodb.net/",lims_database)

db <- mongo(db=lims_database,url = url_path ) 

drop_database(lims_database,creds)


eval( parse(text = paste0("db$run(",toJSON( paste0('{"create":"testdb"}')  ,auto_unbox = T),")" )
)
)

d <- drop_database(lims_database,creds)

expect_equal(d$ok,1)





