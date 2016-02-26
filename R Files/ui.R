# ui.R

library(shiny); library(radarchart)

ui <- fluidPage(
  headerPanel('Competitiveness Analysis by Region'),
  sidebarPanel(
    selectInput(
      'region1', 'Choose the first region you want to analyse', 
      unique(entities$`Region (IMF, April 2015)`)
    ),
    selectInput(
      'region2', 'Choose the second region you want to analyse', 
      unique(entities$`Region (IMF, April 2015)`)
    )
  ),
  mainPanel(
    h1('P'),
    chartJSRadarOutput('MyPlot')
  )
)


