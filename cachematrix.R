## The functions are used to create a special object that store a natrix and cache´s its inverse

## This function return a list of commands to create a special matrix, in a vector

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    print("entrei no set")
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


## this function calculate a inverse of matrix and returns its cache in case de repetition.

cacheSolve <- function(x, ...) {
 ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  print(data)
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
