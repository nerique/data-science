rankall <- function(outcome, num = "best") {
    
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    myDf = data.frame()
    
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    ##parameters
    validColumns = c(11, 17, 23)
    
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
    
    ## First convert all three columns to numeric
    data[, validColumns] <- sapply(data[, validColumns], as.numeric)
    
    ## For each state, find the hospital of the given rank
    for (state in sort(unique(data$State))) {
        
        ##subsetting to the desired state
        currentData <- data[data$State == state,]
        
        ##Deleting all rows concerned by 
        currentData <- completedColumns(currentData, colNum)
        ## Return hospital name in that state with lowest 30-day death rate
        newdata <- currentData[order(currentData[,colNum], currentData[,2]),]
        
        ##num authorized values: best, worst, number < nb of hospitals in the state
        newNum <- if (num == 'best') {
            1
        } else if (num == 'worst') {
            nrow(newdata)
        } else {
            num
        }
        
        myDf <- rbind(myDf, data.frame(hospital = newdata$Hospital.Name[newNum], state = state))
    }
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    names(myDf) <- c('hospital', 'state')
    myDf
}

completedColumns <- function(thisData, cols) {
    goodData <- complete.cases(thisData[, cols])
    return(thisData[goodData, ])
}