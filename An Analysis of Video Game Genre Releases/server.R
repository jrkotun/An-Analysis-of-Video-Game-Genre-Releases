library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  updateSelectizeInput(
    session,
    'publisher',
    choices = c('All', sort(game_data$Publisher)),
    server = TRUE,
    options = list(maxOptions = 100000),
    selected = 'All'
  )
  
  updateSelectizeInput(
    session,
    'developer',
    choices = c('All', sort(game_data$Developer)),
    server = TRUE,
    options = list(maxOptions = 100000),
    selected = 'All'
  )
  
  game_data_reactive <- reactive({
    game_data_grouped %>%
      filter(
        if (input$genre != 'All')
          (Genre == input$genre)
        else
          TRUE,
        if (input$publisher != 'All')
          (Publisher == input$publisher)
        else
          TRUE,
        if (input$developer != 'All')
          (Developer == input$developer)
        else
          TRUE
      )
  })
  
  game_data_by_year <- reactive({
    game_data_grouped %>%
      filter(between(Year, input$years[1], input$years[2]))
  })
  
  output$genreBarPlot <- renderPlotly({
    ggplotly(
      game_data_reactive() %>%
        summarise(`Number of Games` = n(), .groups = 'drop') %>%
        ggplot(aes(
          x = Year, y = `Number of Games`, fill = Genre
        )) +
        geom_col(width = 0.9) +
        xlab("Release Year") +
        scale_y_continuous(labels = scales::comma) +
        theme(
          axis.title.x = element_text(size = 12),
          axis.title.y = element_text(size = 12),
          axis.text.x = element_text(size = 12),
          axis.text.y = element_text(size = 12)
        ) +
        scale_colour_manual(
          values = cols,
          aesthetics = c("fill"),
          limits = force
        )
    )
  })
  
  output$yearBarPlot <- renderPlot({
    game_data_by_year() %>%
      summarise(`Number of Games` = n(), .groups = 'drop') %>%
      ggplot(aes(x = reorder(Genre,-`Number of Games`), y = `Number of Games`, fill = Genre)) +
      geom_col(width = 0.9) +
      xlab("Genre") +
      scale_y_continuous(labels = scales::comma) +
      theme(
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14),
        axis.text.x = element_text(
          size = 12,
          angle = 45,
          vjust = 0.5
        ),
        axis.text.y = element_text(size = 12),
        legend.position = "none"
      )  +
      scale_colour_manual(
        values = cols,
        aesthetics = c("fill"),
        limits = force
      )
  })
})
