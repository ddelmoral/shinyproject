# ui.R
library(shiny)

#setwd("~/Personal/Learning/Data Products/Project4")


# Define UI for miles per gallon app ----
ui <- fluidPage(

    titlePanel("Mexican Government Acquisitions 2018 (MXP)"),
    
    sliderInput("range", "Range:",
          min = 1, max = 1000000000,
          value = c(1000000,500000000)),
    
    plotOutput("gplot")
  )





