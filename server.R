server <- function(input,output, session){
  
  data <- reactive({
    x <- df
  })
  output$distPlot <- renderPlot({
    df <-data()
    final_data = filter(df,year>=min(input$inputrange) & year<=max(input$inputrange))
    qplot(final_data$year,geom="histogram",
          alpha=I(.2),
          fill=I("blue"),
          col=I("black"),
          xlab = "Año",
          main = "Histograma of avistamientos")
    
  })
  output$map <- renderLeaflet({
    spiderIcon = makeIcon("icon/spider-icon.png", 15, 15)
    df <- data()
    final_data = filter(df,year>=min(input$inputrange) & year<=max(input$inputrange))
    m <- leaflet(data = final_data) %>%
      addMiniMap()%>%
      addScaleBar(options = list(imperial=FALSE))%>%
      addTiles() %>%
      addMarkers(lng = ~Longitude,
                 lat = ~Latitude,
                 icon = ~spiderIcon,
                 popup = paste("Name:", final_data$acceptedNameUsage, "<br>",
                               "Year:", final_data$year,"<br>", "Provincia:",final_data$stateProvince))
    
  })
}