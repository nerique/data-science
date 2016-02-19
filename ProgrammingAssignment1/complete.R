## directory : location of CSV files
## id ID numbers
## returns: data frame with id of the monitor + number of complete cases
complete <- function(directory, id = 1:332) {
    
    data <- data.frame(id = numeric(0), nobs = character(0))
    for (i in id) {
        
        filename <- if (i < 10) {
            paste("00", i, sep = "")
        } else  if (i < 100) {
            paste("0", i, sep = "")
        } else {
            i
        }
        currentFile <- read.csv(paste(directory, "/", filename, ".csv", sep = ""))
        goodData <- complete.cases(currentFile)
        nbrows = length(goodData[goodData > 0])
        data <- rbind(data, data.frame(id = i, nobs = nbrows))
    }
    
    df <- as.data.frame(data)
    print(df)
    
}