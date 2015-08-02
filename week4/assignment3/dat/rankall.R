# Function to determine hospital in each state with a given ranking for a given
# outcome

rankall <- function(outcome, num = "best") {
    # Set up list of column names and numbers
    health_problems <- list("heart attack"=11, 
                            "heart failure"=17, 
                            "pneumonia"=23)

    # Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")

    # Check that the state and outcome are valid
    if (!(tolower(outcome) %in% names(health_problems))) {
        stop("invalid outcome")
    }

    # Return ranked hospital in each state

    # Get the states 
    states <- unique(data[,"State"])

    # Initialise the results data frame
    results = data.frame(hospital=character(length(states)),
                         state=character(length(states)),
                         stringsAsFactors = FALSE)

    index = 1

    for (state in states) {
        # Create a subset with the required state
        state_select <- data[,"State"] == state

        # Get a data subset for the state
        data_state <- data[state_select,]

        # Get the column index for the health problem
        col_index <- health_problems[outcome][[1]]

        # Convert data to numeric
        data_state[,col_index] <- as.numeric(data_state[,col_index])

        # Remove any NA results
        data_state <- data_state[!is.na(data_state[,col_index]),]

        # Order the data by mortality rate then alphabetically
        data_state <- data_state[order(data_state[,col_index],
                                       data_state[,"Hospital.Name"]),]

    # Return the requested value
    if (num == "best") {
        hospital <- data_state[1,"Hospital.Name"]
    }
    else if (num == "worst") {
        hospital <- data_state[dim(data_state)[1],"Hospital.Name"]
    }
    else {
        num <- as.numeric(num)
        if (num > dim(data_state)[1]) {
            hospital <- NA
        }
        else {
            hospital <- data_state[num, "Hospital.Name"]
        }
    }
    # Append the value to the result data frame
    results[index, "hospital"] <- hospital
    results[index, "state"] <- state

    index = index + 1
    }
    # Sort the results data frame
    results <- results[order(results[,"state"]),]

    results
}
