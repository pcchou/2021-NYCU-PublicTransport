# NYCU TLM 110-1 Public Transport GIS Assignment 2
# A091005 Ping-yu Chou

library(sf)
library(ggplot2)
library(dplyr)
library(ggspatial)
library(ggsflabel)
library(TWspdata)
TRA_station <- read.table("~/TRA_station.csv", header = TRUE, sep = ",")

tw_map = st_crop(taiwan_county, c(xmin=119.75,ymin=21.89,xmax=122.25,ymax=25.3))

ridership=group_by(TRA_ridership, staCode)%>%
  summarise(riderships=sum(gateInComingCnt+gateOutGoingCnt))

# Generate Geometric data
g = st_as_sfc(paste0("POINT (", 
                     TRA_station$PositionLon, " ",
                     TRA_station$PositionLat, ")"), crs=4326)
TRA_line = mutate(TRA_line, Geometry=st_as_sfc(Geometry))

stations = st_sf(mutate(TRA_station, geometry=g), crs=4326)
stations = left_join(stations, ridership, c('StationID'='staCode'))
#stations = stations[order(stations$StationClass),]
#stations[1:4,"StationName"] = c("台北", "台中", "高雄", "花蓮")
stations_upper = filter(stations, StationClass<=1)


classText_ = function (s) {
  if (s==1) {
    return("一等站")
  } else {
    return("特等站")
  }
}
classText = Vectorize(classText_, vectorize.args="s")
stations_upper$StationClassText = classText(stations_upper$StationClass)

# COLORS (unused)

# Environment
tra = ggplot()+
  ggtitle("台鐵路網及進出站旅次量")+
  labs(color="車站等級")+
  theme(axis.text=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank(),
        text=element_text(family="Noto Sans CJK TC"),
        plot.title = element_text(hjust = 0.5),
        panel.background=element_blank())

# Map
tra = tra +
  geom_sf(data=tw_map, color="#808080")+
  annotation_north_arrow(location="tr", 
                         height = unit(36, "pt"), width = unit(36, "pt"))+
  annotation_scale(location = "br")

# Routes
tra = tra +
  geom_sf(data=st_sf(TRA_line, crs=4326), color="blue")

# Stations
tra = tra +
  geom_sf(data=stations_upper, alpha=0.5, 
          aes(color=StationClassText, size=riderships))+
  geom_sf_label_repel(data=stations_upper, aes(label=StationName, family="Noto Sans CJK TC"),
                      force = 2, max.overlaps=16,
                      size=3, color="#264653")

# Legend label names
tra$labels$colour = "站等"
tra$labels$size = "旅次量"

tra

