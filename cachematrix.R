## Put comments here that give an overall description of what your
## functions do

## Create a cached version of matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m

  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Inverse the cached matrix

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  message("calculating data...")
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
