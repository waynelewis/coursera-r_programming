# Week 2, Part 1
# 2015-07-17

complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases

    source("read_file.R")
    source("find_complete_observations.R")
    
    df <- data.frame(matrix(ncol = 2, nrow = length(id)))
    colnames(df) <- c("id", "nobs")

    index <- 1

    for (file_id in id) {
        data <- read_file(directory = directory, file_id)
        nobs <- find_complete_observations(data)
        df[index,] = c(file_id, nobs)
        index <- index + 1 
    }
    df
}

