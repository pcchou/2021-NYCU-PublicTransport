# NYCU TLM 110-1 Public Transport GIS Assignment 1
# A091005 Ping-yu Chou

## Task 1
ggplot()+
  geom_sf(data=taipei_village_map, aes(fill=PP))+
  ggtitle("台北市各里人口數")+
  labs(fill="人口數")+
  theme(text=element_text(family="Noto Sans CJK TC"),
        plot.title = element_text(hjust = 0.5),
  )+
  scale_fill_distiller(palette="BuGn", direction = 1)

## Task 2
MRT_COLOR = c("淡水信義線"="#e3002c",
              "松山新店線"="#008659",
              "中和新蘆線"="#f8b61c",
              "板南線"="#0070bd",
              "文湖線"="#c48c31")

isTransfer_ = function (s) {
  is_double = nrow(filter(taipei_mrt_station, s==Zh_tw)) > 1
  return(any(is_double, 
             s=="北投",
             s=="七張"))
}
isTransfer = Vectorize(isTransfer_, vectorize.args="s")

# Process Taipei City districts
tpe = filter(taiwan_town, COUNTYNAME=="臺北市")

# Process the stations into two DFs
trans = distinct(filter(taipei_mrt_station, isTransfer(s=Zh_tw)),
                 Zh_tw, .keep_all=T)
non_trans = filter(taipei_mrt_station, !isTransfer(s=Zh_tw))

# Environment
mrt = ggplot()+
  ggtitle("台北捷運路網圖")+
  labs(color="路線")+
  theme(text=element_text(family="Noto Sans CJK TC"),
        plot.title = element_text(hjust = 0.5),
        panel.background=element_blank())

# Background
mrt = mrt + 
  geom_sf(data=tpe, lwd=0)

# Routes
mrt = mrt +
  geom_sf(data=taipei_mrt_route, aes(color=RAILNAME))+
  scale_color_manual(values=MRT_COLOR)+
  annotation_north_arrow(location="tr", 
                         height = unit(36, "pt"), width = unit(36, "pt"))+
  annotation_scale(location = "br")

# Stations
mrt = mrt +
  geom_sf(data=non_trans, color='black')
mrt = mrt +
  geom_sf(data=trans, color='#caf0f8')+ 
  geom_sf_label_repel(data=trans, aes(label=Zh_tw, family="Noto Sans CJK TC"),
                      force = 2,
                      size=2, color="#264653")

mrt
