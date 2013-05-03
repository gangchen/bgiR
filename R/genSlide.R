cpImg <- function(imgName, slidesName){
  packagePath =  paste(path.package("bgiR"),"/slides/bgiR-", slidesName, "/", sep="")
  file.copy(paste(packagePath,imgName,sep=""), imgName)
}

cpImgs <- function(slidesName){
  slidesPath =  paste(path.package("bgiR"),"/slides/bgiR-", slidesName, "/", sep="")

  file.copy(paste(slidesPath,"../resources/bgi-logo.png",sep=""), "bgi-logo.png")
  
  imgFiles = c(list.files(slidesPath,"*.jpg"),list.files(slidesPath,"*.png"),list.files(slidesPath, "*.pdf"))
  for(img in imgFiles){
    cpImg(img, slidesName)
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
