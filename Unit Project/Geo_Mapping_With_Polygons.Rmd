library(ggplot2)
library(maps)

geo_data <- read.csv("C:/Users/ricky.martinez/Desktop/geo_dinnersauce_fy17q2_v2.csv")
names(geo_data) <- c("region", "Impression", "Clicks", "CTR")
head(geo_data)

all_states <- map_data("state")
head(all_states)

merged_geo <- merge(all_states, geo_data, by="region")
head(merged_geo)

Geo_Plot <- ggplot()
Geo_Plot <- Geo_Plot + 
  geom_polygon(data=merged_geo, aes(x=long, y=lat, group = group, fill=merged_geo$CTR*100),colour="white") 

GF_Geo <- Geo_Plot + theme_bw() + labs(fill = "CTR %", title = "Dinner Sauce FY17 Q2 - CTR by State", x="", y="")

GF_Geo + scale_y_continuous(breaks=c()) + 
  scale_x_continuous(breaks=c()) + theme(panel.border =  element_blank()) + 
  scale_fill_continuous(low="#56B1F7", high="#132B43", guide="colorbar")

