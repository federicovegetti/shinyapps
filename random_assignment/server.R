# Server logic.
# Inspired by: Josh de Leeuw (https://github.com/jodeleeuw)
#

library(shiny)

shinyServer(function(input, output) {
  
  data <- reactive({
    n1 <- input$n1
    m1 <- input$m1
    sd1 <- input$sd1
    sample <- round(rnorm(n1, m1, sd1))
    df <- data.frame(Value = sample)
  })
  
  output$table1 <- renderTable({
    
    
    if(!is.null(input$n1) && !is.null(input$m1) && !is.null(input$sd1)){
      
      
      print(data())
    } else {
      return(NULL)
    }
  })
  
  output$table2 <- renderTable({
    ng <- input$ng
    df <- data()
    val <- df$Value
    
    if(!is.null(ng) && ng > 0){
      
      dfchunk <- split(val, sample(1:ng, length(val), replace = T))
      
      res <- data.frame(cbind(sapply(dfchunk, length), sapply(dfchunk, mean)))
      row.names(res) <- paste0("Group ", seq(1:ng))
      names(res) <- c("N", "Mean")
      
      print(res)
    } else {
      return(NULL)
    }
  }, include.rownames = T)
})
   
