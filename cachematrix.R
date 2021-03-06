# Caching the Inverse of a matrix.

# Below are two functions that are used to create a special object that stores a
# matrix and caches its inverse.

# Warning: make sure you use invertible square matrix for the functions.
#          Undesired matrices are not taken care of in the code.
# 
# The first function, makeCacheMatrix creates a special "matrix", which is really a list
# containing a function to
# 
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverse
# 4. get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
   ## the function 'set' sets a matrix 
   ## the function 'get' shows the entries of the matrix 
   ## the function 'setinverse' caches the inverse of the matrix
   ## the function 'getinverse' shows the cached inverse, if empty returns NULL
         m <- NULL
         set <- function(y){
            x <<- y
            m <<- NULL
         }
         get<- function() x
         setinverse <- function(inverse) m <<- inverse
         getinverse <- function() m
         list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

# This second function cacheSolver calculates the inverse of the special "matrix" created with 
# the above function. However, it first checks to see if the inverse has already been
# calculated. If so, it gets the inverse from the cache and skips the computation. 
# Otherwise, it calculates the inverse of the data and sets the value of the inverse in 
# the cache via the setinverse function.

cacheSolve <- function(x, ...) {
   
        ## Return a matrix that is the inverse of 'x'
        ## If the inverse is cached, show the cached value
        ## If not, solve for the inverse and cache the result
   
         m <- x$getinverse()
         if(!is.null(m)){
            message("getting cached data")
            return(m)
         }
         data <- x$get()
         m <- solve(data, ...)
         x$setinverse(m)
         m
         
}

