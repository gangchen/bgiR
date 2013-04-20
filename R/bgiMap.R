bgiMap <- function(){
  library(maps)

  data(bgiCities)
 
  map('world', add=F, col="lightblue",lwd=3)
  map("rivers",add=T,col="red")

  points(cities[,3],cities[,2],col="red",pch=16,cex=2)
}
