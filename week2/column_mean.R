# Calculate means of each column

column_mean <- function(y) {
    nc <- ncol(y)
    means <-numeric(nc)
    for (i in 1:nc) {
        means[i] <- mean(y[,i])
    }
    return means
}
