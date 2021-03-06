\name{highscore}
\alias{highscore}
\title{Regularized score matching method}
\usage{
highscore(x, model, lambda = 0, centered = TRUE, tol = 1e-6, maxit = 1000, ...)
}
\arguments{
  \item{x}{The n x p data matrix, that is, n observations and p variables}
  \item{model}{Either "gaussian", "nonnegative" (for non-negative Gaussians: K = K, b = K^-1 mu), "conditional" (for conditional Gaussian: A = B(2), B = B[off-diagonal], d = B[diagonal], e = b); see paper for notational references}

  \item{lambda}{The l1 regularization parameter}

  \item{centered}{Either TRUE or FALSE: if TRUE then (1) for Gaussian and non-negative Gaussian models, we estimate the shift parameter b = K^-1mu and (2) for conditional Gaussian models, we estimate the matrix B for x_ix_j cross terms}

  \item{tol}{Convergence threshold}

  \item{maxit}{Maximum number of iterations to run}

  \item{...}{ignored}
}
\description{
Implements the regularized score matching method from Lin, Drton and Shojaie (2015) http://arxiv.org/abs/1507.00433
}
\value{
A list containing parameter estimates, number of iterations run, and details of the run (regularization parameter and convergence threshold). The function will return a 0 if an error has occured. 
}
\examples{
library(mvtnorm)
n <- 500
p <- 1000
x <- rmvnorm(n, rep(0, p), diag(1,p))

highscore(x, "gaussian", lambda = 0.5, centered = TRUE, tol = 1e-06, maxit = 1000)
}
