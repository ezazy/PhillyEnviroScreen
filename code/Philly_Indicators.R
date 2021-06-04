library(sf)
library(tidycensus)
library(tidyverse)
library(tigris)
library(tmap)
library(dplyr)

############################ gathering EJSCREEN environmental data

ejscreen <- st_read("Philly Project/Philly_EJSCREEN/Philly_EJSCREEN.shp") %>%
  select(OBJECTID, ID, P_PM25_D2, P_DSLPM_D2, P_RESP_D2, P_LDPNT_D2, P_PRMP_D2, P_PWDIS_D2, P_OZONE_D2, P_CANCR_D2, P_PTRAF_D2, P_PTSDF_D2, P_PNPL_D2)
ejscreen <- st_transform(ejscreen, 2272)
st_crs(ejscreen)
colnames(ejscreen)
view(ejscreen)
plot(ejscreen$geometry)

# variables are at Census block group level

# variable explainer:

## Exposure and Environmental Effects Indicators
### P_PM25_D2 = Air Quality:PM2.5 
### P_OZONE_D2 = Air Quality: Ozone
### P_DSLPM_D2 = Diesel Particulate Matter
### P_RESP_D2 = Toxic Releases from Facilities (approximation)
### P_PTRAF_D2 = Traffic Density
### P_LDPNT_D2 = Child Lead Risk
### P_PNPL_D2, P_PRMP_D2, P_PTSDF_D2 = Cleanup Sites, Hazardous Waste Genartors and facilities, Solid Waste Sites and facilities
### P_PWDIS_D2 = Groundwater Threats (approximation)

### P_CANCR_D2 = additional varialbe health

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


############################ gathering census data

Sys.getenv("CENSUS_API_KEY")

#gather varible names for wanted data#
sVarNames <- load_variables(2019, "acs5/subject", cache = TRUE)
pVarNames <- load_variables(2019, "acs5/profile", cache = TRUE)
otherVarNames <- load_variables(2019, "acs5", cache = TRUE)


view(otherVarNames)

#socioecnomic factors#

## Race
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

## Unemployment
tract_unemploy <- get_acs(geography = 'tract', variables = c(totPop15 = "B02001_001",
                                                             employment = "B23025_001"),
                          year = 2015, state = 'PA', geometry = FALSE) %>%
  select(GEOID, NAME, variable, estimate) %>% 
  spread(variable, estimate) %>% 
  mutate(unemploy_per = (totPop15 - employment) / totPop15) %>% #to get the percent unemployed#
  select(GEOID, unemploy_per)
view(tract_unemploy)


## Linguistic Isolation

PA_lingIso <- get_acs(geography = 'tract', variables = c(totHouse19 = "C16002_001",
                                                         spanNoengl = "C16002_004",
                                                         indoEuroNoengl = "C16002_007",
                                                         asainNoengl = "C16002_010",
                                                         otherNoEngl = "C16002_013"),
                      year = 2019, state = 'PA', geometry = FALSE) %>%
  select(GEOID, NAME, variable, estimate) %>% 
  spread(variable, estimate) %>% 
  mutate(lingIso_per = (spanNoengl + indoEuroNoengl + + asainNoengl + otherNoEngl) / totHouse19) %>%
  select(GEOID, lingIso_per)
view(PA_lingIso)

## Educational Attainment

PA_edAttain <- get_acs(geography = 'tract', variables = c(totPop19 = "B02001_001",
                                                          none = "B15003_002",
                                                          nursery = "B15003_003",
                                                          kindergarten = "B15003_004",
                                                          first = "B15003_005",
                                                          second = "B15003_006",
                                                          third = "B15003_007",
                                                          fourth = "B15003_008",
                                                          fifth  = "B15003_009",
                                                          sixth = "B15003_010",
                                                          seventh = "B15003_011",
                                                          eight = "B15003_012",
                                                          ninth = "B15003_013",
                                                          tenth = "B15003_014",
                                                          eleventh = "B15003_015",
                                                          twelfth.NoDegree = "B15003_016"),
                       year = 2019, state = 'PA', geometry = FALSE) %>%
  select(GEOID, NAME, variable, estimate) %>% 
  spread(variable, estimate) %>% 
  mutate(undHS_per = (none + nursery + + kindergarten + first + second + third + fourth + fifth + sixth + seventh + 
           eight + ninth + tenth + eleventh + twelfth.NoDegree) / totPop19) %>%
  select(GEOID, undHS_per)
view(PA_edAttain)

## Low income/poverty

PA_poverty <-  get_acs(geography = 'tract', variables = c(totPop19 = "B02001_001",
                                                       under0.5 = "C17002_002",
                                                       from.5to.99 = "C17002_003",
                                                       from1to1.24 = "C17002_004",
                                                       from1.25to1.5 = "C17002_005",
                                                       from1.5to1.84 = "C17002_006",
                                                       from1.84to1.99 = "C17002_007"),
                    year = 2019, state = 'PA', geometry = FALSE) %>%
  select(GEOID, NAME, variable, estimate) %>% 
  spread(variable, estimate) %>% 
  mutate(povertyPer = (under0.5 + from.5to.99 + from1to1.24 +from1.25to1.5 + from1.5to1.84 + from1.84to1.99) / totPop19,
         exPovPer = (under0.5 + from.5to.99) / totPop19) %>%
  select(GEOID, povertyPer, exPovPer) 
#one variable for those with income less than double the national poverty rate and one for those with income less than national poverty rate as a percent of tract population
view(PA_poverty)


