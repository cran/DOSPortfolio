## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(DOSPortfolio)

## ----sims---------------------------------------------------------------------
n <- 25*2
p <- 15
data <- 5/3 * matrix(rt(n*p, df=5), ncol=p, nrow=n)

## ----dosportfolio-------------------------------------------------------------
reallocation_points <- c(25, 42)
# use the first subsample to estimate the relative loss
(portfolios <- DOSPortfolio(data, reallocation_points))

## -----------------------------------------------------------------------------
reallocation_points <- c(25, 42, 50)
# This will not work
try(portfolios <- DOSPortfolio(data, reallocation_points))

## -----------------------------------------------------------------------------
(portfolios <- DOSPortfolio(data, reallocation_points, shrinkage_type = "overlapping"))

## -----------------------------------------------------------------------------
reallocation_points <- c(25, 42)
new_target <- runif(p, -1, 1)
new_target<- new_target/sum(new_target)
(portfolios <- DOSPortfolio(data, reallocation_points, target_portfolio = new_target))

