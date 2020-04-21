dashboardPage(
    dashboardHeader(title = "Shiny LIMS"),

    
    dashboardSidebar(
    
    h3("Menu"),
    
    sidebarMenu(
      menuItem("Sample Management", tabName = "samples"),
      menuItem("Experiments", tabName = "experiments"),
      menuItem("Data Manangement", tabName = "data"),
      menuItem("Material Management", tabName = "materials"),
      menuItem("Equipment", tabName = "equipment"),
      menuItem("User Profile", tabName = "user"),
      menuItem("Adminstration", tabName = "admin")
    )
  ),
  dashboardBody(
  
    
    tabItems(
      tabItem("samples",
              
              samplesTabUI("samlpes1")        
              
      ),
      
      tabItem("experiments",
              
              experimentsTabUI("experiments1")    
              
            ),      
      tabItem("data",
              
               dataTabUI("data1")    
              
      ), 
      tabItem("materials",
              
              materialsTabUI("materials1")    
              
      ), 
      tabItem("equipment",
              
              equipmentTabUI("equiment1")    
              
      ), 
      tabItem("user",
              
              userTabUI("user")    
              
      ), 
      
      tabItem("admin",
              
              adminTabUI("admin")    
              
      )
    )
  )
)
