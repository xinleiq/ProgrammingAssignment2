## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix: This function creates a special 
## "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  get <- function() { x }
  
  setinverse <- function(inv) { inverse <<- inv }
  
  getinverse <- function() { inverse }
  
  list(set = set, get = get, getinverse = getinverse, setinverse = setinverse)
}


## Write a short comment describing this function
## cacheSolve: : This function computes the inverse 
## of the special "matrix" returned by makeCacheMatrix.
## If the inverse has already been calculated (and the 
## matrix has not changed), then cacheSolve should retrieve 
## the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if (!is.null(inverse)) {
    message("Getting the cached inverse")
    return(inverse)
  }
  
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
}
