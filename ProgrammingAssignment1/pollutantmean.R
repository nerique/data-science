## directory : location of CSV files
## pollutant: sulfate/nitrate
## id ID numbers
## returns: mean of the pollutant accross all monitors list in the id vector ignoring NA values
pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    data <- c()
    for (i in id) {
        
        filename <- if (i < 10) {
            paste("00", i, sep = "")
        } else  if (i < 100) {
            paste("0", i, sep = "")
        } else {
            i
        }
        currentFile <- read.csv(paste(directory, "/", filename, ".csv", sep = ""))
        goodData <- currentFile[!is.na(currentFile[,pollutant]), pollutant]
        data <- c(data, goodData)
    }
    
    mean(data)
    
}