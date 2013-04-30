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

barPlot3d <- function(mat, topcol=1, sidecol=1, type="bin"){
  if(length(topcol) == 1 && length(sidecol)==1){
    topcol = matrix(rainbow(nrow(mat)*ncol(mat)),nrow(mat), ncol(mat))
    sidecol = topcol
  }else if(length(sidecol) == 1){
    sidecol = topcol
  }else if(length(topcol) == 1){
    topcol = sidecol
  }else{
    
  }
  for(i in 1:nrow(mat)){
    for(j in 1:ncol(mat)){
      tcol = topcol[i,j]
      scol = sidecol[i,j]
      if(type == "bin"){
        binPlot3d(c(i-0.4,i+0.4), c(j-0.4,j+0.4),mat[i,j], alpha=0.8,topcol=tcol,sidecol=scol)
      }else if(type == "cone"){
        if(mat[i,j] != 0){
          cone3d(base=c(i,j,0), tip=c(i,j,mat[i,j]), col=scol, rad=0.4)
          if(mat[i,j] > 3*mean(mat))
            text3d(i,j,mat[i,j]+1,mat[i,j],cex=1.3)
        }
      }else{
        stop("type error")
      }
    }
  }
}

cone3d <- function(base=c(0,0,0),tip=c(0,0,1),rad=1,n=30,draw.base=TRUE,qmesh=FALSE,
                   trans = par3d("userMatrix"), ...) {
  ax <- tip-base
  if (missing(trans) && !rgl.cur()) trans <- diag(4)
  ### is there a better way?
  if (ax[1]!=0) {
    p1 <- c(-ax[2]/ax[1],1,0)
    p1 <- p1/sqrt(sum(p1^2))
    if (p1[1]!=0) {
      p2 <- c(-p1[2]/p1[1],1,0)
      p2[3] <- -sum(p2*ax)
      p2 <- p2/sqrt(sum(p2^2))
    } else {
      p2 <- c(0,0,1)
    }
  } else if (ax[2]!=0) {
    p1 <- c(0,-ax[3]/ax[2],1)
    p1 <- p1/sqrt(sum(p1^2))
    if (p1[1]!=0) {
      p2 <- c(0,-p1[3]/p1[2],1)
      p2[3] <- -sum(p2*ax)
      p2 <- p2/sqrt(sum(p2^2))
    } else {
      p2 <- c(1,0,0)
    }
  } else {
    p1 <- c(0,1,0); p2 <- c(1,0,0)
  }
  degvec <- seq(0,2*pi,length=n+1)[-1]
  ecoord2 <- function(theta) {
    base+rad*(cos(theta)*p1+sin(theta)*p2)
  }
  i <- rbind(1:n,c(2:n,1),rep(n+1,n))
  v <- cbind(sapply(degvec,ecoord2),tip)
  if (qmesh) 
    ## minor kluge for quads -- draw tip twice
    i <- rbind(i,rep(n+1,n))
  if (draw.base) {
    v <- cbind(v,base)
    i.x <- rbind(c(2:n,1),1:n,rep(n+2,n))
    if (qmesh)  ## add base twice
      i.x <-  rbind(i.x,rep(n+2,n))
    i <- cbind(i,i.x)
  }
  if (qmesh) v <- rbind(v,rep(1,ncol(v))) ## homogeneous
  if (!qmesh)
    triangles3d(v[1,i],v[2,i],v[3,i],...)
  else
    return(rotate3d(qmesh3d(v,i,material=...), matrix=trans))
}     
