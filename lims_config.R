
lims_types <- list("things","people","assays","experiments","reports")

data_types =c("string","int","float","boolean","date","array","file","script")


name <- list( bsonType = "string", 
              description = "must be a string and is required"
) 

table <- list( enum =paste0(unlist(lims_types),"db"),
               description= "table to store objects and is required"
)

type <- list( bsonType = "string", 
              description = "type of objects and is required"
)

reqfields <-list( bsonType = "string",
                  description = "required fields for objects as comma sep. string and is required"
)
reqtypes <-list(   bsonType = "string",
                  description = "required field types for objects as comma sep. string and is required"
)

bccount <-   list( bsonType = "int",
                   description = "current bc count and is required"
)
bcprefix <- list( bsonType = "string",
                  description = "bc prefix and is required"
)


properties <- list(name= name,table =table, type=type,reqfields=reqfields,reqtypes=reqtypes,bccount=bccount,bcprefix=bcprefix)


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