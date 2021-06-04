library(sf)
library(tidyverse)
library(tigris)
library(tmap)
library(ggplot2)
library(leaflet)

# combining redlining and PhillyEnviroScreen data for visualizations through Carto

PhillyEnviroScreen_index <- st_read("Philly Project/final data/PhillyEnviroScreen_index/PhillyEnviroScreen_index.shp")
view(PhillyEnviroScreen_index)
st_crs(PhillyEnviroScreen_index)

philly_redlining_cal <- st_read("Philly Project/final data/Red_block_overlap/Red_block_overlap.shp") %>%
  select(NAMELSAD10, holc_grade, coverage, geometry)
view(philly_redlining_cal)
head(philly_redlining)
crs(philly_redlining_cal) <- 2272

PhillyEnviroScreen_RedIndex <- st_intersection(PhillyEnviroScreen_index, philly_redlining_cal)
view(PhillyEnviroScreen_RedIndex)

write_sf(PhillyEnviroScreen_RedIndex, "Philly Project/final data/Philly_ScreenRed/Philly_ScreenRed.shp")