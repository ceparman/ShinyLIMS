
#' @title create_metadb_entry
#' @description creates a new object type in the metadata collection
#' @param db_connection mongolite connection to metadb table
#' @param name Name ob object type. Must be unique in metadb table
#' @param table collection that will hold instances of this type.
#' @param type object type used for searching (to be controlled a some point)
#' @param fields list of fields for objects
#' @param fieldreq "Y","N" list to determine if the field is required.
#' @param bcprefix Prefix for barcode generation.
#' @return Error message if not succesful.
#' @details  Parameter table must be from lims_types defined in lims_config.
#' @details  Allowed data types are datatypes defined in lims_config. 
#' @details  Currently "string","int","float","boolean","date","array","file","script" are allowed.
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname create_metadb_entry
#' @export 

create_metadb_entry <- function(db_connection,name,table,type,fields,bcprefix) {
   
   #Could add validation her, but creation attempt will validate this on creation,
   
   entry<- list(name =name,table =table,type=type,fields = fields,
                bccount =as.integer(0),bcprefix=bcprefix
   )
   
   entryList <-toJSON(entry,auto_unbox = T,pretty = T) 
   
   db_connection$insert(entryList)
   
   
}


