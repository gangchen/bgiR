
\name{exampleTapply}
\alias{exampleTapply}
\title{Examples of tapply function}
\description{
  Examples of tapply function.
}
\arguments{NULL}
\usage{exampleTapply()}
\value{NULL}
\author{Gang Chen}
\examples{
data = matrix(rnorm(10000), ncol=10, nrow=1000)

types = sample(1:4, 1000, replace=TRUE)

tapply(data[,1], types, sum)

}
\keyword{tapply}