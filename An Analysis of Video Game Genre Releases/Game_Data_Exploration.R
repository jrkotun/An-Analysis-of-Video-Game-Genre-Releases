library(tidyverse)
library(lubridate)
library(plotly)

game_data <- read_csv('../data/game_data_cleaned.csv')

p1 <- game_data %>%
  group_by(Year = year(`Release Date`), Genre) %>% 
  summarise(count = n(), .groups = 'drop') %>%
  ggplot(aes(x = Year, y = count, fill = Genre)) +
  geom_col(width = 0.9) +
  xlab("Release Year") +
  ylab("Number of Games") +
  scale_y_continuous(labels = scales::comma) +
  theme(axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12))

ggplotly(p1)

game_data %>%
  group_by(Year = year(`Release Date`), Genre) %>% 
  tally() %>% View()

game_data_grouped %>%
  mutate(count = n()) %>%  
  filter(count == max(count)) %>% 
  ggplot(aes(x = Year, y = count, fill = Genre)) +
  geom_col() +
  ylab("Count") +
  theme(axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10))

game_data_grouped %>%
  filter(2005 <= Year,  Year <= 2014) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = reorder(Genre, -count), y = count)) +
  geom_col(width = 0.7) +
  xlab("Genre") +
  ylab("Count") +
  theme(axis.text.x = element_text(size = 9, angle = 45, vjust = 0.5),
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10))

game_data_grouped %>%
  filter(Genre == "Action") %>%
  summarise(count = n()) %>%
  ggplot(aes(x = Year, y = count)) +
  geom_col(width = 0.8) +
  ylab("Count") +
  theme(axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10))

game_data %>%
  group_by(Developer) %>%
  summarise(count = n()) %>% 
  arrange(desc(count)) %>% 
  filter(count > 50) %>% View()

game_data %>%
  group_by(Publisher) %>%
  summarise(count = n()) %>% 
  arrange(desc(count)) %>% 
  filter(count > 50) %>% View()

game_data_grouped %>%
  filter(Developer == "Ubisoft") %>%
  summarise(count = n()) %>%
  ggplot(aes(x = Year, y = count, fill = Genre)) + 
  geom_bar(position = "stack", stat = "identity")

game_data_grouped %>%
  filter(Publisher == "Square Enix") %>%
  summarise(count = n()) %>%
  ggplot(aes(x = Year, y = count, fill = Genre)) + 
  geom_bar(position = "stack", stat = "identity")

game_data %>%
  group_by(Developer, Genre, Year = year(`Release Date`)) %>% 
  summarise(count = n()) %>% 
  filter(Genre != 'Misc', between(Year, 2006, 2014)) %>% View()

p2 <- game_data %>%
  group_by(Year = year(`Release Date`), Genre) %>%
  summarise(count = n()) %>% 
  filter(count == max(count)) %>%
  ggplot(aes(x = Year, y = count, fill = Genre)) +
  geom_col() +
  ylab("Count") +
  theme(axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10))

ggplotly(p2)

