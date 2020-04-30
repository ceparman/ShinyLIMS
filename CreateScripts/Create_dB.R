
lims_create <- function(lims_database,creds,lims_types)
{

tryCatch({
  
#create database
  
  
url_path = paste0("mongodb+srv://",creds$user,":",creds$pass,"@cluster0-wz8ra.mongodb.net/admin")



  
db <- mongo(db=lims_database,url = url_path )  



#create colections

for(x in lims_types){

  
  #Drop it if it exists


  tryCatch( {
    
  eval( parse(text = paste0("db$run(",toJSON( paste0('{"drop":"',x,'db"}')  ,auto_unbox = T),")" )
  )
  )   
  }, error=function(cond){}
  )

#Create empty collection  
    
 eval( parse(text = paste0("db$run(",toJSON( paste0('{"create":"',x,'db"}')  ,auto_unbox = T),")" )
           )
        )
 

  
  
}


create_metadb(db)

}, error=function(cond){return("Error Creating database")} 
)  

}
