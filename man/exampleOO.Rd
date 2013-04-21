\name{exampleOO}
\alias{exampleOO}
\title{Examples for S3 OO system}
\description{
  Examples of S3 OO systems.
}
\arguments{NULL}
\usage{exampleOO()}
\value{NULL}
\author{Gang Chen}
\examples{
x <- list()
x$name <- "Gang Chen"
x$age <- 30
x$title <- "Dr."
x$gender <- "male"
x$email <- "chengang@bgitechsolutions.com"

attr(x, "class") <- "bgiperson"
x <- structure(x, class="bgiperson")
class(x) <- "bgiperson"

print.bgiperson <- function(x){
  print(paste("Name:",x$name))
}

y <- list()
y$name <- "Gang Chen"
y$level <- "A6"
y$department <- "Cancer"
y$supervisor <- "GQ Li"
class(y) <- "employee"

print.employee <- function(x){
  print(paste(x$name, "is an employee of BGI-Tech."))
}

print(y)

z <- list()
z$name <- "Gang Chen"
class(z) <- c("employee", "bgiperson")

print(z)
}

\keyword{OO}