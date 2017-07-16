# Server logic
# Loosely inspired by: https://k300apps.shinyapps.io/random-normal-data/
# by Josh de Leeuw (https://github.com/jodeleeuw)

library(shiny)

shinyServer(function(input, output) {
  
  # Put the generated random data into a reactive environment
  data <- reactive({
    n <- input$n
    m <- input$m
    sd <- input$sd
    sample <- round(rnorm(n, m, sd))
    # Make table
    df <- data.frame(Value = sample, 
                     Mean = c(round(mean(sample), 2), rep("", length(sample)-1)),
                     SD = c(round(sd(sample), 2), rep("", length(sample)-1)))
  })
  
  # Output panel 1
  output$table1 <- renderTable({
    # Make sure we do not miss any input
    if(!is.null(input$n) && !is.null(input$m) && !is.null(input$sd)){
      # Print table
      print(data())
    } else {
      return(NULL)
    }
  })
  
  # Output panel 2
  output$table2 <- renderTable({
    # New inputs + data from reactive environment
    input$refresh
    ng <- input$ng
    df <- data()
    val <- df$Value
    # Make sure we do not miss any input
    if(!is.null(ng) && ng > 0){
      # Split data based on random assignment
      dfchunk <- split(val, sample(1:ng, length(val), replace = T))
      # Calculate parameters and make table
      res <- data.frame(cbind(sapply(dfchunk, length), sapply(dfchunk, mean), sapply(dfchunk, sd)))
      row.names(res) <- paste0("Group ", seq(1:ng))
      names(res) <- c("N", "Mean", "SD")
      # Print table
      print(res)
    } else {
      return(NULL)
    }
  }, include.rownames = T)
  
})
   
