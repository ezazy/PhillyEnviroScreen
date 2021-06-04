library(sf)
library(tidyverse)
library(tigris)
library(tmap)
library(ggplot2)
library(leaflet)
## Visuals for PhillyEnviroScreen Project
tmaptools:: palette_explorer()

## combined index:
PhillyEnviroScreen_index <- st_read("Philly Project/final data/PhillyEnviroScreen_index/PhillyEnviroScreen_index.shp")
view(PhillyEnviroScreen_index)


tm_shape(PhillyEnviroScreen_index) + tm_polygons("index", style = 'quantile', pal = "plasma", title = "PhillyEnviroScreen\nIndex", border.col = "white") +
  tm_layout(main.title = "PhillyEnviroScreen Index for \nPA Census Blocks",
            main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif") +
  tm_compass(type = "4star", position = c("left", "top"), size = 2.5)
#missing blocks are due to not having all factors going into the index

## index for environmental factors
enviroIndex_map <- tm_shape(PhillyEnviroScreen_index) + tm_polygons("envrInd", style = 'quantile', pal = "plasma", title = "Environmental\nIndex", border.col = "white") +
  tm_layout(main.title = "PhillyEnviroScreen Environmental Index \nfor PA Census Blocks",
            main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif") +
  tm_compass(type = "4star", position = c("left", "top"), size = 2.5)

## index for socio economic factors
socioEcon_map <- tm_shape(PhillyEnviroScreen_index) + tm_polygons("socIndx", style = 'quantile', pal = "plasma", title = "Socio-Economic\nIndex", border.col = "white") +
  tm_layout(main.title = "PhillyEnviroScreen Socio-Economic Index \nfor PA Census Blocks",
            main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif")

tmap_arrange(enviroIndex_map, socioEcon_map)

#####################

philly_redlining <- st_read("Philly Project/final data/Red_block_overlap/Red_block_overlap.shp")
view(philly_redlining)

gradeD <- philly_redlining [philly_redlining$holc_grade == 'D', ]
view(gradeD) #check
holcD_map <- tm_shape(gradeD) + tm_polygons("coverage", style = 'quantile', pal = "Reds", title = "Grade D %", border.col = "grey") +
  tm_layout(main.title = "Census Tracts that Overlap \nwith Holc Grade D",
            main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif")
print(holcD_map)

gradeC <- philly_redlining [philly_redlining$holc_grade == 'C', ]
view(gradeC) #check
holcC_map <- tm_shape(gradeC) + tm_polygons("coverage", style = 'quantile', pal = "Oranges", title = "Grade C %", border.col = "grey") +
  tm_layout(main.title = "Census Tracts that Overlap \nwith Holc Grade C",
            main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif")
print(holcC_map)


gradeB <- philly_redlining [philly_redlining$holc_grade == 'B', ]
view(gradeB) #check
holcB_map <- tm_shape(gradeB) + tm_polygons("coverage", style = 'quantile', pal = "inferno", title = "Grade B %", border.col = "grey") +
  tm_layout(main.title = "Census Tracts that Overlap \nwith Holc Grade B",
            main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif")
print(holcB_map)

gradeA <- philly_redlining [philly_redlining$holc_grade == 'A', ]
view(gradeA) #check
holcA_map <- tm_shape(gradeA) + tm_polygons("coverage", style = 'quantile', pal = "Greens", title = "Grade A %", border.col = "grey") +
  tm_layout(main.title = "Census Tracts that Overlap \nwith Holc Grade A",
            main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif")
print(holcA_map)

tmap_arrange(holcA_map, holcB_map, holcC_map, holcD_map)


