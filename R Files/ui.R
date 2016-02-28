# ui.R

library(shiny); library(radarchart)

fluidPage(
  headerPanel('Competitiveness Analysis by Region'),
  
  sidebarPanel(
    selectInput(
      'region1', 'Choose the first region you want to analyse', 
      colnames(fplot[2:ncol(fplot)])
    ),
    selectInput(
      'region2', 'Choose the second region you want to analyse', 
      colnames(fplot[2:ncol(fplot)])
    )
  ),
  
  mainPanel(
    chartJSRadarOutput('MyPlot')
  )
)


