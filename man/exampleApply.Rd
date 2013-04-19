\name{exampleApply}
\alias{exampleApply}
\title{Examples of apply function}
\description{
  Examples of apply function.
}
\arguments{NULL}
\usage{examples(exampleApply)}
\value{NULL}
\author{Gang Chen}
\examples{
data = matrix(rnorm(10000), ncol=10, nrow=1000)

apply(data, 2, sum)
}
\keyword{apply}
