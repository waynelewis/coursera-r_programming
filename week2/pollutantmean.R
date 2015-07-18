# Week 2, Part 1
# 2015-07-15

pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!

    source("read_file.R")

    values = vector(mode = "numeric")
    for (file_id in id) {
        data = read_file(file_id)
        values = append(values, data[,pollutant])
    }

    mean(values, na.rm=TRUE)
}
