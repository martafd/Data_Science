## functions
add2 <- function(x, y){
  x+y 
}


x <- c(1,3,2,4,5,11,12,13)
aboven <- function(x, n){
  use <- x > n
  x[use]
}
aboven(c(12,333,21,2,1,1,1,22,3,4), 6)


columnmean <- function(y, removeNA=TRUE){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}
columnmean(airquality)
columnmean(airquality, FALSE)


f <- function(a, b){
  a^2
}
f(4)


myplot <- function(x, y, type='l', ...){
  plot(x, y, type =  type, ...)
}


## scoping rules
make.power <- function(n){
  pow <- function(x){
    x^n
  }
  pow
}
cube <- make.power(3)
cube(3)

ls(environment(cube))
get('n', environment(cube))


y <- 4
f <- function(x){
  y <- 3
  y^4 + g(x)
}
g <- function(x){
  x*y
}

## maximizing a normal likelyhood
make.NegLogLik <- function(data, fixed=c(FALSE, FALSE)){
   params <- fixed
   function(p){
     params [!fixed] <- p
     mu <- params[1]
     sigma <- params[2]
     a <- -0.5*length(data)*log(2*pi*sigma^2)
     b <- -0.5*sum((data - mu)^2) / (sigma^2)
     -(a + b)
   }
}
set.seed(1); normals <- rnorm(100, 1, 2)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))
optim(c(mu=0, sigma=1), nLL)$par


nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum


nLL <- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum

x <- seq(0.3, 1.7, len=100)
y <- sapply(x, nLL)
plot(x, exp(-(y-min(y))), type = 'l')

