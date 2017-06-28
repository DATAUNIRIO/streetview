setwd("C:/Users/Hp/Documents/GitHub/mapapizza")

###########################################################################
require(plotGoogleMaps)
UPA <- read.table("Unidades_de_Saudev6.csv", header=TRUE, sep=";", 
                         na.strings="NA", dec=",", strip.white=TRUE)

UPA<-data.frame(UPA)
position <-data.frame(UPA,Longitude=UPA$X,Latitude=UPA$Y)
edit(UPA)

coordinates(position)<-~Longitude+Latitude

proj4string(position) <- CRS("+init=epsg:4326")

plotGoogleMaps(position)
plotGoogleMaps(position, zcol='gestao')
plotGoogleMaps(position, zcol='Equipes')

pies<-pieSP(position,zcol=c('P_OTIMO','P_BOM','P_REGULAR', 'P_INSUFICIENTE'), max.radius=1000)
pies$pie=rep(c('P_OTIMO','P_BOM','P_REGULAR', 'P_INSUFICIENTE'),42,5)
mapa<-plotGoogleMaps(pies, zcol='pie')

