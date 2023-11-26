# Function to create a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  # Initialize an empty cache
  inverse <- NULL
  
  # Setter function to set the matrix
  set <- function(newValue) {
    x <<- newValue
    # Clear the cached inverse when a new matrix is set
    inverse <<- NULL
  }
  
  # Getter function to retrieve the matrix
  get <- function() {
    x
  }
  
  # Function to cache the inverse of the matrix
  cacheInverse <- function() {
    if (!is.null(inverse)) {
      # If the inverse is already cached, return it
      message("Getting cached inverse")
      return(inverse)
    } else {
      # If the inverse is not cached, calculate and cache it
      message("Calculating inverse and caching")
      inverse <<- solve(x)
      return(inverse)
    }
  }
  
  # Return a list of functions
  list(set = set, get = get, cacheInverse = cacheInverse)
}

# Function to compute the inverse of the special "matrix" returned by makeCacheMatrix
cacheSolve <- function(x) {
  # Retrieve the cached inverse using the cacheInverse function from makeCacheMatrix
  x$cacheInverse()
}

# Usage example:
# Create a special matrix object
mat <- makeCacheMatrix(matrix(c(4, 3, 2, 1), nrow = 2))

# Get the matrix
mat$get()

# Compute the inverse and cache it
cacheSolve(mat)

# Retrieve the cached inverse
cacheSolve(mat)


