# Week 2 function examples

above10  <- function(x) {
    use <- x > 10
    x[use]
}

above <- function(x,y=10) {
    use <- x > y
    x[use]
}

