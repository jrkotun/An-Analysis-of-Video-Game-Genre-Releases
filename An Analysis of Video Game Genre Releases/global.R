library(tidyverse)
library(lubridate)
library(bslib)

game_data <- read_csv('data/game_data_cleaned.csv')

game_data_grouped <- game_data %>%
  group_by(Year = year(`Release Date`), Genre)

min_year <- min(game_data_grouped$Year)
max_year <- max(game_data_grouped$Year)

genre_list <- game_data %>%
  distinct(Genre) %>%
  arrange(Genre)

cols = c("Action" = "#011480", "Action-Adventure" = "#838B83", "Adventure" = "#CD6600",
         "Board Game" = "#87CEEB", "Education" = "#EEE5DE", "Fighting" = "#FAFAD2",
         "Misc" = "#EEAD0D", "MMO" = "#FFD39B", "Music" = "#FFF8DC", "Party" = "#9BCD9B",
         "Platform" = "#D2691E", "Puzzle" = "#97F5FF", "Racing" = "#CD950D", 
         "Role-Playing" = "#CD5555", "Sandbox" = "#8B6969", "Shooter" = "#8B3A62",
         "Simulation" = "#B0E2FF", "Sports" = "#00868B", "Strategy" = "#4EEE94",
         "Visual Novel" = "#A3D3EE")