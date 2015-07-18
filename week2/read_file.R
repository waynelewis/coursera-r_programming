# Week 2, Part 1
# 2015-07-15

read_file <- function(directory = ".", file_id = FALSE, file_name=FALSE) {
    if (file_id != FALSE) {
        file <- paste(c(sprintf("%03d",file_id), ".csv"), collapse='')
    }
    else {
        file <- file_name
    }

        path <- paste(c(directory, "/", file), collapse='')
        data <-read.csv(file = path, header=TRUE)
}

