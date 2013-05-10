bCol = list("AT"=c("green","yellow"), 
"TA" = c("yellow", "green"),
"GC"=c("blue", "red"),
"CG"=c("red", "blue"))

pair3d = function(loc,r,size,alpha,beta,pCol=c("green","red")){
	x1 = (loc[1] - r/2*cos(beta)*cos(alpha))
	x2 = (loc[1] + r/2*cos(beta)*cos(alpha))
	y1 = (loc[2] - r/2*cos(beta)*sin(alpha))
	y2 = (loc[2] + r/2*cos(beta)*sin(alpha))
	z1 = (loc[3] - r/2*sin(beta))
	z2 = (loc[3] + r/2*sin(beta))
	print(c(alpha, beta))
	lines3d(c(x1,x2),c(y1,y2),c(z1,z2),lwd=1, col="black")

	plot3d(x1,y1,z1,type="s", col=pCol[1], add=T, box=F, axes=F,radius=size/2, alpha=0.6)
	plot3d(x2,y2,z2,type="s", col=pCol[2], add=T, box=F, axes=F,radius=size/2, alpha=0.6)
}

doubleHelix = function(base=200, bigHelix=4, smallHelix=14.5, snapshot=FALSE){
t = seq(0, bigHelix*2*pi, length=base)
beta = seq(0, smallHelix*2*pi, length=base)

m = cbind(cos(t)*4,sin(t)*4,t,beta)
m = cbind(bgi,1,t,beta)
i = 1

apply(m, 1, function(x){
pair3d(x[1:3]*45, 40, 10, 1, x[5], pCol=unlist(sample(bCol, 1)))
num = character()
if(i < 10){
num = paste("00",i,sep="")
}else if(i<100){
num = paste("0",i,sep="")
}else{
num = i
}
i <<- i + 1

if(snapshot == TRUE){
  rgl.snapshot(paste("helix",num,"png",sep="."))
}


})
}

bgiR <- function(){
  data(bgi)
  doubleHelix(nrow(bgi), smallHelix=20)
}
