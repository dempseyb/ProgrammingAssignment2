## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can 
## cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  # Variable(s)
  cachedInverseMatrix <<- NULL
  cachedParameter <<- NULL
  solution <- NULL
  
  # Let's see if the matrix parameter is null.  If so, then
  # there's no need to proceed
  if (is.null(x)) {
    message('Please provide an initialized matrix.')
    
  } else {
    message('Initialized matrix provided.')
    
    # If parameters are the same, then the same inverse will be produces
    # and there is no need to calculate.  Return the cached value if it
    # exists
    if (dim(cachedParameter) == dim(x) && !is.null(cachedInverseMatrix)) {
      message("Cached inverse matrix returned")
      #return(cachedInverseMatrix)
      
    }
    
    # If the parameters were not matched, then cache provided parameter for future 
    # validation
    cachedParameter <<- x
    
    # Solve the inverse for the provided matrix    
    cachedInverseMatrix <<- cacheSolve(x)
    
  }

}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), then the 
## cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  # If the matrix parameter matches the cached inverse value then
  # return the cached value
  if(all(x == cachedInverseMatrix)) {
    message('Return the cached inversed matrix')
    return(cachedMatrix)
  
  } else {
    message('Return a matrix that is the inverse of input parameter x')
    return(solve(x))
  
  }
  
}
