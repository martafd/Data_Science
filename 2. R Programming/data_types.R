x <- 1
print(x)
msg <- "Hello"

## This is comment
x <- 1:120

## vectors and lists 
## c() create vectors of obj
x <- c(0.4, 0.5)
x <- c(TRUE, FALSE)
x <- c(T, F)

x <- vector('complex', length = 10)

## explicit coercion
x <- 0:6
as.character(x)
as.complex(x)
as.logical(x)

x <- list(1, "a", TRUE, 9 + 8i)

## matrices
m <- matrix(nrow = 2, ncol = 3)
dim(m)
attributes(m)

m <- matrix(1:6, nrow = 2, ncol = 3)

m <- 1:10
dim(m) <- c(2,5)
print(m)

x <- 1:8
y <- 2:5
cbind(x, y)  ## add two colunms 
rbind(x, y)  ## add two rows

## Factors
f <- factor(c('yes', 'yes', 'no', 'no', 'yes'))
print(f)
table(f) # tell us how many of each level there are
unclass(f)

f <- factor(c('yes', 'yes', 'no', 'no', 'yes'), levels = c('yes', 'no'))
print(f)
table(f)

## Missing Values
x <- c(1, 2, NA, 4, NaN, 9)
is.na(x)
is.nan(x)

## Data Frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
print(x)
nrow(x)
ncol(x)

## Names
x <- 1:3
names(x)
names(x) <- c('foo', 'bar', 'norf')
names(x)
print(x)

x <- list(a = 1, b = 2, c = 3)
print(x)

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c('a', 'b'), c('c', 'd'))
print(m)
