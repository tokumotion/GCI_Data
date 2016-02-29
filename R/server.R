# server.R

server <- function(input, output){

  cols_radar <- reactive({
    grep(paste(input$region1, input$region2, sep = "|"), names(fplot))
  })
  
  output$MyPlot <- renderChartJSRadar({
    chartJSRadar(fplot[, c(1, cols_radar())], showToolTipLabel = TRUE, maxScale = 7)
  })
  
  cols_country <- reactive({
    unique(cplot[which(cplot$`Region (IMF, April 2015)` == input$region), 7])
    })
  
  output$select1 <- renderUI({
    selectInput('country1', 
                'Choose which is the first country',
                cols_country())
  })
  
  output$select2 <- renderUI({
    selectInput('country2', 
                'Choose which is the second country',
                cols_country())
  })
  
  cols_countryplot <- reactive({
    sapply(entities$Country[grep(paste(input$country1, input$country2, sep = "|"), 
                                 entities$Entity)], function (x) grep(x, names(radarplot)))
  })
  output$CountryPlot <- renderChartJSRadar({
    chartJSRadar(radarplot[, c(1, cols_countryplot())], 
                 showToolTipLabel = TRUE, maxScale = 7)
  })
}

