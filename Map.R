library(ggplot2)
library(readr)
library(leaflet)
library(dplyr)
library(leaflegend)
library(htmltools)


#load the dataframe
occurences <- read_csv("occurences.csv")

#mapping occurences
colors1 <- c("black", "red", "green", "blue")
leafImg1 <- system.file(sprintf("Presentation1.png"), package = "leaflegend")
subspecies_map <- leaflet(occurences) %>%
  addTiles() %>%
  addCircleMarkers(~decimalLongitude, ~decimalLatitude, color = ~color, stroke = FALSE, fillOpacity = 1) #%>%  
  #addLegendImage(position = "bottomright", images = leafImg1, labels = colors1)


colors <- c("orange", "#3A5795", "#660099", "BADA55")
leafImg <- system.file(sprintf("legend.png"), package = "leaflegend")
dapc_map <- leaflet(occurences) %>% 
  addTiles() %>% 
  addCircleMarkers(~decimalLongitude, ~decimalLatitude, color = ~dapc, stroke = FALSE, fillOpacity = 0.5) %>% 
  addLegendImage(position = "bottomright", images = leafImg, labels = colors)
