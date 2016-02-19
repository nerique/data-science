rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    ##parameters
    validColumns = c(11, 17, 23)
    
    ## Check that state and outcome are valid
    ##state must exist in the csv
    if (!(state %in% data[,7])) {
        stop('invalid state');
    }
    ##outcome authorized values : heart failure, heart attack, pneumonia
    if (!(outcome %in% c('heart failure', 'heart attack', 'pneumonia'))) {
        stop('invalid outcome');
    } else {
        colNum <- if (outcome == 'heart failure') {
            17
        } else if (outcome == 'heart attack') {
            11
        } else {
            23 
        }
    }
    
    ##subsetting to the desired state
    data <- data[data$State == state,]
    ##Remove na datas
    ## First convert all three columns to numeric
    data[, validColumns] <- sapply(data[, validColumns], as.numeric)
    ##Deleting all rows concerned by 
    #data <- completedColumns(data, c(11, 17, 23))
    data <- completedColumns(data, colNum)
    ## Return hospital name in that state with lowest 30-day death rate
    #as.character(data[which.min(data[, colNum]), 2])
    newdata <- data[order(data[,colNum], data[,2]),]
    
    ##num authorized values: best, worst, number < nb of hospitals in the state
    num <- if (num == 'best') {
        1
    } else if (num == 'worst') {
        nrow(newdata)
    } else {
        num
    }
    
    newdata$Hospital.Name[num]
}

completedColumns <- function(data, cols) {
    goodData <- complete.cases(data[, cols])
    return(data[goodData, ])
}