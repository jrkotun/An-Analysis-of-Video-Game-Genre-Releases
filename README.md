# An Analysis of Video Game Genre Releases

## Motivation
Since I was younger I have been an avid video game player, playing such games as Pokemon, Assassin's Creed, and Skyrim (to name a few). During my college career and adulthood, I have explored different avenues of how to enter the video game industry; using my electrical engineering degreee to design consoles and using my programming skills to design and code video games. To continue this trend, I wanted to use this project  as an opportunity to apply my data science skills in exploring a video game dataset.

## Purpose
The purpose of this project was to discover the trends of video game genres released over time and answer the following questions:
- How has the trend of video game genres changed over time within its industry?
- Has this trend caused certain developers and publishers within the industry to change the genre of games they release?

## Data
The primary data source was the video game database located on https://www.vgchartz.com. I utlized Pyhton's Requests library to scarpe the data. 
The key pieces of information for each video game were as follows:
- Game Title
- Publisher (Entity who funds the video game development. They also handle the marketing and release of the game to consumers.)
- Developer (Entity that designs/programs the video game.)
- Release Date

Dataset Cleaned via the Below Guidelines:
- Games without a release date
- Duplicates based on game title and release date
- Games with release dates past 2021

Prior to cleaning the dataset included 61k+ games, but after cleaning the dataset included 47k+ games.

## App Demo
Live version available at: https://jrkotun.shinyapps.io/An_Analysis_of_Video_Game_Genre_Releases/

The app at the above link consists of two graphs.
- The first graph is a stacked bar graph sorted by year on the x axis and number of games on the y axis. This graph can be filtered by genre, developer, and publisher using the select input boxes on the left side of the app.
- The second is sorted by genre on the x axis and number of games on the y axis. It can be filtered by year ranges using the slider input. The resulting graph will automatically sort the genres on the x axis from the genre with the most games released to the genre with the least amount of games released.

## Data Insights
### Late 1970s – Early 1980s
- Data starts in the late 1970s with the beginnings of the home console, namely the Atari.
- Many consoles released during this time.
- Popular games during this period were Donkey Kong, Pacman, and Space Invaders.

### Video Game Crash in the US (1983 – 1985)
- Market saturation due to many game consoles being released and the release of low quality games.
- Led to the bankruptcy of many home computer and video game console companies and is the reason for the release dip we see during this time.
- The reason that there is a dip in the number of games released during this time period.

### Rise Out of the Crash (1985 – 1991)
- Top genre during this time was the Platform and Action genres.
- Nintendo came to the US and started to revitalize the game market within the US.
- In 1986, the platform genre was led by Nintendo with games contributed like Donkey Kong Jr. 3 and Super Mario Bros.
- 1987 to 1991, action games were highest led by games like Legend of Zelda, Metroid, Ninja Gaiden.

### Sega vs Nintendo (1992 – 1994)
- Sega and Nintendo started one of the first console wars with the Genesis vs the NES.
- Platform games were highest during this time as more Mario games (from Nintendo) and Sonic games (from Sega) were released.

### Rise of the Sports Genre (1995, 2000-2003)
- As sports were increasing in popularity through the 90s and early 2000s, developers saw the opportunity to partner up with sports leagues and their respective athletes to release game titles with realism.
- During this time we saw the rise of popular and long living titles such as NFL Madden, Tony Hawk Pro Skater, and NBA 2K.

### Indie Game Boost (2006 – 2014)
- Biggest genre during this time frame was the Misc genre.
- Indie Games, short for independent games, saw a large boost in popularity in 2005. Indies games are those created by individuals or very small companies vs AAA companies like Nintendo, Microsoft, etc.
- This boost in the indie game market was caused by the introduction and increased popularity of direct-to-consumer services such as Steam, Xbox Live, PlayStation Network, and Nintendo Wi-Fi Connection. 
- Indie games were widely categorized as Misc because of their unique game features that didn’t land them in the bucket of already established genres or were a combination of genres.
- Also caused by large publishers/developers (AAA) moving away from creating smaller titles and focusing their efforts on larger, more successful properties. This left room for indie developers to provide the gaming market with smaller, more experimental games as alternatives to the AAA titles.
- Some of the popular indie titles to come from this time was Minecraft, Terraria, and Shovel Knight.

### Indiepocalypse (Dip in Indie Games and Misc Genre) [2015 – Present]
- Decline in games released started in 2012 due to companies holding back games for the new generation of consoles being released starting in late 2012 (Wii U) and late 2013 (PS4 and Xbox One).
- After 2013, game releases stayed relatively low due to the development of more complex game engines, such as Unreal Engine 4. To stay competitive, both AAA and indie developers had to spend more time and money to fully utilize the new engines to stay competitive in the market. More time was spent designing/programming more visually appealing and complex video games.
- During this time we also saw the rise of DLC and consistent updates for already released games. Companies also began to rely on in game transactions to make money.
- This meant that publishers and developers didn't have to rely on releasing new games in order to make money.
- Dip in 2021 game releases due to companies working remotely in 2020 because of COVID.
