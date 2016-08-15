## simulation from the linear model y=b0 +b1*x+e, where e=N(0,2^2), x~N(0,1^2), b0=0.5, b1=2
set.seed(10)
x <- rnorm(100)
e <- rnorm(100, mean=0, sd=2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x,y)



## simulation from a Poisson model, where Y~Poisson(mu), log(mu)=b0+b1*x, b0=0.5, b1=0.3
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3* x
y <-rpois(100, exp(log.mu)) ## to get mean, we need to exponentiate
summary(y)
plot(x, y)



## random sampling
set.seed(1)
sample(1:10, 10)   ## without repeat
sample(1:10)    ## permutation
sample(1:10, replace = TRUE) 
