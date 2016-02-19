## directory : location of CSV files
## threshold : numeric vector of length 1
## returns: data frame with id of the monitor + number of complete cases
corr <- function(directory, threshold = 0) {
    
    files = list.files(directory, full.names = TRUE);
    data = c()
    for (file in files) {
        
        currentFile <- read.csv(file)
        good <- complete.cases(currentFile)
        if (length(good[good > 0]) >= threshold) {
            currentCorr = cor(currentFile[good,]$sulfate,currentFile[good,]$nitrate)
            data <- c(data, currentCorr)
        }
    }
    print(data)
}