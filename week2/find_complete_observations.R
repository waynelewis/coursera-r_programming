find_complete_observations <- function(data) {
    sulf_ok <- !is.na( data[,2])
    nit_ok <- !is.na( data[,3])
    both_ok <- sum(sulf_ok & nit_ok)
}



