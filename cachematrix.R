## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # check if matrix is valid
  if (!is.matrix(original.matrix)) {
    stop("invalid matrix")
  }
  
  inverted.matrix <- NULL
  
  set <- function(y) {
    original.matrix <<- y
    inverted.matrix <<- NULL
  }
  
  # get and set cached values
  get <- function() original.matrix
  
  # inverse matrix
  set.inverse <- function(solve) inverted.matrix <<- solve
  get.inverse <- function() inverted.matrix
  
  list(
    set = set, 
    get = get,
    set.inverse = set.inverse,
    get.inverse = get.inverse)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
  inverted.matrix <- cacheable.matrix$get.inverse()
  
  # check for cached matrix
  if(!is.null(inverted.matrix)) {
    message("working")
    return(inverted.matrix)
  }
  
  # create inverse matrix
  matrix.to.inverse <- cacheable.matrix$get()
  inverted.matrix <- solve(matrix.to.inverse)
  cacheable.matrix$set.inverse(inverted.matrix)
  inverted.matrix
}
