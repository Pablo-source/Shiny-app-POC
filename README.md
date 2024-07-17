# Shiny-app-POC

Building a new Shiny app as a POC to test new Shiny dashboard features. Using interactive plots {plotly}, maps {leaflet} and react {reactR} packages.

This dashboard will display Health Index scores information for Integrated Care Systems in England. It will include interactive maps using {leafet} package to enable open-source JavaScript library for interactive maps. <https://rstudio.github.io/leaflet/>


## Ad-hoc functions to schedule data download 

The first step of this project is to download data to populate the Shiny dashboard. 

1-1. Indicators
    • Health Index scores, Integrated care systems, England.
    • Source: ONS
- <https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/healthandwellbeing/datasets/healthindexscoresintegratedcaresystemsengland>
1-2. NHS ICBs Shapefile
    • Office for National Statistics > Open Geography Portal
    • Open Geography Portal > Boundaries > Health Boundaries > Integrated Care Boards > 2023 Boundaries
URL:
https://geoportal.statistics.gov.uk/
    • ICB (April 2023) EN BFC Shapefile
<https://geoportal.statistics.gov.uk/datasets/da81300d4b624a0b81376416c8b5d90e_0/explore>


We have created two ad-hoc functions **DownloadData()** and **Dataupdate()**, in download_data_from_URL.R scripts saved in *data_download* folder, to automate data ingestion into the upcoming Shiny app. 
Using downloaded .xlsx file metadata information details, we can trigger a refresh based on the latest update available on its original website location.

The idea behind it is to enable the use of {taskschedulerR} package with this app to setup an automated scheduled back-end data refresh <https://cran.r-project.org/web/packages/taskscheduleR/vignettes/taskscheduleR.html>. Ensuring the Shiny app always runs on the most up date indicators information available online.

## Interactive graphs and tables

In coming weeks we will include static and interactive tables using {DT} package <https://rstudio.github.io/DT/>, and interactive graphs using {plotly}  <https://plotly.com/r/>.