## Supplemental federal income

PA_supIncome <- get_acs(geography = 'tract', variables = c(totPop19 = "B02001_001",
                                                           popReceived = "B19056_002"),
                        year = 2019, state = 'PA', geometry = FALSE) %>%
  select(GEOID, NAME, variable, estimate) %>% 
  spread(variable, estimate) %>% 
  mutate(supIncPer = popReceived / totPop19) %>%
  select(GEOID, supIncPer)
view(PA_supIncome)

## Gini Coef of inequality
PA_gini <- get_acs(geography = 'tract', variables = c(giniCoef = "B19083_001"),
                      year = 2019, state = 'PA', geometry = FALSE) %>%
  select(GEOID, estimate)
giniCoef <- rename(PA_gini, giniCoef = estimate)
view(giniCoef)

## putting together poverty metric
poverty1 <- merge(PA_poverty, PA_supIncome, by.x = "GEOID", by.y = "GEOID")
philly_poverty <- merge(poverty1, giniCoef, by.x = "GEOID", by.y = "GEOID")
view(philly_poverty)

## Housing burden

PA_houseBurden <- get_acs(geography = 'tract', variables = c(rent_income_per = "B25071_001"),
                       year = 2019, state = 'PA', geometry = TRUE) %>%
  select(GEOID, NAME, variable, estimate) %>% 
  spread(variable, estimate) %>% 
  mutate(rentIncPer = rent_income_per / 100) %>%
  select(GEOID, rentIncPer)
view(PA_houseBurden)


#Sensitive populations#

## Healthcare coverage

PA_noHealthInsurance <- get_acs(geography = 'tract', variables = c(totPop19 = "B02001_001",
                                                                   none_under19 = "B25071_001",
                                                                   none_19to34 = "B27010_017",
                                                                   none_35to64 = "B27010_033",
                                                                   none_65over = "B27010_050"),
                                year = 2019, state = 'PA', geometry = TRUE) %>%
  select(GEOID, NAME, variable, estimate) %>% 
  spread(variable, estimate) %>% 
  mutate(noInsurPer = (none_under19 + none_19to34 + none_35to64 + none_65over)/ totPop19) %>%
  select(GEOID, noInsurPer)
view(PA_noHealthInsurance)

  
  # Health

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

## COVID hospitalizations per ZIP (same steps as for COVID deaths)

covid_hosp_zip <- st_read("Philly Project/covid_hospitalizations_by_zip/covid_hospitalizations_by_zip.shp")%>%
  select(zip_code, count) %>%
  rename(covidHospi = count) %>%
  st_drop_geometry() #data geometry is empty, must add in manually 
view(covid_hosp_zip)

covid_hosp_zip_mapped <- merge(covid_hosp_zip, philly_zips, by.x = "zip_code", by.y = "CODE")
view(covid_hosp_zip_mapped)
covid_hospitSF <- st_sf(covid_hosp_zip_mapped)

covid_hospitSF <- st_set_crs(covid_hospitSF, 4326) #original CRS
covid_hospitSF <- st_transform(covid_hospitSF, 2272) #transform to study CRS
plot(covid_hospitSF$geometry) #plot to check

## Child Lead Risk

### load in census tract data
philly_tracts <- st_read("Philly Project/Philly Census Tracts/c16590ca-5adf-4332-aaec-9323b2fa7e7d2020328-1-1jurugw.pr6w.shp") %>%
  select(GEOID10, NAMELSAD10) %>%
  st_drop_geometry() #this data is only being used for census tract names
st_crs(philly_tracts)

philly_tracts <- st_transform(philly_tracts, 2272) #set to study CRS
view(philly_tracts)

### child blood lead levels
child_lead_levels <- st_read("Philly Project/child_blood_lead_levels_by_ct/child_blood_lead_levels_by_ct.shp") %>%
  select(census_tra, perc_5plus) #Percent of children under the age of 6 screened with newly identified blood lead levels greater than or equal to 5 micrograms per deciliter.
view(child_lead_levels)
head(child_lead_levels)

st_crs(child_lead_levels) #check CRS
child_lead_levels <- st_transform(child_lead_levels, 2272)
childLeadLevels <- merge(philly_tracts, child_lead_levels, by.x = "GEOID10", by.y = "census_tra") %>%
  select(NAMELSAD10, perc_5plus, geometry)

############################ combining indicators 

####health metrics (sensitive population indicators)

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

#### exposure, environment, and health

expEnvHea <- st_join(philly_health, ejscreen_enviro, by.x = "GEOID", by.y = "ID")
write_sf(expEnvHea, "Philly Project/final data/Philly_healthIndicator/Philly_exposureEnvirHea.shp")

## NOT able to load, since file is so large: view(expEnvHea)


#### combining socio-economic factors
head(PA_tractRace)
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
write_sf(socioEcon, "Philly Project/final data/Philly_socioEcon/philly_socioEcon.shp")

## merge socioeconomic data with hisotric redlining data
socioEcon_NoGeom <- socioEcon %>%
  st_drop_geometry()
view(socioEcon)
overlapSF <- st_sf(overlap)
socioEconSf <- st_sf(socioEcon)
socioEcon_red <- st_intersection(overlap, socioEcon)
view(socioEcon_red)
write_sf(socioEcon_red, "Philly Project/final data/Philly_socioEcon_red/Philly_socioRedOverlap.shp")


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

tm_shape(PhillyEnviroScreen) + tm_fill(col = "index", style = "quantile", midpoint = NA )

head(PhillyEnviroScreen)  
  

