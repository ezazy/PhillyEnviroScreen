# PhillyEnviroScreen

This is a final project completed for Geographical Information Sciences III at the University of Chicago.

### Goals and Objectives
The goal of this project is to create a Philidelaphia version of California's CalEnviroScreen3.0, which is a geospatial tool meant to help identify California communitys most affected by pollution and those who are vulnerable to pollution's effects. 

## Motivation
The marginalization, disenfranchisement, and divestment of marginalized populations in urban settings are often regarded as an eternal, unassailable truth of urban America. Urban spaces are created, they are constructed by economic and social policies, cemented by daily practices, and carried by citizens. Disparities in America, especially along with race and class, have been growing and are some of the largest of developed nations. Structural and systematic racism, which often comes to the forefront in racially diverse cities, leaves Black, Indigenous, and people of color most vulnerable to both existential climate change, environmental injustice, the prison industrial complex, and worse health outcomes. This project aims to anchor these realities to their spatial existence in Pennsylvania’s largest city Philadelphia. Philadelphia was chosen since it is a city that experiences racial segregation, has the highest poverty rate and the highest homicide rate per capita of the United State’s largest cities, and this is related to historic racist boundary maintenance practices. The impetus of the project is to collect and make visually available and understandable both the modern-day circumstances and the historical causes of environmental disenfranchisement in Philadelphia, that would be available to policymakers and activists outside of the academic space to create change in their communities. In order to achieve this I will create a Philadelphia-based approximation of California’s environmental justice quantifier CalEnviroScreen. 

CalEnviroScreen is a mapping tool used to aid California legislators in identifying communities with the greatest pollution burden or most vulnerable to the effects of pollution and giving them a score out of 100 to rank and compare communities. The process of development began in 2000, with the fourth version of CalEnviroScreen being currently available for public comment. In April of 2021, The Environmental Justice Mapping and Data Collection Act of 2021 was introduced to both the House and Senate to expand on the EPA’s current Environmental Justice mapping project EJSCREEN and further help identify and fund communities at risk for environmental injustices. 

For my project, with currently publicly available datasets I want to create a metric similar to CalEnviroScreen and taking into account as many of their indicators as possible. My indicators are therefore primarily based on CalEnviroScreen's Indicators, which include:

Exposure Indicators:
* Air Quality: Ozone
* Air Quality: PM2.5
* Children’s Lead Risk from Housing
* Diesel Particulate Matter
* Drinking Water Contaminants*
* Pesticide Use*
* Toxic Releases from Facilities
* Traffic Density

Environmental Effect Indicators
* Cleanup Sites
* Groundwater Threats
* Hazardous Waste Generators and Facilities
* Inpaired Water Bodies*
* Solid Waste Sites and Facilities

Sensitive Population Indicators
* Asthma*
* Cardiovascular disease*
* Low birth weight infants*

Socioeconomic factor Indicators
* Educational Attainment
* Housing Burden
* Linguistic Isolation
* Poverty
* Unemployment
* Black, Indigenous, People of Color Population
* Recieving Supplemental Federal Income
* Gini Coefficient of Inequality 

*There are a few CalEnviroScreen Indicators that I was not able to incorporate into my analysis: the sensitive population indicators (replaced with my health indicator), drinking water contaminants, impaired water bodies, and pesticide use. Drinking water contaminants are not well regulated by the Safe Drinking Water Act and the EPA, and tests are often unreliable with negative results often hidden for years (just for instance the recent wave of lead drinking water scandals). A more in depth environmental screen would find reliable drinking water metrics and pesticide use data, which I could not easily find reliable geospatial data on during the project's time constraints. I could not include sensitive population indicators in my data construct because I could not find readily available reliable data for these indicators. Further work could include these indicators and other factors that would affect health outcomes. In place of this variable I have my "health" construct that includes other information on health outcomes.

My addtional health construct:
Health
* COVID hospitalizations (by ZIP)
* COVID deaths (by ZIP)
* Cancer
* Percent without any health insurance
* Child lead blood levels



