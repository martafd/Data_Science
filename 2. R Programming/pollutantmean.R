pollutantmean <- function(directory, pollutant, id=1:332){
    data <- numeric()
    for(i in id){
        read_data <- read.csv(paste(directory, '/', formatC(i, width = 3, flag = "0"),".csv", sep = ""))
        data <- c(data, read_data[[pollutant]])
    }
    
    mean(data, na.rm = TRUE)
}
pollutantmean("specdata", "sulfate", 1:10)



complete <- function(directory, id = 1:332){
    nobs <- numeric()
    for(i in id){
        read_data <- read.csv(paste(directory, '/', formatC(i, width=3, flag = 0), '.csv', sep=''))
        nobs <- c(nobs, sum(complete.cases(read_data)))
    }
    data.frame(id, nobs)
}
complete("specdata", 1)



corr <- function(directory, threshold = 0){
    cor <- numeric()
    dif <- complete(directory)
    ids <- dif[dif['nobs'] > threshold,]$id
    for(i in ids){
        read_data <- read.csv(paste(directory, '/', formatC(i, width=3, flag = 0), '.csv', sep=''))
        dff <- read_data[complete.cases(read_data), ]
        cor <- c(cor, cor(dff$sulfate, dff$nitrate))
    }
    cor
}
corr('specdata')
cr <- corr("specdata", 150)
head(cr)
summary(cr)
