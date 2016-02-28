# server.R
library(ggplot2); library(dplyr); library(tidyr); library(stringr); library(magrittr)
library(radarchart); library(RCurl)

source('~/GitHub/GCI_Data/R Files/helper.R')

server <- function(input, output){
  output$MyPlot <- renderChartJSRadar({
    chartJSRadar(fplot[, c(1, cols_radar)], showToolTipLabel = TRUE)
  })
}
