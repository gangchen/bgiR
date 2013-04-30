bgiMap <- function(){
  library(maps)
  library(mapdata)

  data(bgiCities)
 
  map('world', add=F, col="blue",lwd=1)
  #map("rivers",add=T,col="red")

  points(cities[,3],cities[,2],col="red",pch=16,cex=1)
}
