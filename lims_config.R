
lims_types <- list("things","people","assays","experiments","reports")

meta_data <- list(
  
                  things = list( name =c("string")
                                 ),
                  people = list( first =c("string"),
                                 last=c("string"),
                                 email=c("string"),
                                 role=c("enum","admin","users")
                                 ),
                  assay = list(name=c("string")
                               ),
                  experiments = list(name=c("string")
                                     ),
                  reports = list(name=c("string"),
                                 format = c("enum","rmarkdown","rscript")
                                 )
                  
                    
                  )
                  
           