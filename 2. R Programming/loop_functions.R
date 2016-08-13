x <- list(a = 1:5, b = rnorm(10))
lapply(x, )

x <- list(x=matrix(1:4, 2, 2), b=matrix(1:6, 3, 2))
x
lapply(x, function(elt) elt[,1]) ## extract first column from matrices

lapply(x, mean)
sapply(x, mean)
mean(x)

x <- matrix(rnorm(200), 20, 10)
x
apply(x, 2, mean)   ## preserve all columns, but collapse all rows
apply(x, 1, sum) ## preserve all rows, but collapse all columns
apply(x, 1, quantile, probs=c(0.25, 0.75))


a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)
rowMeans(a, dim=1)


list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
mapply(rep, 1:4, 4:1)


noise <- function(n, mean, sd){
    rnorm(n, mean, sd)
}
noise(5, 1, 2)

mapply(noise, 1:5, 1:5, 2)

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10)
tapply(x, f, mean)
tapply(x, f, mean, simplify = FALSE)
tapply(x, f, range)


split(x, f)
lapply(split(x, f), mean)   ## tapply is more compact

head(airquality)
x <- split(airquality, airquality$Month)
lapply(x, function(x) colMeans(x[, c('Ozone', 'Solar.R', 'Wind')], na.rm = TRUE))
sapply(x, function(x) colMeans(x[, c('Ozone', 'Solar.R', 'Wind')], na.rm = TRUE))


x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
interaction(f1, f2)
str(split(x, list(f1, f2), drop=TRUE))  ## drop = TRUE removes levels with no information
