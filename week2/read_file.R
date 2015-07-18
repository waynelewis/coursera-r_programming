read_file <- function(file_id = 1, directory = ".") {
    file = paste(c(sprintf("%03d",file_id), ".csv"), collapse='')
    path = paste(c(directory, "/", file), collapse='')
    data <-read.csv(file = path, header=TRUE)
}

