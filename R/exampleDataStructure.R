exampleDataFrame <- function(){
  df = data.frame(names = c("Gang Chen", "Chen Gang", "Xi Dada"), scores = c(90, 93, 99), weights=c(100, 105, 70))
  print(df)
  df
}

exampleList <- function(){
  ll = list(a = 1, b = c("A", "B"), c = list(x="Test", y="result"), d = matrix(rnorm(16), 4, 4))
  print(ll)
  ll
}


exampleVector <- function(){

  c = c(1,2,3,4,5,6,8)
  print(c)
  c
  
}
