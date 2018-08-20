# server.R
library(shiny)
library(ggplot2)
library(dplyr)

#setwd("~/Personal/Learning/Data Products/Project4")

df<- read.csv(file="Contratos2018ANSI.csv", header=TRUE, sep=",")

#summary(df)

dfMXP <- subset(df, df$MONEDA == "MXN")



server <- function(input, output) {
  
  output$gplot <- renderPlot({
    filtered <-
      dfMXP %>%
      filter(IMPORTE_CONTRATO >= input$range[1],
             IMPORTE_CONTRATO <= input$range[2]
            )
      ggplot(filtered, aes(TIPO_CONTRATACION, IMPORTE_CONTRATO)) + 
      geom_point(aes(col=TIPO_PROCEDIMIENTO)) +
      xlab("Contract Type") +
      ylab("Procurement Procedur")
      })
}