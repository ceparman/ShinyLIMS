


shinyServer(function(input, output, session) {


  
   samples_m     <- callModule(samplesTab,"samplesTab1")
   experiments_m <- callModule(experimentsTab,"experiments1")
   data_m        <- callModule(dataTab,"data1")
   materials_m   <- callModule(materialsTab,"materials1")
   equipment_m   <- callModule(equipmentTab,"equipment1")
   user_m        <- callModule(userTab,"user1")
   admin_m       <- callModule(adminTab,"admin1")
   
  }) 
  
  



