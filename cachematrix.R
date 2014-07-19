## Functions in this script can be used to cache matrix and its inverse
## NOTE: These function assumes that matrix is square matrix and invertible.

## Following function can be used to cache a matrix and its inverse
makeCacheMatrix <- function(invertibleMatrix = matrix()) {
  inverse <- NULL
  set <- function(y) {
    invertibleMatrix <<- y
    inverse <<- NULL
  }
  get <- function() invertibleMatrix
  setInverse <- function(theInverse) inverse <<- theInverse
  getInverse <- function() inverse
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Following function can be used to optionally compute and cache inverse of matrix
## It also returns a matrix that is the inverse of 'x'
cacheSolve <- function(cachedInvertibleMatrix, ...) {
  inverse <- cachedInvertibleMatrix$getInverse()
  if(!is.null(inverse)) {
    message("using cached inverse")
    return(inverse)
  }
  invertibleMatrix <- cachedInvertibleMatrix$get()
  inverse <- solve(invertibleMatrix)
  cachedInvertibleMatrix$setInverse(inverse)
  inverse        
}
