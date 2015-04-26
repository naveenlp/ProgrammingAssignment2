# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix
# above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.


# makeCacheMatrix: 
# Arguments: Accepts a matrix x as input
# Return Value: Returns a list containing functions to
# set the root matrix
# get the root matrix
# set the inverse of the matrix
# get the inverse of the matrix 
makeCacheMatrix <- function(x = matrix()) {
    # i caches the inverse of x 
    i <- NULL
    set <- function(y) {
        x <<- y
        # Resetting i to NULL to ensure inverse is recalculated if x is changed         
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


# cacheSolve: 
# Arguments: Accepts a matrix x as input
# Return Value: Returns inverse of matrix x
cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        # Return cached inverse matrix if i is present
        message("getting cached data")
        return(i)
    } 
    # If i is NULL, call solve to get inverse of matrix, cache it as inverse and return i     
    i <- solve(x$get())
    x$setinverse(i)
    i
}
