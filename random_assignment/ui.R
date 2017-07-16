# User-interface definition
# Loosely inspired by: https://k300apps.shinyapps.io/random-normal-data/
# by Josh de Leeuw (https://github.com/jodeleeuw)

library(shiny)

shinyUI(
  # Set fluid page layout
  fluidPage(fluidRow(
    
    # Panel 1 (left)
    column(6,
           # Panel 1 title
           titlePanel("Random Data from a Normal Distribution"),
           # Sidebar with parameters input
           sidebarLayout(
             sidebarPanel(
               numericInput("n", "Number of Observations", 20),
               numericInput("m", "Mean of the Population", 100),
               numericInput("sd", "Standard Deviation of the population", 10)
             ),
             
             # Table of the generated distribution
             mainPanel(
               tableOutput("table1")
             )
           )),
    
    # Panel 2 (right)
    column(6,
           # Panel 2 title
           titlePanel("Random Assignment to Groups"),
           # Sidebar with number of groups input and refresher
           sidebarLayout(
             sidebarPanel(
               numericInput("ng", "Number of Groups", 1),
               actionButton(inputId = "refresh",
                            label = "Refresh", icon = icon("fa fa-refresh"))
             ),
             
             # Table of the group parameters
             mainPanel(
               tableOutput("table2")
             )
           )
    )
  )
))
  

