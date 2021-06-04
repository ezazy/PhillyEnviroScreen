# PhillyEnviroScreen

This is a final project completed for Geographical Information Sciences III at the University of Chicago.

### Goals and Objectives
The goal of this project is to create a Philidelaphia version of California's CalEnviroScreen3.0, which is a geospatial tool meant to help identify California communitys most affected by pollution and those who are vulnerable to pollution's effects. 

### Motivation
The marginalization, disenfranchisement, and divestment of marginalized populations in urban settings are often regarded as an eternal, unassailable truth of urban America. Urban spaces are created, they are constructed by economic and social policies, cemented by daily practices, and carried by citizens. Disparities in America, especially along with race and class, have been growing and are some of the largest of developed nations. Structural and systematic racism, which often comes to the forefront in racially diverse cities, leaves Black, Indigenous, and people of color most vulnerable to both existential climate change, environmental injustice, the prison industrial complex, and worse health outcomes. This project aims to anchor these realities to their spatial existence in Pennsylvania’s largest city Philadelphia. Philadelphia was chosen since it is a city that experiences racial segregation, has the highest poverty rate and the highest homicide rate per capita of the United State’s largest cities, and this is related to historic racist boundary maintenance practices. The impetus of the project is to collect and make visually available and understandable both the modern-day circumstances and the historical causes of environmental disenfranchisement in Philadelphia, that would be available to policymakers and activists outside of the academic space to create change in their communities. In order to achieve this I will create a Philadelphia-based approximation of California’s environmental justice quantifier CalEnviroScreen. 

CalEnviroScreen is a mapping tool used to aid California legislators in identifying communities with the greatest pollution burden or most vulnerable to the effects of pollution and giving them a score out of 100 to rank and compare communities. The process of development began in 2000, with the fourth version of CalEnviroScreen being currently available for public comment. In April of 2021, The Environmental Justice Mapping and Data Collection Act of 2021 was introduced to both the House and Senate to expand on the EPA’s current Environmental Justice mapping project EJSCREEN and further help identify and fund communities at risk for environmental injustices. For my project, with currently publicly available datasets I want to create a metric similar to CalEnviroScreen and taking into account as many of their indicators as possible. CalEnviroScreen’s indicators are split into two distinct categories: pollution burden and population characteristics. Pollution Burnden comprises Ozone and particulate concentrations, water, and air quality, cleanup sites, groundwater threats, hazardous wastes, and impaired water bodies among other components. Population characteristics include educational attainment, poverty, unemployment, housing burdened low-income households, and health data like asthma emergency department visits. I also want to incorporate data about health outcomes COVID deaths from OpenDataPhilly and health insurance data from the ACS.

Additionally, from OpenDataPhilly I want to obtain crime data such as arrest location, crime incidents, future years of incarceration, designation as a “development certified area” by the Philadelphia City Planning Commission. This could be viewed in conjunction with Census and ACS data on race and health outcomes. I would also take historic redlining data from the Philadelphia area and aggregate that data to the Census Tract data using spatial overlay percentages. Another possible component is looking at historical census data. A limitation to this approach is how much census questions as well as gathering methods have changed over the last 150 years. Many questions from the 19th century surround farming or different livestock in a certain location, and all were originally collected at the county level, while the data I am collecting is at the city level. Historical census data would provide interesting information on how the characterization, whether population density, literacy rates, and racial composition of census tracts, neighborhoods, or counties have changed over longer periods, and provides further context for redlining data. Story-telling will be a very important component of my project, since looking at historical datasets can limit the specificity of geographic information to changing “county” scales. This puts statistical methods at a disadvantage, but looking at change over time can help contextualize modern datasets. 
The goal of this project is to generate a cleaned dataset consisting of historical data, an environmental metric, a health metric, and a crime metric for each census tract in Philadelphia. From this cleaned dataset I plan to create five advanced visualizations in either R or Carto, one of the four major components of the data and one combined metric that could be used by local legislators to allocate funding and create programs to support specific census tracts. I am considering either R or Carto for my visualizations because I like the control that packages like tmap give you, but I like how Carto allows an interactive viewer experience that can at once include more than one visualization. 



### Data Sources

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


