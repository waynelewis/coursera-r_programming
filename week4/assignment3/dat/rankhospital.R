# Function to determine best hospital in a state for a given outcome

rankhospital <- function(state, outcome, num = "best") {
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

    # Remove any NA results
    data_state <- data_state[!is.na(data_state[,col_index]),]

    # Order the data by mortality rate then alphabetically
    data_state <- data_state[order(data_state[,col_index],
                                   data_state[,"Hospital.Name"]),]

    # Return the requested value
    if (num == "best") {
        return(data_state[1,"Hospital.Name"])
    }
    else if (num == "worst") {
        return(data_state[dim(data_state)[1],"Hospital.Name"])
    }
    else {
        num <- as.numeric(num)
        if (num > dim(data_state)[1]) {
            return(NA)
        }
        else {
            return(data_state[num, "Hospital.Name"])
        }
    }
}

