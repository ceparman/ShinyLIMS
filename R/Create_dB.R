
#' @title lims_Ccreate
#' @description Creates tables for ShinyLIMS
#' @param lims_database Database name.
#' @param creds RDS object with database user and pass
#' @param lims_types LIMS collections to be created.  Ussually read from lms_config.R
#' @param valdoc validation json doc that used in creating metadata table
#' @return returns "created LIMS successful" if sucsessful or error message if function fails. 
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  lims <- lims_create(lims_database,creds,lims_types,valdoc)
#'  }
#' }
#' @rdname lims_create
#' @export 

lims_create <- function(lims_database,creds,lims_types,valdoc)
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


create_metadb(db,valdoc)

}, error=function(cond){return("Error Creating database")} 
)  

}
