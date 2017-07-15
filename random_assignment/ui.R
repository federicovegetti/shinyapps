# User-interface definition
# Inspired by: Josh de Leeuw (https://github.com/jodeleeuw)
#

library(shiny)

shinyUI(fluidPage(
  
  fluidRow(
    column(6,
           # Application title
           titlePanel("Random Data from a Normal Distribution"),
           # Sidebar with a slider input for number of observations
           sidebarLayout(
             sidebarPanel(
               numericInput("n1", "Number of Observations", 20),
               numericInput("m1", "Mean of the Population", 100),
               numericInput("sd1", "Standard deviation of the population", 10)
             ),
             
             # Show a table of the generated distribution
             mainPanel(
               tableOutput("table1")
             )
           )),
    column(6,
           # Application title
           titlePanel("Random Assingment to Conditions"),
           # Sidebar with a slider input for number of observations
           sidebarLayout(
             sidebarPanel(
               numericInput("ng", "Number of Groups", 2)
             ),
             
             # Show a table of the generated distribution
             mainPanel(
               tableOutput("table2")
             )
           )
    )
  )
))
  

