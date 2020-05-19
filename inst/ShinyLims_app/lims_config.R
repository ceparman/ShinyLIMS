
lims_types <- list("things","people","assays","experiments","reports")

data_types =c("string","int","float","boolean","date","array","file","script")



#build validation doc for metadata collection

name <- list( bsonType = "string", 
              description = "must be a string and is required"
) 

table <- list( enum =paste0(unlist(lims_types),"db"),
               description= "table to store objects and is required"
)

type <- list( bsonType = "string", 
              description = "type of objects and is required"
)

fields <-list( bsonType = "string",
                  description = "fields for objects as comma sep. string and is required"
)

fieldtype <-list(   bsonType = "string",
                  description = "field types for objects as comma sep. string and is required"
)

fieldreq <-list(   bsonType = "string",
                     description = "Is field for object  required as comma sep. Y or N"
)

bccount <-   list( bsonType = "int",
                   description = "current bc count"
)
bcprefix <- list( bsonType = "string",
                  description = "bc prefix and is required"
)


properties <- list(name= name,table =table, type=type,fields=fields,fieldtype=fieldtype,fieldreq = fieldreq,bccount=bccount,bcprefix=bcprefix)


required <-  names(properties)


`$jsonSchema` <- list( bsonType = "object",
                       required = required,
                       properties = properties
)
schema <-list(`$jsonSchema` = list( bsonType = "object",
                                    required = required,
                                    properties = properties
)
)

valdoc <- paste0('"validator":',toJSON(schema,auto_unbox = T,pretty = T) )