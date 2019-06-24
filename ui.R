library(shinythemes)
ui <- navbarPage("AracnoMap",theme = shinytheme("slate"),
    tabPanel("Mapa", fluid = TRUE,
  
  sidebarLayout(
    
    sidebarPanel(
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "inputrange",
                  label = "Years:",
                  min = 1784,
                  max = 2018,
                  value = c(1784,2018))
      
    ),
    mainPanel(
      leafletOutput("map", height = "500"),
      br(),
      br(),
      plotOutput(outputId = "distPlot")
    ))
  ),
  tabPanel("Data Explorer"),
  tabPanel("Plotting explorer"),
  tabPanel("More Info")
  )
