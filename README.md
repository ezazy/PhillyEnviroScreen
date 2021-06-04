# PhillyEnviroScreen

This is a final project completed for Geographical Information Sciences III at the University of Chicago.

### Goals and Objectives
The goal of this project is to create a Philidelaphia version of California's CalEnviroScreen3.0, which is a geospatial tool meant to help identify California communitys most affected by pollution and those who are vulnerable to pollution's effects. 

### Motivation
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



### Data Sources

|   Indicator         |   Source       | Source Access |     Scale   | File type |
| ------- | ----------- | --------- | ---------------------| -----------|
| Air Quality: Ozone | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_OZONE_D2 | Census Block Groups | From .gdb to .shp in QGIS |
| Air Quality: PM2.5 | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_PM25_D2 | Census Block Groups | From .gdb to .shp in QGIS |
| Children’s Lead Risk from Housing | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_LDPNT_D2 | Census Block Groups | From .gdb to .shp in QGIS |
| Diesel Particulate Matter | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_DSLPM_D2 | Census Block Groups | From .gdb to .shp in QGIS |
| Toxic Releases from Facilities | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_RESP_D2 (approximate) | Census Block Groups | From .gdb to .shp in QGIS |
| Traffic Density | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_PTRAF_D2 | Census Block Groups | From .gdb to .shp in QGIS |
| Cleanup Sites | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_PNPL_D2, P_PRMP_D2, P_PTSDF_D2 (together, approximate) | Census Block Groups | From .gdb to .shp in QGIS |
| Groundwater Threats | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: P_PWDIS_D2 (approximate)| Census Block Groups | From .gdb to .shp in QGIS |
| Hazardous Waste Generators and Facilities | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator:  P_PNPL_D2, P_PRMP_D2, P_PTSDF_D2 (together, approximate) | Census Block Groups | From .gdb to .shp in QGIS |
| Solid Waste Sites and Facilities | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator:  P_PNPL_D2, P_PRMP_D2, P_PTSDF_D2 (together, approximate) | Census Block Groups | From .gdb to .shp in QGIS |
| Educational Attainment | ACS (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Housing Burden | ACS (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Linguistic Isolation | ACS (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Poverty | ACS (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Unemployment | ACS (2015) | tidycensus in R  | Census Block Groups | Read into R directly |
| Black, Indigenous, People of Color Population | ACS (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Recieving Supplemental Federal Income | ACS (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Gini Coefficient of Inequality | ACS (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| COVID hospitalizations (by ZIP) | OpenDataPhilly | https://www.opendataphilly.org/dataset/covid-hospitalizations | Philadelphia Zips | .shp |
| COVID deaths (by ZIP) | OpenDataPhilly | https://www.opendataphilly.org/dataset/covid-deaths | Philadelphia Zips | .shp |
| Cancer | EJSCREEN | https://gaftp.epa.gov/EJSCREEN/ (2020 data) Indicator: | Census Block Groups | From .gdb to .shp in QGIS | 
| Percent without any health insurance | ACS (2019) | tidycensus in R  | Census Block Groups | Read into R directly |
| Child lead blood levels | OpenDataPhilly | https://www.opendataphilly.org/dataset/philadelphia-child-blood-lead-levels | Census Tracts | .shp |

### Spatial Temporal Scale
The spatial temporal scale I used was U.S. Census blocks. This scale was chosen because it was the most granular, reliable data I could find. Using a smaller scale for analysis allows for a more nuanced view of environmental factors in a relatively smaller city.


### Methods Used

Creation of Index:

Since CalEnviroScreen does not include information on how they weight their own index, I decided to weigh all indicators equally for each group. There are two main groups: socio-economic factors which I made 30% of the index, because they are more background variables when considering pollution's affects, where polluction as the actors should be weighed more heavily. Therefore, I put the pollution effects as 70% of the index.

I weighted the enviromental and exposure factors all equally at 75% of the index

### Results

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


