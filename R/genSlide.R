cpImg <- function(imgName, name){
  packagePath =  paste(path.package("bgiR"),"/slides/bgiR-", name, "/", sep="")
  file.copy(paste(packagePath,imgName,sep=""), imgName)
}

cpImgs <- function(pkgName){
  pkgPath =  paste(path.package("bgiR"),"/slides/bgiR-", pkgName, "/", sep="")

  file.copy(paste(pkgPath,"../resources/bgi-logo.png",sep4=""), "bgi-logo.png")
  
  imgFiles = c(list.files(pkgPath,"*.jpg"),list.files(pkgPath,"*.png"),list.files(pkgPath, "*.pdf"))
  for(img in imgFiles){
    cpImg(img, pkgName)
  }
}

genSlide <- function(name, subtitle="", secLogo=""){
  print("Generating slides of R training provided by BGI-Tech.")
  pkgPath =  paste(path.package("bgiR"),"/slides/bgiR-", name, "/", sep="")
  knit(input = paste(pkgPath,"slides.Rtex", sep=""), encoding = "UTF-8")

  print("knitr finished")
  print("copying necessary files")
 
  cpImgs(name)
  print("xelatex is running")
  system("xelatex slides.tex")
}
