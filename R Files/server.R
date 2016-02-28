# server.R
library(ggplot2); library(dplyr); library(tidyr); library(stringr); library(magrittr)
library(radarchart)

source('GCI_Data/R Files/helper.R')

cols_radar <- reactive({
  grep(paste(input$region1, input$region2, sep = "|"), names(fplot))
})

server <- function(input, output){
  output$MyPlot <- renderChartJSRadar({
    chartJSRadar(fplot[, c(1, cols_radar)], showToolTipLabel = TRUE)
  })
}

?renderChartJSRadar
