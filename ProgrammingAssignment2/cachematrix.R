## Put comments here that give an overall description of what your
## functions do
## We're create two functions:
## The first one will provide all the functions to set, get, set cache and get cache of the inverse of a matrix
## The second will compute the inverse of a matrix, only if it has not been calculated yet. If calculated yet, will retrieve the cached version

## Write a short comment describing this function
## arg: x -> a matrix object
## defines the getters and setters for the matrix passed as an argument
## setinverse sets the inversed matrix in cache
## getinverse retrieves a cached inversed matrix
makeCacheMatrix <- function(x = matrix()) {
    inversedMatrix <- NULL
    set <- function(y) {
        x <<- y
        inversedMatrix <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inversedMatrix <<- inverse
    getinverse <- function() inversedMatrix
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing th is function
## arg: x -> a makeCacheMatrix object
## returns: an inversed matrix
## Checks whether the matrix give as parameter has been cached or not
## if yes, retrieves the cached inversed matrix and returns it
## if not, solves the matrix then stores in cache the inversed matrix and returns it
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inversedMatrix <- x$getinverse()
    if(!is.null(inversedMatrix)) {
        message("getting the cached inversed matrix")
        return(inversedMatrix)
    }
    data <- x$get()
    inversedMatrix <- solve(data, ...)
    message("setting the cached inversed matrix")
    x$setinverse(inversedMatrix)
    inversedMatrix
}