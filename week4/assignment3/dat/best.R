# Function to determine best hospital in a state for a given outcome

best <- function(state, outcome) {
    # Set up list of column names and numbers
    health_problems <- list("heart attack"=11, 
                            "heart failure"=17, 
                            "pneumonia"=23)

    # Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")

    # Check that the state and outcome are valid
    if (!(toupper(state) %in% data[,"State"])) {
        stop("invalid state")
    }

    if (!(tolower(outcome) %in% names(health_problems))) {
        stop("invalid outcome")
    }

    # Return hospital name with lowest 30-day death rate
    # Create a subset with the required state
    state_select <- data[,"State"] == state

    # Get a data subset for the state
    data_state <- data[state_select,]

    # Get the column index for the health problem
    col_index <- health_problems[outcome][[1]]

    # Convert data to numeric
    data_state[,col_index] <- as.numeric(data_state[,col_index])

    # Find the lowest death rate
    lowest_rate <- min(data_state[,col_index], na.rm=TRUE)

    # Now create a selection vector based on the lowest death rate
    lowest_rate_select <- data_state[,col_index] == lowest_rate
    lowest_rate_select[is.na(lowest_rate_select)] <- FALSE

    # And get the best hospitals
    best_hospitals <- data_state[lowest_rate_select, "Hospital.Name"]
    best_hospitals <- best_hospitals[order("Hospital.Name")]

    best_hospitals[[1]]
}

