## makeCacheMatrix creates matrix type capable of running four functions
## set stores the matrix in cache, get recalls the matrix
## setInverse and getInverse do the same but for the inverse of the original matrix
makeCacheMatrix <- function(x = matrix()){
    inv <- NULL
    set <- function(y){
        x <<- y
        inv <<- NULL   #store matrix in cache
    }
    get <- function() x  #get matrix
    set_inv <- function(solve) inv <<- solve   #set inverse matrix
    get_inv <- function() inv    #get inverse matrix
    list(set = set, get = get, set_inv = set_inv, get_inv = get_inv)   # create list of functions
}


## cacheSolve take matrix type created by the makeCacheMatrix function
## and calculates the inverse matrix of it
## but first it checks to see if the calculation has been done before
## if it has been done before it recalls the data from the cache. If it has not been done 
## before it calculates the inverse matrix then store it in the cache
cacheSolve <- function(x, ...){
    ## Return a matrix that is the inverse of 'x'
    inv <- x$get_inv()  #query the x matrix's cache
    if(!is.null(inv)){
        message('getting cached data')
        return(inv)
    }
    data <- x$get()   # get the matrix used by makeCacheMatrix function 
    inv <- solve(data, ...)
    x$set_inv(inv)   # store the inverse matrix in cache using the makeCacheMatrix set function
    inv 
}


x <- matrix(1:4, 2, 2)
m1 <- makeCacheMatrix(x)
cacheSolve(m1)
