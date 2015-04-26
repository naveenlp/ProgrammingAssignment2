# makeCacheMatrix: This function creates a special "matrix" object from a root matrix that can cache its inverse.

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
    # Inverse of x cached in i (initialized as NULL)
    i <- NULL
    
    # Sets the root matrix     
    set <- function(y) {
        x <<- y
        # Resetting i to NULL to ensure inverse is recalculated if x is changed         
        i <<- NULL
    }
    
    # Returns the root matrix     
    get <- function() x
    
    # Sets the inverse of the matrix
    setinverse <- function(inverse) i <<- inverse
    
    # Returns the inverse of the matrix
    getinverse <- function() i
    
    # Returns a list with above functions
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


# cacheSolve: 
# Arguments: Accepts a matrix x as input
# Return Value: Returns inverse of matrix x
cacheSolve <- function(x, ...) {
    # Get cached inverse matrix of x and store in i 
    i <- x$getinverse()
    
    # Return cached inverse matrix if i is present
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    
    # If i is NULL, call solve to get inverse of matrix
    i <- solve(x$get())
    
    # Cache i as inverse of x
    x$setinverse(i)
    
    # Return i     
    i
}
