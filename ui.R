# ui.R
library(shiny)

ui <- fluidPage(
  
  titlePanel("Mexican Government Acquisitions 2018 (Millions of MXP)"),
  
  sliderInput("range", "Contract Amount Range:",
              min = 1, max = 1000,
              value = c(100,750)),
  
  plotOutput("gplot")
)






