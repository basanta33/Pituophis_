library(ggplot2)
library(readr)
library(leaflet)
library(dplyr)
library(htmltools)
#load the dataframe
occurences <- read_csv("occurences.csv")
#mapping occurences

subspecies_map <- leaflet(occurences) %>%
  addTiles() %>%
  addCircleMarkers(~decimalLongitude, ~decimalLatitude, color = ~color, stroke = FALSE, fillOpacity = 1)

colors <- c("orange", "#3A5795", "#660099", "BADA55")
leafImg <- system.file(sprintf("legend.png"), package = "leaflegend")
dapc_map <- leaflet(occurences) %>% 
  addTiles() %>% 
  addCircleMarkers(~decimalLongitude, ~decimalLatitude, color = ~dapc, stroke = FALSE, fillOpacity = 0.5) %>% 
  addLegendImage(position = "bottomright", images = leafImg, labels = colors)
