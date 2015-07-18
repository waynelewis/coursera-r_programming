# Week 2, Part 1
# 2015-07-17

corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0

    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!

    source("read_file.R")
    source("find_complete_observations.R")

    files = list.files(directory)
    index <- 1
    correlations = vector(mode = "numeric", length = 0)

    for (file in files) {
        data = read_file(directory = directory, file_name = file)
        if (find_complete_observations(data) >= threshold) {
            good_obs <- !is.na(data[,"sulfate"]) & !is.na(data[,"nitrate"])
            good_sulfate = data[good_obs, "sulfate"]
            good_nitrate = data[good_obs, "nitrate"]
            result <- cor(good_sulfate, good_nitrate)
            correlations = append(x = correlations, values = result)
        }
    }

    correlations

}
