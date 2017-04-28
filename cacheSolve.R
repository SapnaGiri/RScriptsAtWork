cacheSolve <- function(x, ...) {
        i <- x[[4]]()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x[[2]]()
        i <- solve(data, ...)
        x[[3]](i)
        i
}