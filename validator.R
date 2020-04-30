
db <- mongo(db=lims_database,url = url_path ,collection = "metadb",verbose = T)  

eval( parse(text = paste0("db$run(",toJSON( paste0('{"drop":"metadb"}')  ,auto_unbox = T),")" )   )
)


valdoc <- '"validator": { "$jsonSchema": 
                                       { "bsonType": "object",
                                         "required": ["name","table","type","reqfields","bccount","bcprefix"],
                                         "properties": {
                                                         "name": {
                                                         "bsonType": "string",
                                                         "description": "must be a string and is required"
                                                         },
                                                         "table": {
                                                         "enum": [ "thingsdb","assaysdb","experimentsdb","peopledb","reportsdb"],
                                                         "description": "table to store objects and is required"
                                                         },
                                                         "type": {
                                                         "bsonType": "string",
                                                         "description": "type of objects and is required"
                                                         },
                                                         "reqfields": {
                                                         "bsonType": "string",
                                                         "description": "reqired fields for objects as comma sep. string and is required"
                                                         },
                                                         "bccount": {
                                                          "bsonType": "int",
                                                         "description": "current bc count and is required"
                                                          },
                                                        
                                                         "bcprefix": {
                                                         "bsonType": "string",
                                                         "description": "bc prefix and is required"
                                                         }

                                                         
                                                      }         
                                       }
                     }'             





eval( parse(text = paste0("db$run(",toJSON( paste0('{"create":"metadb",',valdoc,'}')  ,auto_unbox = T),")" )
)
)








entry <- data.frame(type="thing",count=1)
db$insert(entry)
entry2 <- data.frame(name ="tube",table ="thingsdb",type="container",reqfields=paste("vol","format",sep=","),bccount =as.integer(0),bcprefix="Tub",stringsAsFactors = F
                     )

db$insert(entry2)




mongo1$update('{"_id":{"$oid":"5e9f3373a75faa0a0a57c13b"}}' ,  '{"$inc":{"a":1}}', )

