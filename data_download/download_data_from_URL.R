# ICB Health Indicators Scores data_download_from_URL.

# This is the URL to download the ICB health indicators from:
# https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/healthandsocialcare/healthandwellbeing/datasets/healthindexscoresintegratedcaresystemsengland/current/healthindexscoresintegratedcaresystemsenglandconscreeningfix.xlsx

# Destination folder will be our existing /data sub-folder in this Shiny project
# We will rename the download file to shorten its name.
# Destination: data/healthindexscoresICB.xlsx

# 1. Function to download data from URL

DownloadData <- function(){
  
  if(!dir.exists("data")){dir.create("data")}
  
  download.file(
      url = "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/healthandsocialcare/healthandwellbeing/datasets/healthindexscoresintegratedcaresystemsengland/current/healthindexscoresintegratedcaresystemsenglandcanscreeningfix.xlsx",
      destfile = "data/healthindexscoresICB.xlsx"
    
  )
}
# invoke function
DownloadData()

# 2. Function to refresh previous file when running the app.

Dataupdate <- function(){
  T_refresh = 24 # hours
  if(!dir.exists("data")){
    dir.create("data")
    DownloadTheCOVIDData()
  }
  else if((!file.exists("data/healthindexscoresICB.xlsx"))||as.double( Sys.time() - file_info("data/healthindexscoresICB.xlsx")$change_time, units = "hours")>T_refresh ){
    # If the latest refresh exceeds 24 hours, then you download it again
    DownloadData()
  }
}

# Execute second funtion
Dataupdate()

