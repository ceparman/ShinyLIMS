
samplesTabUI <- function(id){
  
  ns <- NS(id)
  
  tagList(
    
    h3("Samples"),
     
    fluidPage(
      tabsetPanel(
      tabPanel("Create","contents"),
      tabPanel("Reports","contents")
      
      
      )
    
    )
    
     
   )
  
}
  
  
samplesTab <- function(input,output,session)
  {

      
}