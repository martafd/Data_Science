## using data.table
library(data.table)
df <- data.frame(x=rnorm(9), y= rep(c('a','b','c'), each = 3), z = rnorm(9))
dt <- data.table(x=rnorm(9), y= rep(c('a','b','c'), each = 3), z = rnorm(9))
tables()

dt[2, ]
dt[dt$y=='a']
dt[c(2,3)]  ##subset based on rows
dt[, c(2, 3)] ## result = 2, 3 that means line numbered

k = {print(10); 5} ## result 10
k  ## result 5
    
dt[, list(mean(x), sum(z))]
dt[, table(y)]
dt[, w := z^2]


dt2 <- dt   ## if you change a dt, dt2 will also change 
dt[, y := 2]

dt[, m := {tmp <- (x + z); log2(tmp + 5)}]
dt[, a := z > 0]
dt[, b := mean(x + w), by=a]

## special variables
set.seed(123)
dt <- data.table(x = sample(letters[1:3], 1E5, TRUE))
dt[, .N, by = x]            ## .N an integer, length 1, containing the number 


## keys
dt <- data.table(x=rep(c('a', 'b', 'c'), each =100), y = rnorm(300))
setkey(dt, x)
dt['c']

## joins
dt1 <- data.table(x=rep(c('a', 'a', 'b', 'dt1')), y = 1:4)
dt2 <- data.table(x=rep(c('a', 'b', 'dt2')), z = 5:7)
setkey(dt1, x)
setkey(dt2, x)
merge(dt1, dt2)


## fast reading
big_df <- data.frame(x = rnorm(1E3), y = norm(1E3))
    file <- tempfile()
write.table(big_df, file = file, row.names=FALSE, col.names = TRUE, sep = '\t', qoute = FALSE)
system.write(fread(file))
system.file(read.table(file, header = TRUE, sep = '\t'))
