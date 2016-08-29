source('http://bioconductor.org/biocLite.R')
biocLite('rhdf5')

library(rhdf5)
## to create an empty HDF5 file
created <- h5createFile('example.h5')

## Create a group within an HDF5 file
created <- h5createGroup('example.h5', 'foo')
created <- h5createGroup('example.h5', 'ba')
created <- h5createGroup('example.h5', 'foo/fooba')
h5ls('example.h5')   ## Lists the content of an HDF5 file

## write to groups
A <- matrix(1:10, nr= 5, nc = 2)
h5write(A, 'example.h5', 'foo/A')
B <- array(seq(0.1, 2.0, by=0.1), dim = c(5, 2, 2))
attr(b, 'scale') <- 'liter'
h5write(B, 'example.h5', 'foo/fooba/B')
h5ls('example.h5')   ## Lists the content of an HDF5 file

## write a data set 
df <- data.frame(1L:5L, seq(0, 1, length.out = 5), c('ab', 'cde', 'fghi', 'a', 's'), stringsAsFactors = FALSE)
h5write(df, 'example.h5', 'df')
h5ls('example.h5')   ## Lists the content of an HDF5 file

## reading data
readA <- h5read('example.h5','foo/A')
readB <- h5read('example.h5','foo/fooba/B')
readdf <- h5read('example.h5','df')

## writing and reading chunks
h5write(c(12,13,14), 'example.h5', 'foo/A', index=list(1:3, 2))
h5read('example.h5', 'foo/A')
