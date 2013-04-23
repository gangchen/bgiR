binPlot3d<-function(x,y,z,alpha=1,topcol="#ff0000",sidecol="#aaaaaa"){
   save <- par3d(skipRedraw=TRUE)
   on.exit(par3d(save))
     
   x1<-c(rep(c(x[1],x[2],x[2],x[1]),3),rep(x[1],4),rep(x[2],4))
   z1<-c(rep(0,4),rep(c(0,0,z,z),4))
   y1<-c(y[1],y[1],y[2],y[2],rep(y[1],4),rep(y[2],4),rep(c(y[1],y[2],y[2],y[1]),2))
   x2<-c(rep(c(x[1],x[1],x[2],x[2]),2),rep(c(x[1],x[2],rep(x[1],3),rep(x[2],3)),2))
   z2<-c(rep(c(0,z),4),rep(0,8),rep(z,8) )
   y2<-c(rep(y[1],4),rep(y[2],4),rep(c(rep(y[1],3),rep(y[2],3),y[1],y[2]),2) )
   rgl.quads(x1,z1,y1,col=rep(sidecol,each=4),alpha=alpha)
   rgl.quads(c(x[1],x[2],x[2],x[1]),rep(z,4),c(y[1],y[1],y[2],y[2]),
               col=rep(topcol,each=4),alpha=1) 
   rgl.lines(x2,z2,y2,col="#000000")
}

barPlot3d <- function(mat, topcol=){
  for(i in 1:nrow(mat)){
    for(j in 1:ncol(mat)){
      col = rainbow(6)[topcol[i,j]]
      binPlot3d(c(i-0.4,i+0.4), c(j-0.4,j+0.4),mat[i,j], alpha=0.6,topcol=col,sidecol=col)
    }
  }
}
