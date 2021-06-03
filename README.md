# PhillyEnviroScreen

This is a final project completed for Geographical Information Sciences III at the University of Chicago.

### Goals and Objectives
The goal of this project is to create a Philidelaphia version of California's CalEnviroScreen3.0, which is a geospatial tool meant to help identify California communitys most affected by pollution and those who are vulnerable to pollution's effects. 

### Motivation
This project


### Data Sources

### Spatial Temporal Scale
The spatial temporal scale I used was U.S. Census blocks. This scale was chosen because it was the most granular, reliable data I could find. Using a smaller scale for analysis allows for a more nuanced view of environmental factors in a relatively smaller city.


### Methods Used

Creation of Index:

Since CalEnviroScreen does not include information on how they weight their own index, I decided to weigh all indicators equally for each group. There are two main groups: socio-economic factors which I made 30% of the index, because they are more background variables when considering pollution's affects, where polluction as the actors should be weighed more heavily. Therefore, I put the pollution effects as 70% of the index.

I weighted the enviromental and exposure factors all equally at 75% of the index

### Results

### Discussion

### Conclusion and Limitations


### Further work

Further work would expand upon and trouble-shoot my health indicator. There was something wrong with the inital daa provided by the Philadelphia government, the geometry taps were initally empty, which I trouble shooted by adding in my own geometry, but I was unable to merge the file with my other environmental factors, which is because I believe the data has larger problems. I tried to contact OpenDataPhilly but they have not responded yet.

There are a couple of very interestings prospects for further work on creating a Philidelphia environmental justice indicator. One I was interested in, though I thought it was out scope of what my work was in this specific deadline of the project, was using neighborhood charatization data from OpenDataPhilly.  In OpenData Philly there is geospatial data on:
* Philadelphia zones termed as “blighted”
* Choice Neighborhoods “administered by the U.S. Department of Housing and Urban Development (HUD). It supports locally driven strategies to address struggling neighborhoods with distressed public” 
* Redevelopment certified areas

Use of this data would be especially interesting to when compared to the historic redlining data, which was one of my original auxiliary goals.


