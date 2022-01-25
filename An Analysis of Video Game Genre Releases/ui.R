library(shiny)
library(shinythemes)
library(plotly)

# Define UI for application that shows Video Game Genre breakdowns
shinyUI(fluidPage(
  theme = shinytheme("slate"),
  
  titlePanel(("An Analysis of Video Game Genre Releases")),
  
  # Sidebar with a slider input for years, and select inputs for Genre, Publisher, and Developer
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        condition = "input.tabs == 'Sorted by Year'",
        
        selectInput("genre",
                    "Genre",
                    choices = c("All", genre_list)),
        
        selectizeInput('publisher',
                       'Publisher',
                       choices = NULL),
        
        selectizeInput('developer',
                       'Developer',
                       choices = NULL),
      ),
      
      conditionalPanel(
        condition = "input.tabs == 'Sorted by Genre'",
        
        sliderInput(
          "years",
          "Select a year range:",
          min = min_year,
          max = max_year,
          value = c(min_year, max_year),
          sep = ''
        )
      )
    ),
    
    mainPanel(tabsetPanel(
      id = 'tabs',
      type = "tabs",
      tabPanel("Sorted by Year", plotlyOutput("genreBarPlot", height = "700px")),
      tabPanel("Sorted by Genre", plotOutput("yearBarPlot", height = "700px"))
    ))
  )
))
