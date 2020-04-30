

drop_database <-function(database,creds){
  
  
url_path = paste0("mongodb+srv://",creds$user,":",creds$pass,"@cluster0-wz8ra.mongodb.net/",database)

tryCatch({
db <- mongo(db=database,url = url_path )  

db$run( '{"dropDatabase": 1}' )

}, error=function(cond){print(paste('Error dropping database ', database))}
)
}




