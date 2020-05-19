

#' @title create _metadb
#' @description Creates meta data collection using a validation doc.
#' @param db longolite db connection
#' @param valdoc json validation doc
#' @return returns erro message if function fails
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  create_metadb(db,valdoc)
#'  }
#' }
#' @rdname create_metadb
#' @export 

create_metadb <- function(db,valdoc ){
  
tryCatch(  { 
#Drop metadb it if it exists


tryCatch( {
  
  eval( parse(text = paste0("db$run(",toJSON( paste0('{"drop":"metadb"}')  ,auto_unbox = T),")" )
  )
  )   
}, error=function(cond){}
)

#Create validator  
#needs to be scripted at some point.



#Create empty table

eval( parse(text = paste0("db$run(",toJSON( paste0('{"create":"metadb",',valdoc,'}')  ,auto_unbox = T),")" )
)
)


#create indexes

db$run( '{"createIndexes":"metadb","indexes":[{"key":{"name":1},"name":"typename","unique":"true"}]  }' )

db$run( '{"createIndexes":"metadb","indexes":[{"key":{"bcprefix":1},"name":"bcprefix","unique":"true"}]  }' )

}, error=function(cond){print('Error creating metadb')}
)

}
