# Statistic_geophysic_soil
Statistical algorithms applied to geophysical and soil data

Original data cannot be pubblished here because protected by copyrights.

The main goal of this study was understanding if any of the lab obtained ground truth data (texture, soil water content, carbon content, and sample depth) were for a certain amount connected to measured geophysical data (EMI and GPR) at specific point locations.

If a link is present, geophysics could then be used to predict the change in soil data over a specific profile or area, without the need of disturbing the subsurface by sampling it.

Our approach was to first check if there was a significant correlation among response variables and predictors, and withing responses and predictors. This has been carried out using R: check the file "Correlation.r".

Afterwards, we ran a multiple linear regression (MLR) between the soil responses and the grophysical predictors. This has been carried out using Matlab: check the file "MLR.m" for a simplified version of the used script.

The second part of the presentation takes again into account soil data and geophysical data. The firt ones are now of both physical and chemical nature, whereas the latter consider only the envelope of GPR data (500 and 1000 MHz frequencies). The goal is to understand whether certain variables are dominant over the others in a specific PA, and are therefore responsible of most of the data variance. This is done for a gradient of climate and vegetation, and in four specific location. Furthermore, I wanted to test is a trend of dominant variable(s) explaining most of the variance in the four location was present. PCA analysis was carried out using R: check the file "PCA.r".
