## These functions will cache the inverse of a matrix in two functions
## the first function creates a special matrix that can cache its inverse
## the second computes the inverse of the matrix created by the first function
## 

## this function creates a special "matrix" object, really a list containing
## a function to:
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse matrix
## get the value of the inverse matrix

## Notes:
## it helped me to think of makeCacheMatrix not as a single function to be run
## but instead as a "setup" function. Yes, that's how it was described 
## but it only dawned on me as I was writing the code. It prepares the work area

makeCacheMatrix <- function(x = matrix()) {
        
        # initial purge of variable used for caching
        m <- NULL
        ## stores the matrix, purges the cache
        setmatrix <- function(y) {
                x <<- y
                ## assigns the new value to the matrix variable
                m <- NULL
                ## purges cache variable
        }
        
        ## returns stored matrix
        getmatrix <- function() {
                x
        }
        
        ## caches the argument needed for inverting
        setinverse <- function(solve) m <<- solve
        
        ## retrieve cached matrix
        getinverse <-- function() {
                m
        }
        
        # returns list containing the four functions created above
        list(
                setmatrix = setmatrix, 
                getmatrix = getmatrix, 
                setinverse = setinverse, 
                getinverse = getinverse
        )
}


## Computes the inverse of the "matrix" created by makeCacheMatrix
## if the result is already in cache, it returns the result, else it computes

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        ## check if cached value exists and return it
        if(!is.null(m)) {
                message("retrieving cached data")
                return(m)
        }
        
        ## if blank, get the matrix, calculate the inverse and store in cache
        ## return inverse
        data <-x$getmatrix()
        m <-solve(data)
        x$setinverse(m)
        m
}
