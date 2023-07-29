library(ggplot2)
library(readr)
library(leaflet)
library(dplyr)
library(leaflegend)
library(htmltools)


#load the dataframe
occurences <- read_csv("occurences.csv")

#mapping subspecies
colors <- c("black", "red", "green", "blue")
leafImg1 <- system.file(sprintf("Subspecies.PNG"), package = "leaflegend")

subspecies_map <- leaflet(occurences) %>%
  addTiles() %>%
  addCircleMarkers(~decimalLongitude, ~decimalLatitude, color = ~color, stroke = FALSE, fillOpacity = 1) #%>%  
  #addLegendImage(position = "bottomright", images = leafImg1, labels = colors)

subspecies_map

#mapping DAPC clusters
colors <- c("orange", "#3A5795", "#660099", "#80FA58")
leafImg <- system.file(sprintf("legend.png"), package = "leaflegend")
dapc_map <- leaflet(occurences) %>% 
  addTiles() %>% 
  addCircleMarkers(~decimalLongitude, ~decimalLatitude, color = ~dapc, stroke = FALSE, fillOpacity = 0.8) #%>% 
  #addLegendImage(position = "bottomright", images = leafImg, labels = colors)

dapc_map

#Mapping Phylogenetic Clusters
phylo_map <- leaflet(occurences) %>% 
  addTiles() %>% 
  addCircleMarkers(~decimalLongitude, ~decimalLatitude, color = ~phylo, stroke = FALSE, fillOpacity = 0.8) #%>% 
#addLegendImage(position = "bottomright", images = leafImg, labels = colors)

phylo_map


