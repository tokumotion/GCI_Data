# server.R
library(ggplot2); library(dplyr); library(tidyr); library(stringr); library(magrittr)
library(radarchart)

server <- function(input, output){
  cols_radar <- grep(paste(input$region1, input$region2, sep = "|"), names(fplot))
  output$MyPlot <- renderChartJSRadar({
    chartJSRadar(fplot[, c(1, cols_radar)], showToolTipLabel = TRUE)
  })
}

