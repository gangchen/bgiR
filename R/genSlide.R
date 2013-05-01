
genSlide <- function(name, subtitle="", secLogo=""){
  print("Generating slides of R training provided by BGI-Tech.")
  packagePath =  paste(path.package("bgiR"),"/slides/bgiR-", name, "/", sep="")
  knit(input = paste(packagePath,"slides.Rtex", sep=""), encoding = "UTF-8")

  print("knitr finished")
  print("copying necessary files")

  # copying BGI-TECH logo
  # this picture should be used by all slides in this package
8  file.copy(paste(packagePath,"bgi-logo.png",sep=""), "bgi-logo.png")

  # copying necessary files for R ploting traning slides
  if(name == "plot"){
    file.copy(paste(packagePath,"final-artwork.pdf",sep=""), "final-artwork.pdf")
    file.copy(paste(packagePath,"worldmap.png",sep=""), "worldmap.png")
    file.copy(paste(packagePath,"bgi-map.png",sep=""), "bgi-map.png")
    file.copy(paste(packagePath,"spectrum.png",sep=""), "spectrum.png")
    file.copy(paste(packagePath,"iheatmap.png",sep=""), "iheatmap.png")

    print("xelatex is running")
    system("xelatex slides.tex")

    file.remove(c("bgi-logo.png", "context-specfic-mutation.pdf", "worldmap.png", "bgi-map.png"))
  }

  # copying necessary files for machine learning training
  if(name == "machineLearning"){
    
  }

  # copying necessary files for unitTesting training
  if(name == "unitTesting"){

  }
}
