

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


# valdoc <- '"validator": { "$jsonSchema":{ "bsonType": "object",
#                                          "required": ["name","table","type","reqfields","bccount","bcprefix"],
#                                          "properties": {
#                                                          "name": {
#                                                          "bsonType": "string",
#                                                          "description": "must be a string and is required"
#                                                          },
#                                                          "table": {
#                                                          "enum": [ "thingsdb","assaysdb","experimentsdb","peopledb","reportsdb"],
#                                                          "description": "table to store objects and is required"
#                                                          },
#                                                          "type": {
#                                                          "bsonType": "string",
#                                                          "description": "type of objects and is required"
#                                                          },
#                                                          "reqfields": {
#                                                          "bsonType": "string",
#                                                          "description": "reqired fields for objects as comma sep. string and is required"
#                                                          },
#                                                          "bccount": {
#                                                           "bsonType": "int",
#                                                          "description": "current bc count and is required"
#                                                           },
#                                                         
#                                                          "bcprefix": {
#                                                          "bsonType": "string",
#                                                          "description": "bc prefix and is required"
#                                                          }
# 
#                                                          
#                                                       }         
#                                        }
#                      }'             
# 
# 
# 
# 


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
