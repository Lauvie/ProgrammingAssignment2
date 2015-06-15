## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        # Set changes the value of x stored the function and
        # and set i, the potentially stored inverse of the matrix, 
        # to null
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        # Prints the matrix x
        get <- function() x
        # Stores i in cache as equal to solve
        setinverse <- function(solve) i <<- solve
        # Prints i
        getinverse <- function() i
        # Creates a list storing the four functions
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


list <- makeCacheMatrix(c(1,4,5,3,6,7,8,9,10),3,3))


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        # 1) Let's check if i already exists in cache
        i <- x$getinverse()
        # If i is not null then i will be returned
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        # 2) If i does not already exists in cache then we compute it
        # data is created as equal to the matrix
        data <- x$get()
        # i is created as equal to the inverse of data
        i <- solve(data)
        # Then we put i in cache in case we need it later
        x$setinverse(i)
        # We return i, the inverse of the matrix ma_matrix
        i
}

f <- cacheSolve(list,)
print(f)


