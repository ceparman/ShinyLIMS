

db$run( '{"findAndModify":"metadb","query": {"name" : "Tube"},"update":{"$inc":{"count":1}}, "new": "true"}' )
