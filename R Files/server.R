# server.R
library(ggplot2); library(dplyr); library(tidyr); library(stringr); library(magrittr)

source('~/GitHub/GCI_Data/R Files/helper.R')

server <- function(input, output){

  cols_radar <- reactive({
    grep(paste(input$region1, input$region2, sep = "|"), names(fplot))
  })
  
  output$MyPlot <- renderChartJSRadar({
    chartJSRadar(fplot[, c(1, cols_radar())], showToolTipLabel = TRUE)
  })
}
