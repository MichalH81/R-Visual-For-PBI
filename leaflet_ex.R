getwd()
setwd("C:/Users/micha/Downloads")
getwd()

csv_folder = 'penguins'

allfiles = list.files(path=csv_folder, pattern = '*.csv', full.names = TRUE)
allfiles

install.packages('plyr')
library(readr)
library(readr)

combined_csv = plyr::ldply(allfiles, read_csv)
combined_csv

data <- data.frame(combined_csv)

colnames(data)


data$Flipper.Length..mm.[is.na(data$Flipper.Length..mm.)] <- mean(data$Flipper.Length..mm., na.rm=TRUE)
data$Body.Mass..g.[is.na(data$Body.Mass..g.)] <- mean(data$Body.Mass..g., na.rm=TRUE)

data$Body.Mass..g.
data[, "Body.Mass..g."]
counter <- 0
for (i in c(data$Flipper.Length..mm., data$Body.Mass..g.)) {
  print(i)
  counter <- counter + 1
}
print(counter)
)
unique(data$Species)

library(tidyverse)

ggplot(
  data = data,
  mapping = aes(x = Flipper.Length..mm., y = Body.Mass..g.)
) +
  geom_point(aes(color = Species, shape = Species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) #+
  #scale_color_colorblind()


install.packages('leaflet')


library(readxl)
coordinates <- read_excel("C:/Users/micha/Downloads/coordinates.xlsm")

#library
library(leaflet)

# Create 20 markers (Random points)
data = data.frame(
  long=as.double(coordinates$Longitude),
  lat=as.double(coordinates$Latitude),
  val=round(rnorm(25),2),
  name=coordinates$Town
) 
# Icons
icons_list <- icons(iconUrl = ifelse(data$val > 1, 
                                     'https://raw.githubusercontent.com/R-CoderDotCom/samples/main/marker.png',
                                     ifelse(data$val > 0 & data$val < 1, "https://raw.githubusercontent.com/R-CoderDotCom/chinchet/main/inst/red.png", NA)),
                    iconWidth = 30, iconHeight = 30)

# Show a circle at each position
m = leaflet(data = data) %>%
  addTiles() %>%
  addMarkers(data = data, icon = icons_list) %>%
  #addCircleMarkers(~long, 
                   #~lat, 
                   #radius=~val*6, 
                   #color=~ifelse(data$val>0 , "red", "orange"),
                   #stroke = TRUE, 
                   #fillOpacity = 0.2,
                   #popup = ~as.character(data$name)) %>%
  setView(lng=20,5, lat = 52, zoom=5.49) %>%


# Show a rectangle
#m = leaflet() %>% addTiles() %>%  
  addRectangles(
    lng1=18.1562867, lat1=52.4132054,
    lng2=21.5737284, lat2=51.1172085,
    fillColor = "transparent"
  )
m
install.packages('mapview')
library(mapview) # loads leaflet automatically

  m %>% 
  leaflet() %>% 
  # see what m are close to Ingolstadt 
  # without putting it or anything else in the center of the frame
  setView(lng=20,5, lat = 52, zoom=5.49) %>% 
  addTiles() %>% 
  addMarkers() %>%
  addMouseCoordinates(style = "basic")

# or for the initial scanning simply
mapview(m)

library(leaflet)

# Data
df <- data.frame(lng = c(12.5, 14.3, 11.234),
                 lat = c(42, 41, 43.84),
                 group = c("A", "B", "A"))

# Icons
#icons_list <- icons(iconUrl = ifelse(df$group == "A", 
                                     #'https://raw.githubusercontent.com/R-CoderDotCom/samples/main/marker.png',
                                     #ifelse(df$group == "B", "https://raw.githubusercontent.com/R-CoderDotCom/chinchet/main/inst/red.png", NA)),
                    #iconWidth = c(50, 90, 40), iconHeight = c(50, 90, 40))

leaflet() %>%
  addTiles() %>%
  setView(lng = 12.43, lat = 42.98, zoom = 6) %>%
  addMarkers(data = df)#, #icon = icons_list) 

b <- round(rnorm(25),2)
length(b)

library(leaflet)
library(sf)

# Read a Geojson or shapefile
data_map <- read_sf("C:/Users/micha/Downloads/map.geojson")

# Transform to leaflet projection if needed
data_map <- st_transform(data_map, crs = '+proj=longlat +datum=WGS84')

leaflet() %>%
  addTiles() %>%
  setView(lng = 18.544904934404713, lat = 54.51162970188335, zoom = 14) %>%
  addPolygons(data = data_map, color = "blue", stroke = 1, opacity = 0.8) 

library(leaflet)
leaflet() %>%
  addTiles() %>%
  setView(lng=-81.2001, lat=28.6024, zoom=15)

providers

leaflet() %>%
  addProviderTiles(provider="Esri.WorldImagery") %>%
  setView(lng=18.54, lat=54.5175, zoom=6)

leaflet(
  option = leafletOptions(minZoom=12, maxZoom=18, dragging=TRUE)
) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  setView(
    lng=-81.2001,
    lat=28.6024,
    zoom=15
) %>%
  setMaxBounds(
    lng1=-81.2001 + 0.05,
    lat1=28.6024 + .05,
    lng2=-81.2001 - 0.05,
    lat2=28.6024 - .05
  )
  
v_longitude <- c(-81.1926, -81.1999, -81.2025)
v_latitude <- c(28.6900, 28.7000, 28.7090)
v_label <- c("Stadium", "Student Union", "Statistics")

leaflet() %>%
  addProviderTiles(provider="Esri.WorldImagery") %>%
  setView(lng=-81.1950, lat=28.6980, zoom=14) %>%
  addMarkers(lng=v_longitude,lat=v_latitude, label=v_label)


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

providers
addProviderTiles(provider="OpenSnowMap") %>%
  

