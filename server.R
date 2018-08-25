# server.R

library(shiny)
library(ggplot2)
library(dplyr)


df<- read.csv(file="Compranet_2018_UTF8.csv", header=TRUE, sep="|")

dfMXP <- subset(df, df$CURRENCY == "MXP")

server <- function(input, output) {
  output$gplot <- renderPlot({
    filtered <-
      dfMXP %>%
      filter(CONTRACT_AMOUNT >= input$range[1]*1000000,
             CONTRACT_AMOUNT <= input$range[2]*1000000
      )
    ggplot(filtered, aes(CONTRACT_TYPE, CONTRACT_AMOUNT/1000000, col=CONTRACT_TYPE, size=CONTRACT_AMOUNT/1000000)) + 
    geom_jitter() +
    xlab("Contract Type") +
    ylab("Contract Amount Millions Mexican Pesos") 
  })
}
