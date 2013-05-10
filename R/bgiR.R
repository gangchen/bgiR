bCol = list("AT"=c("green","yellow"), 
"TA" = c("yellow", "green"),
"GC"=c("blue", "red"),
"CG"=c("red", "blue"))

pair3d = function(loc,r,size,beta,pCol=c("green","red")){
	x1 = (loc[1] - r/2*cos(beta))
	x2 = (loc[1] + r/2*cos(beta))
	y1 = (loc[2] - r/2*cos(beta))
	y2 = (loc[2] + r/2*cos(beta))
	z1 = (loc[3] - r/2*sin(beta))
	z2 = (loc[3] + r/2*sin(beta))
	lines3d(c(x1,x2),c(y1,y2),c(z1,z2),lwd=1, col="black")

	plot3d(x1,y1,z1,type="s", col=pCol[1], add=T, box=F, axes=F,radius=size/2, alpha=0.6)
	plot3d(x2,y2,z2,type="s", col=pCol[2], add=T, box=F, axes=F,radius=size/2, alpha=0.6)
}

doubleHelix = function(bgi, helix=14.5, snapshot=FALSE){

  beta = seq(0, helix*2*pi, length=nrow(bgi))

  m = cbind(bgi, 1, beta)
  i = 1

  apply(m, 1, function(x){
    pair3d(x[1:3]*45, 40, 10, x[4], pCol=unlist(sample(bCol, 1)))

    if(snapshot == TRUE){
      num = character()
      if(i < 10){
        num = paste("00",i,sep="")
      }else if(i<100){
        num = paste("0",i,sep="")
      }else{
        num = i
      }
      i <<- i + 1
      rgl.snapshot(paste("helix",num,"png",sep="."))
    }
  })

}

bgiR <- function(){
  data(bgi)
  doubleHelix(bgi, helix=20)
}
