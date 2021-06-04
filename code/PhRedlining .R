library(sf)
library(tidyverse)
library(tigris)
library(tmap)
library(ggplot2)
library(leaflet)

#load in redlining data, select philly data, clean, and save as a shapefile

nation_redlining <- st_read("redlining shapefile/shapefile/holc_ad_data.shp") 
philly_redlining <- subset(nation_redlining, state == "PA" & city == "Philadelphia") %>%
  select(holc_grade, geometry)
view(philly_redlining)
plot(philly_redlining)

st_crs(philly_redlining) #checking to make sure it matches Census data#
head(philly_redlining)
write_sf(philly_redlining, "Philly Project/Philly Redlining/philly_redlining.shp")



## load in philly census data
philly_block <- st_read("Philly Project/Census_Block_Groups_2010-shp/Census_Block_Groups_2010.shp") %>%
  select(GEOID10, NAMELSAD10)
plot(philly_block)
view(philly_block)

#check to make sure spatially consistent
st_crs(philly_block)
st_crs(philly_redlining)


## make distance in feet for pennsylvania
philly_block_trans <- st_transform(philly_block, 2272)
st_crs(philly_block_trans)

philly_redlining_trans <- st_transform(philly_redlining, 2272)
st_crs(philly_redlining_trans)

#

overlap <- st_intersection(
  philly_redlining_trans, 
  philly_block_trans ) %>% # spatial joining
  mutate(area = st_area(geometry)) %>% # calculate tract area and add new colum
  as.data.frame() %>%
  select(GEOID10, NAMELSAD10, area, holc_grade, geometry) %>% 
  group_by(NAMELSAD10) %>%
  mutate(coverage = as.numeric(area / sum(area)) # Calculate coverage
  )
view(overlap)
head(overlap)
write_sf(overlap, "Philly Project/final data/Red_block_overlap/Red_block_overlap.shp")
class(overlap)

### Visulizations

## census tracts that overlap with a redlining district
overlap <- st_sf(overlap)

tmap_mode("plot")

overlap_map <- tm_shape(overlap) + tm_fill(col = "pink") + tm_borders(col = "grey") +
  tm_layout(main.title = "Census Tracts That Overlap With\n Historic Redlining Districts",
            main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif")

print(overlap_map)

## create visulization for tracts that overlap with D

# visulization for holc boundary


holcBound_map <- tm_shape(philly_redlining_trans) + tm_polygons("holc_grade", style = 'cat', pal = "OrRd", title = "Holc Grade") +
  tm_layout(main.title = "Redlining Holc Boundaries", main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif")

print(holcBound_map)

# select only overlaps with a holc_grade D
gradeD <- overlap [overlap$holc_grade == 'D', ]
view(gradeD) #check

holcD_map <- tm_shape(gradeD) + tm_polygons("coverage", style = 'quantile', pal = "OrRd", title = "Grade D %", border.col = "grey") +
  tm_layout(main.title = "Census Tracts that Overlap \nwith Holc Grade D",
            main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif")
print(holcD_map)


## comparing visulization
tmap_arrange(holcBound_map, holcD_map)

gradeA <- overlap [overlap$holc_grade == 'A', ]
view(gradeA) #check

holcA_map <- tm_shape(gradeA) + tm_polygons("coverage", style = 'quantile', pal = "Greens", title = "Grade A %", border.col = "grey") +
  tm_layout(main.title = "Census Tracts that Overlap \nwith Holc Grade A",
            main.title.position = "center",
            frame = FALSE,
            main.title.size = 1.2,
            fontfamily = "serif")
print(holcA_map)

## comparing visulization
tmap_arrange(holcBound_map, holcA_map)



