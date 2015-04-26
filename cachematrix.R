# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix
# above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.


## makeCacheMatrix: 
# Arguments: Accepts a matrix x as input
# Value: Returns a list containing functions to
# set the root matrix
# get the root matrix
# set the inverse of the matrix
# get the inverse of the matrix 
makeCacheMatrix <- function(x = matrix()) {

}


## cacheSolve: 
# Arguments: Accepts a matrix x as input
# Value: Returns inverse of matrix x
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
