
samplesTabUI <- function(id) {
  ns <- NS(id)
   uiOutput(ns("samples"))
           
           
          
  
}

samplesTab<- function(input, output, session) {
  
output$samples <- renderUI({
  
  ns <- session$ns
  
      fluidPage(tabsetPanel(id = "Samples", tabpanel1 , tabpanel2
                
              
               
        
               )
      )

  
})
  

tabpanel1 <-   tabPanel("Browse",renderText("test"))

tabpanel2 <-   tabPanel("Browse",renderText("test2"))

}