Pollution Burnden comprises Ozone and particulate concentrations, water, and air quality, cleanup sites, groundwater threats, hazardous wastes, and impaired water bodies among other components. Population characteristics include educational attainment, poverty, unemployment, housing burdened low-income households, and health data like asthma emergency department visits. I also want to incorporate data about health outcomes COVID deaths from OpenDataPhilly and health insurance data from the ACS.

Additionally, from OpenDataPhilly I

This could be viewed in conjunction with Census and ACS data on race and health outcomes. I would also take historic redlining data from the Philadelphia area and aggregate that data to the Census Tract data using spatial overlay percentages. 

The goal of this project is to generate a cleaned dataset consisting of historical data, an environmental metric, a health metric, and a crime metric for each census tract in Philadelphia. From this cleaned dataset I plan to create five advanced visualizations in either R or Carto, one of the four major components of the data and one combined metric that could be used by local legislators to allocate funding and create programs to support specific census tracts. I am considering either R or Carto for my visualizations because I like the control that packages like tmap give you, but I like how Carto allows an interactive viewer experience that can at once include more than one visualization. 



## Data Sources

|   Indicator         |   Source       | Source Access |     Scale   | File type |
| ------- | ----------- | --------- | ---------------------| -----------|
| Air Quality: Ozone | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_OZONE_D2 | Census Block Groups | From .gdb to .shp in QGIS |
| Air Quality: PM2.5 | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_PM25_D2 | Census Block Groups | From .gdb to .shp in QGIS |
| Children’s Lead Risk from Housing | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_LDPNT_D2 | Census Block Groups | From .gdb to .shp in QGIS |
| Diesel Particulate Matter | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_DSLPM_D2 | Census Block Groups | From .gdb to .shp in QGIS |
| Toxic Releases from Facilities | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_RESP_D2 (approximate) | Census Block Groups | From .gdb to .shp in QGIS |
| Traffic Density | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_PTRAF_D2 | Census Block Groups | From .gdb to .shp in QGIS |
| Cleanup Sites | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_PNPL_D2, P_PRMP_D2, P_PTSDF_D2 (together, approximate) | Census Block Groups | From .gdb to .shp in QGIS |
| Groundwater Threats | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_PWDIS_D2 (approximate)| Census Block Groups | From .gdb to .shp in QGIS |
| Hazardous Waste Generators and Facilities | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator:  P_PNPL_D2, P_PRMP_D2, P_PTSDF_D2 (together, approximate) | Census Block Groups | From .gdb to .shp in QGIS |
| Solid Waste Sites and Facilities | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator:  P_PNPL_D2, P_PRMP_D2, P_PTSDF_D2 (together, approximate) | Census Block Groups | From .gdb to .shp in QGIS |
| Educational Attainment | ACS 5-year (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Housing Burden | ACS (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Linguistic Isolation | ACS 5-year (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Poverty | ACS 5-year (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Unemployment | ACS 5-year (2015) | tidycensus in R  | Census Block Groups | Read into R directly |
| Black, Indigenous, People of Color Population | ACS 5-year (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Recieving Supplemental Federal Income | ACS 5-year (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Gini Coefficient of Inequality | ACS 5-year (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| COVID hospitalizations (by ZIP) | OpenDataPhilly | https://www.opendataphilly.org/dataset/covid-hospitalizations | Philadelphia Zips | .shp |
| COVID deaths (by ZIP) | OpenDataPhilly | https://www.opendataphilly.org/dataset/covid-deaths | Philadelphia Zips | .shp |
| Cancer | EJSCREEN (EJ Index) | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: | Census Block Groups | From .gdb to .shp in QGIS | 
| Percent without any health insurance | ACS 5-year (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Child lead blood levels | OpenDataPhilly | https://www.opendataphilly.org/dataset/philadelphia-child-blood-lead-levels | Census Tracts | .shp |

### Spatial Temporal Scale
The spatial temporal scale I used was U.S. Census blocks. This scale was chosen because it was the most granular, reliable data I could find. Using a smaller scale for analysis allows for a more nuanced view of environmental factors in a relatively smaller city.


## Methods Used

For data taken from the ACS's 5-year estimate I loaded the data into R ushing tidy census, selected my desired columns, and then mutated them to create my indicators desired variables, and transformed that variable into percent. Since I did this for many indicators I will only include one example bellow (all shows in Philly_Indicators.R in this repository's data folder):

```
PA_tractRace <- get_acs(geography = 'tract', variables = c(totPop19 = "B02001_001",
                                                               afrAm = "B02001_003",
                                                               nativeAm = "B02001_004",
                                                               nativeH = "B02001_006",
                                                               asian = "B02001_005",
                                                               latine_his = "B03002_012"),
                      year = 2019, state = 'PA', geometry = FALSE) %>%
  select(GEOID, NAME, variable, estimate) %>% 
  spread(variable, estimate) %>% 
  mutate(poc19 = afrAm + nativeAm + + nativeH + asian + latine_his,
         poc19_per = (afrAm + nativeAm + + nativeH + asian + latine_his) / totPop19) %>%
  select(GEOID, totPop19, poc19, poc19_per)
view(PA_tractRace)
```
After I gathered all my census data, I started to use merge, st_join, and st_intersection, to spatially join my thematic data together and then transform into my study CRS. I ended up having two thematic final datasets that included my census data: my health indicator and my socio-economic indicator (out of three total, as my environmental and exposure indicator included only EJSCREEN data). All this is shown in Philly_Indicators.R, but bellow I have my merging together of socio-economic data:

```
socioEcon1 <- merge(PA_tractRace, tract_unemploy, by.x = "GEOID", by.y = "GEOID")
view(socioEcon1)
socioEcon2 <- merge(socioEcon1, PA_lingIso, by.x = "GEOID", by.y = "GEOID")
view(socioEcon2)
socioEcon3 <- merge(socioEcon2, PA_edAttain, by.x = "GEOID", by.y = "GEOID")
view(socioEcon3)
socioEcon4 <- merge(socioEcon3, philly_poverty, by.x = "GEOID", by.y = "GEOID")
view(socioEcon4)
socioEcon <- merge(PA_houseBurden, socioEcon4, by.x = "GEOID", by.y = "GEOID")
view(socioEcon)
st_crs(socioEcon)
socioEcon <- st_transform(socioEcon, 2272)
```
Then, I saved my data as shapefiles:
```
write_sf(socioEcon, "Philly Project/final data/Philly_socioEcon/philly_socioEcon.shp")
```


For data taken from EJSCREEN I first loaded that data into QGIS, used the filter function to only select Philadelphia data, and then exported as a shapefile. I then read that shapefile into R, pulled out my desired variables, and transformed into my study CRS:

```
ejscreen <- st_read("Philly Project/Philly_EJSCREEN/Philly_EJSCREEN.shp") %>%
  select(OBJECTID, ID, P_PM25_D2, P_DSLPM_D2, P_RESP_D2, P_LDPNT_D2, P_PRMP_D2, P_PWDIS_D2, P_OZONE_D2, P_CANCR_D2, P_PTRAF_D2, P_PTSDF_D2, P_PNPL_D2)
ejscreen <- st_transform(ejscreen, 2272)
```

From there I separated my environmental and exposure variables from my one variable to be used in my health metric:
```
# for the creation of health metric later
ejscreen_cancer <- ejscreen %>%
  select(ID, P_CANCR_D2) %>%
  mutate(P_CANCR_D2 = P_CANCR_D2/100)

# singling out environmental indicators
ejscreen_enviro <- ejscreen %>%
  select(ID, P_PM25_D2, P_OZONE_D2, P_DSLPM_D2, P_RESP_D2, P_PTRAF_D2, P_LDPNT_D2, 
         P_PNPL_D2, P_PRMP_D2, P_PTSDF_D2, P_PWDIS_D2) %>%
  mutate(P_PM25_D2 = P_PM25_D2 / 100, P_OZONE_D2 = P_OZONE_D2/100, P_DSLPM_D2 = P_DSLPM_D2/100, P_RESP_D2 = P_RESP_D2/100,
         P_PTRAF_D2 = P_PTRAF_D2 /100, P_LDPNT_D2 = P_LDPNT_D2 /100, P_PNPL_D2 = P_PNPL_D2/100, P_PRMP_D2 = P_PRMP_D2/100, 
         P_PTSDF_D2 = P_PTSDF_D2 / 100, P_PWDIS_D2 = P_PWDIS_D2/100) #to put at same scale as census percentages
```

For the creation of my health metric I also used data from OpenDataPhilly. I first read that data into R and selected the variables I wanted, but that is when I ran into a problem. There was something wrong with the OpenDataPhilly shapefiles and all the geometries were empty. I troubleshooted by reading in separate Philadelphia zip data and merging their geometries, which initally worked, and transformed into my study CRS. Here is my COVID death example: 

```
## COVID deaths by Zip

### need to load in philly zip polygons
philly_zips <- st_read("Philly Project/Philly_Zipcodes/Zipcodes_Poly.shp")  %>%
  select(CODE, geometry)
view(philly_zips)
  
covid_deaths_zip <- st_read("Philly Project/covid_deaths_by_zip/covid_deaths_by_zip.shp") %>%
  select(zip_code, count) %>%
  rename(covidDeath = count) %>%
  st_drop_geometry() #data geometry is empty, must add in manually 
view(covid_deaths_zip)

covid_deaths_zip_mapped <- merge(covid_deaths_zip, philly_zips, by.x = "zip_code", by.y = "CODE")
view(covid_deaths_zip_mapped)
covid_deathsSF <- st_sf(covid_deaths_zip_mapped) #set as simple feature

covid_deathsSF <- st_set_crs(covid_deathsSF, 4326) #original CRS
covid_deathsSF <- st_transform(covid_deathsSF, 2272) #transform to study CRS
plot(covid_deathsSF$geometry) #plot to check
```
I went through a similar process with COVID hospitalizations by ZIP, and read in my child blood lead levels by census tract, and add in my EJSCREEN variable, but when I tried to spatially join together my indicators and load it as a shapefile I was getting an empty dataset:

```
PA_noHealthInsurance <- st_transform(PA_noHealthInsurance, 2272)
Philly_health1 <- st_intersection(PA_noHealthInsurance, covid_deathsSF)
view(Philly_health1)
Philly_health2 <- st_join(Philly_health1, covid_hospitSF[ , 2]) #don't need zipcodes twice
view(Philly_health2)
philly_health3 <- st_intersection(Philly_health2, child_lead_levels)
view(philly_health3)

view(ejscreen_cancer)
###NEXT CANCER LEVELS FROM EJSCREEN 
philly_health <- st_join(philly_health3, ejscreen_cancer, by.x = "ID", by.y = "GEOID")
view(philly_health)
class(philly_health)
write_sf(philly_health, "Philly Project/final data/Philly_healthIndicator/Philly_health.GeoJSON")
philly_health
```
Since, these shapefiles were empty I unfortunately had to leave this indicator out of my index and further spatial analysis. However, coming back here and improving on my code and continuing to debug would be a great next step for this project.


### Creation of Final Product and  Index:


My final step was to join together my socio-econmic data with my redlining data (not shown here), and join together my socio-economic data with my EJSCREEN environmental data into the PhillyEnviroScreen, the latter of which I then created my three indexes from. My first index was for the socio-economic factors, my second was for my environmental factors, and my third was for both the socio-economic factors and environmental factors and my Philadelphia approximation of the CalEnviroScreen. Since CalEnviroScreen does not include information on how they weight their own index, I decided to weigh all indicators equally for each group (socio-economic and environmental/exposure). There are two main groups: socio-economic factors which I made 30% of the index, because they are more background variables when considering pollution's affects, where polluction as the actors should be weighed more heavily. Therefore, I put the pollution effects as 70% of the index.


```
## final product
view(socioEcon)
view(ejscreen_enviro)
PhillyEnviroScreen <- st_intersection(socioEcon, ejscreen_enviro, by.x = "GEOID", by.y = "ID")
view(PhillyEnviroScreen)
write_sf(PhillyEnviroScreen, "Philly Project/final data/PhillyEnviroScreen/PhillyEnviroScreen_data.shp")


############################ index creation

### index for socio economic factors

PhillyEnviroScreen$socioIndex <- 1/8* (PhillyEnviroScreen$rentIncPer + PhillyEnviroScreen$poc19_per + PhillyEnviroScreen$unemploy_per + PhillyEnviroScreen$lingIso_per + 
                                         PhillyEnviroScreen$undHS_per + PhillyEnviroScreen$povertyPer + PhillyEnviroScreen$exPovPer + PhillyEnviroScreen$supIncPer)

### index for environmental factors

PhillyEnviroScreen$enviroIndex <- 1/9*(PhillyEnviroScreen$P_PM25_D2 + PhillyEnviroScreen$P_OZONE_D2 + PhillyEnviroScreen$P_DSLPM_D2 + PhillyEnviroScreen$P_RESP_D2 + PhillyEnviroScreen$P_PTRAF_D2 + PhillyEnviroScreen$P_LDPNT_D2 + 
                                         PhillyEnviroScreen$P_PNPL_D2 + PhillyEnviroScreen$P_PRMP_D2 + PhillyEnviroScreen$P_PTSDF_D2) 
view(PhillyEnviroScreen)

### total weight index according to conceptual model

PhillyEnviroScreen$index <- 0.3/8*(PhillyEnviroScreen$rentIncPer + PhillyEnviroScreen$poc19_per + PhillyEnviroScreen$unemploy_per + PhillyEnviroScreen$lingIso_per + 
                                   PhillyEnviroScreen$undHS_per + PhillyEnviroScreen$povertyPer + PhillyEnviroScreen$exPovPer + PhillyEnviroScreen$supIncPer) + 
  0.7/9*(PhillyEnviroScreen$P_PM25_D2 + PhillyEnviroScreen$P_OZONE_D2 + PhillyEnviroScreen$P_DSLPM_D2 + PhillyEnviroScreen$P_RESP_D2 + PhillyEnviroScreen$P_PTRAF_D2 + PhillyEnviroScreen$P_LDPNT_D2 + 
         PhillyEnviroScreen$P_PNPL_D2 + PhillyEnviroScreen$P_PRMP_D2 + PhillyEnviroScreen$P_PTSDF_D2) 
view(PhillyEnviroScreen)
write_sf(PhillyEnviroScreen, "Philly Project/final data/PhillyEnviroScreen_index/PhillyEnviroScreen_index.shp")

# I decided NOT to include P_PWDIS_D2 (groundwater threats approxamation) in my index, but keep it in my data, because there are many NA values that then disqualify blocks from my index. I kept it in because the information is still useful
# Additionally removed Gini coef because at different scale 
view(PhillyEnviroScreen)
```



## Results

<img width="1243" alt="Philly_Redlining" src="https://user-images.githubusercontent.com/79418915/120743977-a28ed780-c4bf-11eb-8a34-09744f44c481.png">


<img width="1189" alt="Philly_envEcoIndex" src="https://user-images.githubusercontent.com/79418915/120835607-28476d00-c52a-11eb-9f1a-e4cdd6bc49a5.png">



<img width="732" alt="Philly_Index" src="https://user-images.githubusercontent.com/79418915/120743999-ae7a9980-c4bf-11eb-9adc-c62f9df0d798.png">


### Discussion

### Conclusion and Limitations


### Further work

Further work would expand upon and trouble-shoot my health indicator. There was something wrong with the inital daa provided by the Philadelphia government, the geometry taps were initally empty, which I trouble shooted by adding in my own geometry, but I was unable to merge the file with my other environmental factors, which is because I believe the data has larger problems. I tried to contact OpenDataPhilly but they have not responded yet.

There are a couple of very interestings prospects for further work on creating a Philidelphia environmental justice indicator. One I was interested in, though I thought it was out scope of what my work was in this specific deadline of the project, was using neighborhood charatization data from OpenDataPhilly.  In OpenData Philly there is geospatial data on:
* Philadelphia zones termed as “blighted”
* Choice Neighborhoods “administered by the U.S. Department of Housing and Urban Development (HUD). It supports locally driven strategies to address struggling neighborhoods with distressed public” 
* Redevelopment certified areas

Use of this data would be especially interesting to when compared to the historic redlining data, which was one of my original auxiliary goals.


