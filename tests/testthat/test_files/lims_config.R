
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
                  description = "fields for objects as json string"
)


bccount <-   list( bsonType = "int",
                   description = "current bc count"
)
bcprefix <- list( bsonType = "string",
                  description = "bc prefix and is required"
)



properties <- list(name= name,table =table, type=type,fields=fields,
                   bccount=bccount,bcprefix=bcprefix)


required_properties <- list(name= name,table =table, type=type,fields=fields,bccount=bccount,bcprefix=bcprefix)


required <-  names(required_properties)


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
