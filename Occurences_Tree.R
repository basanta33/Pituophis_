setwd("D:/Projects/Pituophis_/papers")
library(ggplot2)
library(ape)
library(phangorn)
library(phytools)
library(readr)
library(leaflet)
library(dplyr)

#load the dataframe
occurences <- read_csv("occurences.csv")
#mapping occurences
leaflet(occurences) %>%
  addTiles() %>%
  addMarkers(~decimalLongitude, ~decimalLatitude)
#load tree
tree <- ape::read.nexus("PMel.pruned.mcc.tre")

only_lat_long <- occurences %>%
  select(decimalLatitude, decimalLongitude) %>%
  as.matrix()
rownames(only_lat_long) <- occurences$scientificName
#map the tree
obj <- phylo.to.map(tree, only_lat_long, plot = FALSE, direction="rightwards")
plot(obj,direction="rightwards",cex.points=c(0,1.5),
     pts=FALSE)
