## subsetting
x <- c('a', 'b', 'c', 'd', 'd')
print(x[1:3])

x[x > 'c']

u <- x > 'b'
print(u)
print(x[u])

## subsetting lists 
x <- list(foo = 1:4, bar = 0.6)
print(x[[2]])
print(x$foo)
print(x[['bar']])
print(x['bar'])    

x <- list(foo = 1:4, bar = 0.6, baz = 'Hello')
x[c(1,3)]
name <-'foo'
print(x[[name]]) ## compute index for 'foo'
print(x$name)  ## element 'name' does nor exist 

x <- list(a = list(10, 11, 12), b = c(3.14, 2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]

## subsetting matrices
x <- matrix(1:6, 2, 3)
print(x)
x[1, 2]
x[1,]
x[, 1]
x[1, 2, drop = FALSE]
x[1, , drop = FALSE]


##Partial Matching
x <- list(aardvark = 1:5)
x$a
x[['a']]
x[['a', exact = FALSE]]


## removing NA odjects
x <- c(1, NA, 2, NaN, 3, 4)
bad <- is.na(x)
x[!bad]

y <- c('a', 'b', 'c', NA, NA, 'd')
good <- complete.cases(x, y)  ## logic and
x[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]


##vectorized operaions 
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x * y  ## element-wise multiplication
x / y
x %*% y  ## true matrix multiplication
rbind(x, y)

a <- c(1,2,3)
b <- c(2,2,2)
rbind(a, b)
