## Functions below calculate the inverse or matrix and stores in cache. Next time if you calculate inverse of same matrix it will pick up from cache.
## It use solve function to calculate the inverse. 

## This function returns a list of four functions.
## get,set,setinverse,getinverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## This function returns the inverse of matrix. If the inverse is available in cache it will pick from cache else it will calculate using solve.

cacheSolve <- function(x, ...) {
        ## Returns a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("I am getting data from cache")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
