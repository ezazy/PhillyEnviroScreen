# PhillyEnviroScreen

This is a final project completed for Geographical Information Sciences III at the University of Chicago.

### Goals and Objectives
The goal of this project is to create a Philadelphia version of California's CalEnviroScreen3.0, which is a geospatial tool meant to help identify California communities most affected by pollution and those who are vulnerable to pollution's effects. 

## Motivation
The marginalization, disenfranchisement, and divestment of marginalized populations in urban settings are often regarded as an eternal, unassailable truth of urban America. Urban spaces are created, they are constructed by economic and social policies, cemented by daily practices, and carried by citizens. Disparities in America, especially along with race and class, have been growing and are some of the largest of developed nations (https://pewrsr.ch/3wV9EYA). Structural and systematic racism, which often comes to the forefront in racially diverse cities, leaves Black, Indigenous, and people of color most vulnerable to both existential climate change, environmental injustice, the prison industrial complex, and worse health outcomes. This project aims to anchor these realities to their spatial existence in Pennsylvania’s largest city Philadelphia. Philadelphia was chosen since it is a city that experiences racial segregation (https://bit.ly/3ifmvAQ), has the highest poverty rate and the highest homicide rate per capita of the United State’s largest cities (https://bit.ly/34MZbSS), and this is related to historic racist boundary maintenance practices (https://bit.ly/3if7ZZX). The impetus of the project is to collect and make visually available and understandable both the modern-day circumstances and the historical causes of environmental disenfranchisement in Philadelphia, that would be available to policymakers and activists outside of the academic space to create change in their communities. In order to achieve this, I will create a Philadelphia-based approximation of California’s environmental justice quantifier CalEnviroScreen. 

CalEnviroScreen (https://bit.ly/3fOfIfQ) is a mapping tool used to aid California legislators in identifying communities with the greatest pollution burden or most vulnerable to the effects of pollution and giving them a score out of 100 to rank and compare communities. The process of development began in 2000, with the fourth version of CalEnviroScreen being currently available for public comment. In April of 2021, The Environmental Justice Mapping and Data Collection Act of 2021 was introduced to both the House and Senate to expand on the EPA’s current Environmental Justice mapping project EJSCREEN and further help identify and fund communities at risk for environmental injustices. 

For my project, with currently publicly available datasets I want to create a metric similar to CalEnviroScreen and taking into account as many of their indicators as possible (https://bit.ly/3ieQlW9). My indicators for Philadelphia are therefore primarily based on CalEnviroScreen's Indicators, which include:

Exposure Indicators:
* Air Quality: Ozone
* Air Quality: PM2.5
* Children’s Lead Risk from Housing
* Diesel Particulate Matter
* Drinking Water Contaminants***
* Pesticide Use***
* Toxic Releases from Facilities
* Traffic Density

Environmental Effect Indicators
* Cleanup Sites
* Groundwater Threats
* Hazardous Waste Generators and Facilities
* Inpaired Water Bodies***
* Solid Waste Sites and Facilities

Sensitive Population Indicators
* Asthma***
* Cardiovascular disease***
* Low birth weight infants***

Socioeconomic factor Indicators
* Educational Attainment
* Housing Burden
* Linguistic Isolation
* Poverty
* Unemployment
* Black, Indigenous, People of Color Population
* Recieving Supplemental Federal Income
* Gini Coefficient of Inequality 

*** There are a few CalEnviroScreen Indicators that I was not able to incorporate into my analysis: the sensitive population indicators (replaced with my health indicator), drinking water contaminants, impaired water bodies, and pesticide use. Drinking water contaminants are not well regulated by the Safe Drinking Water Act and the EPA, and tests are often unreliable with negative results often hidden for years (just for instance the recent wave of lead drinking water scandals). A more in-depth environmental screen would find reliable drinking water metrics and pesticide use data, which I could not easily find reliable geospatial data on during the project's time constraints. I could not include sensitive population indicators in my data construct because I could not find readily available reliable data for these indicators. Further work could include these indicators and other factors that would affect health outcomes. In place of this variable, I have my "health" construct that includes other information on health outcomes.

My addtional health construct:
Health
* COVID hospitalizations (by ZIP)
* COVID deaths (by ZIP)
* Cancer
* Percent without any health insurance
* Child lead blood levels

Again, the goal of this project is to generate a cleaned dataset(s) consisting of historical redlining data at the census block level, an environmental/exposure metric, a health metric, and a socio-economic metric for each census block in Philadelphia. 


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
| Historical Redlining data | Mapping Ineqaultiy by the University of Richmond | https://dsl.richmond.edu/panorama/redlining/#loc=5/39.1/-94.58&text=downloads  | Redlining holc grades | .shp | 

### Spatial Temporal Scale
The spatial-temporal scale I used was U.S. Census blocks. This scale was chosen because it was the most granular, reliable data I could find. Using a smaller scale for analysis allows for a more nuanced view of environmental factors in a relatively smaller city.


## Methods Used

For the methods for the Philadelphia historical redlining and modern census blocks spatial overlay and areal calculation check out the RMarkdown file in main or here: http://rpubs.com/ezazycki/777608

For data taken from the ACS's 5-year estimate, I loaded the data into R using tidy census, selected my desired columns, and then mutated them to create my indicators desired variables, and transformed that variable into percent. Since I did this for many indicators I will only include one example below (all shows in Philly_Indicators.R in this repository's data folder):

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
After I gathered all my census data, I started to use merge, st_join, and st_intersection, to spatially join my thematic data together and then transform it into my study CRS. I ended up having two thematic final datasets that included my census data: my health indicator and my socio-economic indicator (out of three total, as my environmental and exposure indicator included only EJSCREEN data). All this is shown in Philly_Indicators.R, but below I have my merging  of socio-economic data:

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


For data taken from EJSCREEN I first loaded that data into QGIS, used the filter function to only select Philadelphia data, and then exported it as a shapefile. I then read that shapefile into R, pulled out my desired variables, and transformed it into my study CRS:

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

For the creation of my health metric, I also used data from OpenDataPhilly. I first read that data into R and selected the variables I wanted, but that is when I ran into a problem. There was something wrong with the OpenDataPhilly shapefiles and all the geometries were empty. I troubleshot by reading in separate Philadelphia zip data and merging their geometries, which initially worked, and transformed into my study CRS. Here is my COVID death example: 

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
Since these shapefiles were empty I, unfortunately, had to leave this indicator out of my index and further spatial analysis. However, coming back here and improving on my code, and continuing to debug would be a great next step for this project.


### Creation of Final Product and  Index:


My final step was to join together my socio-economic data with my redlining data (not shown here) and join together my socio-economic data with my EJSCREEN environmental data into the PhillyEnviroScreen, the latter of which I then created my three indexes from. My first index was for the socio-economic factors, my second was for my environmental factors, and my third was for both the socio-economic factors and environmental factors and my Philadelphia approximation of the CalEnviroScreen. Since CalEnviroScreen does not include information on how they weigh their index, I decided to weigh all indicators equally for each group (socio-economic and environmental/exposure). There are two main groups: socio-economic factors which I made 30% of the index because they are more background variables when considering pollution's effects, where pollution as the actors should be weighed more heavily. Therefore, I put the pollution effects as 70% of the index.

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

Additionally, I combined my redlining and PhillyEnviroScreen data, this code can be found in Philly_ScreenRedlining.R in the data folder.

## Results

### Philadelphia Redlining and Census Blocks Spatial Overlay
<img width="1243" alt="Philly_Redlining" src="https://user-images.githubusercontent.com/79418915/120743977-a28ed780-c4bf-11eb-8a34-09744f44c481.png">

### Philadelphia Environmental and Socio-Econmic Index Compared
<img width="1189" alt="Philly_envEcoIndex" src="https://user-images.githubusercontent.com/79418915/120835607-28476d00-c52a-11eb-9f1a-e4cdd6bc49a5.png">


### PhillyEnviroScreen Index
<img width="732" alt="Philly_Index" src="https://user-images.githubusercontent.com/79418915/120743999-ae7a9980-c4bf-11eb-9adc-c62f9df0d798.png">

### PhillyEnviroScreen Index Compared to Redlining Grade D

<img width="1145" alt="Screen Shot 2021-06-04 at 2 51 43 PM" src="https://user-images.githubusercontent.com/79418915/120855771-87b27680-c544-11eb-8205-8005196736c5.png">

### Carto Dashboard

The Carto dashboard can be found here: https://ezazy.carto.com/builder/619f7ef9-3a52-4861-a33e-4e4cb04bd25e/embed

<img width="750" alt="Carto Holc grade map" src="https://user-images.githubusercontent.com/79418915/120870076-95c0c100-c55d-11eb-8f19-40a0a6d7b619.png">

<img width="819" alt="Carto holc grade map zoomed" src="https://user-images.githubusercontent.com/79418915/120870080-978a8480-c55d-11eb-9513-7da0fe92c9b3.png">

<img width="765" alt="Carto Redlining map all" src="https://user-images.githubusercontent.com/79418915/120870081-99ecde80-c55d-11eb-9c4a-8b00e38a5618.png">

<img width="799" alt="Carto redlining map zoomed" src="https://user-images.githubusercontent.com/79418915/120870098-a1ac8300-c55d-11eb-8978-bbff89c7222c.png">


### Discussion

Here, I have created a couple of cleaned geospatial datasets, seen in finished data, visualizations for the census blocks that overlap with different grades, visualizations for all three indexes which I created, the first one being of socio-economic factors that make a community more vulnerable to pollution, the second the environmental and exposure factors that create and spread pollution and its effects, and an index for both the environmental and socio-economic factors viewed in tandem. Both my index and redlining data can be viewed in tandem in my Carto dashboard. These cleaned datasets and visualizations would be of interest to policy-makers, just like the CalEnviroScreen, as well as communities and their stakeholders, as the information can be used to argue for more funding or assistance for citizens--knowledge is power.

One thing I found particularly interesting, was to see how, even when pulled apart, how similar the socio-economic indicators were to the environment/exposure factors. This is somewhat disheartening to see that those who are most disenfranchised through race and class in Philadelphia and are the most vulnerable to pollution's effects are also those who most likely deal with the most pollution in the city of Philadelphia. 

Another thing of note is that my redlining maps, specifically places that were graded as D do not perfectly align to the places that seem the most vulnerable by my overall PhillyEnviroScreen indicator. I believe there are a couple of reasons who this might be true. Firstly, as notes in my RMarkdown for my redlining process that goes more into depth about Mapping Inequality and the redlining source data, but it is only based on the federal government's Home Owners' Loan Corporation maps drawn in the 1930s and 1940s. One result of this is that we are not picking up redlining practices from the 1940s onward which may have additional impacts on the makeup of lower-income or not white-neighborhoods, such as practices in the 1970s and after white flight and gentrification of neighborhoods. Another result may be that we are only picking up on the redlining practice of one industry, while redlining was practiced by many industries from bank loans to grocery stores. Because of this, it would be interesting to compare my index to more modern forms of redlining like building codes or gentrification or more comprehensive historical redlining data from many decades for industries.
.

### Conclusion, Limitations, and Further work


A big limitation to my work was working within the constraints of what my RStudio app could handle. This meant that I could not combine all my data into one final shapefile, because R could not load that Shapefile and would stop responding. This limited other data analysis opportunities as well as the inclusion of additional indicators.

Some other limitations are due to my use of sources such as the EJSCREEN, which inherently carry data inconsistencies. The EJSCREEN has inherent problems and complications when used to theorize on the micro-level (some detailed here: https://www.epa.gov/ejscreen/limitations-and-caveats-using-ejscreen) such as national estimates for environmental indicators being imprecise at smaller scales. Coinciding with my use of the EJSCREEN dataset, I decided to use the percentile for the EJ Index for each desired variable. Therefore, my data also inherits many of the limits of the EJSCREEN data, beyond just using national-level metrics on a smaller scale, but their data collection as a whole for the entirety of the United States. I decided to use the percentile for the EJ Index because it gives the data more national context, for instance, what is medium Ozone level like in the United States, and how does Philadelphia compare to that. This also helps pick apart national issues from more localized ones, but also made this project more susceptible to EJSCREEN's data downfalls, like if their metrics were off. Another data source that had limitations was OpenDataPhilly, for which the factors I wanted to use to construct my health indicator had large problems that ultimately stopped me from being able to use my indicator in analysis.

Additionally, I was limited by data availability, such as OpenDataPhilly having very limited data available, such as only data on where water testing locations are but no data on testing results. Another example is OpenDataPhilly having a shapefile of air monitoring stations, but the only data available on bad air quality index days being in a total amount per year, without information on where those tests were carried out.

Further work would expand upon and troubleshoot my health indicator. There was something wrong with the initial data provided by the Philadelphia government, the geometry columns were initially empty, which I troubleshot by adding in my geometry, but I was unable to merge the file with my other environmental factors, which is because I believe the data has larger problems. I tried to contact OpenDataPhilly but they have not responded yet.

There are a couple of very interesting prospects for further work on creating a Philidelphia environmental justice indicator. One I was interested in, though I thought it was out of scope of what my work was in this specific deadline of the project, was using neighborhood characterization data from OpenDataPhilly.  In OpenData Philly there is geospatial data on:
* Philadelphia zones termed as “blighted”
* Choice Neighborhoods “administered by the U.S. Department of Housing and Urban Development (HUD). It supports locally driven strategies to address struggling neighborhoods and distressed public” 
* Redevelopment certified areas

Also, as previously noted future work could use more complex or comprehensive redlining data, and of course the initial CalEnviroScreen indicators I did not include in this analysis.

### Sources References (additional ones not previously linked):
* https://oehha.ca.gov/calenviroscreen/indicators
* https://l.facebook.com/l.php?u=https%3A%2F%2Fsixtysixwards.com%2Fhome%2Fcrosswalk-tutorial%2F%3Ffbclid%3DIwAR3VXgvDP5cVXAWkjARpIX4nKgcRcLB4QIsNNm7IYJ3k7u0qMh9WPv9Tpoo&h=AT33unP16K50bUeypu7Nx81jD-SWTOI7KhThWDpPwqf1stqojARWaUPRuZM18CRjglj4og4xsbmziy9qn3E65jy1hqmBaZrpOf0KiQ1ctxBFEuZych8G-bYfLrQHO9YTtvRj8tmVtlA
* Data sources noted above
