
adminTabUI <- function(id){
  
  ns <- NS(id)
  uiOutput(ns("admin"))

  
}
  
  
adminTab <- function(input,output,session)
  {

  
output$admin <- renderUI({
    
    ns <- session$ns
    
    fluidPage(tabsetPanel(id = "Admin", config , users,experiments,reports
                          
                          
                          
                          
    )
    )
    
    
  })
  
  
  config        <-   tabPanel("Configure Things",
    
    
                    fluidPage(
                      renderText("test"),
                      renderText("test3")
                      )
                    )
  
  users         <-   tabPanel("Manage Users",renderText("test2"))
  
  experiments   <-   tabPanel("Configure Experiments",renderText("test2"))
  
  reports       <-   tabPanel("Configure Reports",renderText("test2"))
  
}
  
  
      
