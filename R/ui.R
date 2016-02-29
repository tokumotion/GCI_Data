# ui.R

library(shiny); library(radarchart)

source('./helper.R', keep.source = TRUE)

navbarPage("Global Competitive Index 2015",
           tabPanel('Regional Comparison',
                    fluidPage(
                      headerPanel('Competitiveness Analysis by Region'),
                      sidebarPanel(
                        selectInput(
                          'region1', 'Choose the first region you want to analyse', 
                          colnames(fplot[2:ncol(fplot)]),
                          width = 300
                        ),
                        selectInput(
                          'region2', 'Choose the second region you want to analyse', 
                          colnames(fplot[2:ncol(fplot)]),
                          width = 300
                        )
                      ),
                      
                      mainPanel(
                        chartJSRadarOutput('MyPlot', width="450", height="300")
                      )
                    )
           ),
           tabPanel("Country Comparison",
                    fluidPage(
                      headerPanel('Competitiveness Analysis by Country'),
                      sidebarPanel(
                        selectInput(
                          'region', 'Choose which region you want to analyze', 
                          unique(cplot$`Region (IMF, April 2015)`)[!is.na(unique(cplot$`Region (IMF, April 2015)`))]
                        ),
                        uiOutput('select1'),
                        uiOutput('select2')
                      ),
                      
                      mainPanel(
                        chartJSRadarOutput('CountryPlot', width="450", height="300")
                      )
                    )
           )
)
