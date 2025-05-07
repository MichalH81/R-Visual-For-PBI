library(readxl)
library(leaflet)
dataset <- read_excel("C:/Users/micha/Downloads/coordinates.xlsm")

v_longitude <- as.double(dataset$Longitude)
v_latitude <- as.double(dataset$Latitude)
v_label <- dataset$Town

leaflet() %>%
  addTiles() %>%
  setView(lng=18.600500, lat=51.302000, zoom=6) %>%
  addMarkers(lng=v_longitude,lat=v_latitude, label=v_label)

  

