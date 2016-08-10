## if-else
if(x > 3) {
  y <- 10
} else {
  y <- 0
}

y <- if(x > 3) {
  10
} else {
  0
}


## for loop
for(i in 1:10){
  print(i)
}

x <- c('a', 'b', 'c', 'd')
for(i in 1:4){
  print(x[i])
}

for(i in seq_along(x)){
  print(x[i])
}

for(letter in x){
  print(letter)
}

for(i in 1:4) print(x[i])


x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))){
  for(j in seq_len((ncol(x)))){
    print(x[i, j])
  }
}


## while loop
count <- 0
while (count < 10) {
  print(count)
  count <- count + 1
}


z <- 5
while(z >= 3 & z <= 10){
  print(z)
  coin <- rbinom(1, 1, 0.5)
  if(coin == 1){  ## random walk
    z <- z + 1
    } else {
      z <- z - 1
    }
}


## repeat
x0 <- 1
tol <- 1e-8
repeat{
  x1 <- rbinom(1, 1, 0.3)
  if(abs(x1 - x0) <  tol){
    break
  } else {
    x0 <- x1
  }
}


## next, return
for(i in 1:10){
  if(i <= 5){
    next
  } else {
    print(i)
  }
}