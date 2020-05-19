

#' @title drop_database
#' @description Completly drops a database and all its collections
#' @param database database name
#' @param creds RDS credentials object
#' @return Returns message from mongo if sucessful, error message if not sucsessful
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  d <- drop_database(lims_database,creds)
#'
#'expect_equal(d$ok,1)
#'  }
#' }
#' @rdname drop_database
#' @export 

drop_database <-function(database,creds){
  
  
url_path = paste0("mongodb+srv://",creds$user,":",creds$pass,"@cluster0-wz8ra.mongodb.net/",database)

tryCatch({
db <- mongo(db=database,url = url_path )  

db$run( '{"dropDatabase": 1}' )

}, error=function(cond){print(paste('Error dropping database ', database))}
)
}




