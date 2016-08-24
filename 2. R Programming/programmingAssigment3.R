## 1 Plot the 30-day mortality rates for heart attack
setwd('Documents/Data_Science/2. R Programming')
outcome <- read.csv("ProgAssignment3/outcome-of-care-measures.csv", colClasses = "character")
head(outcome); ncol(outcome); nrow(outcome); names(outcome)

hist(as.numeric(outcome[, 11]), main = 'my plot', xlab = 'heart attack', col = 'red', border = 'green')



## 2 Finding the best hospital in a state
best <- function(state, outcome) {
    data <- read.csv("ProgAssignment3/outcome-of-care-measures.csv", colClasses = "character")
    if(state %in% data$State & outcome %in% c('heart failure', 'heart attack', 'pneumonia')){
        if(outcome == 'heart attack'){
            res <- data[, c(2,7,11)]
        } else if(outcome == 'heart failure'){
            res <- data[, c(2,7,17)]
        } else if(outcome == 'pneumonia'){
            res <- data[, c(2,7,23)]
        }
        split_by_states <- split(res, res$State)
        by_state <- split_by_states[[state]]
        preres <- by_state[which(as.numeric(by_state[, 3]) == min(as.numeric(by_state[, 3]), na.rm = TRUE)), ]
        result <- sort(preres$Hospital.Name)[1]
    } else if(state %in% data$State == FALSE){
        stop('invalid state')
    } else if(outcome %in% c('heart failure', 'heart attack', 'pneumonia') == FALSE){
        stop('invalid output')
    }
    result
    preres
}
best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")



## 3 Ranking hospitals by outcome in a state
rankhospital <- function(state, outcome, num = "best") {
    data <- read.csv("ProgAssignment3/outcome-of-care-measures.csv", colClasses = "character")
    
    if(is.character(num)){
        if(num %in% c('best', 'worst') == FALSE){
            stop('invalid rank')
            }
    }
    
    if(state %in% data$State & outcome %in% c('heart failure', 'heart attack', 'pneumonia')){
        illness <- if(outcome == 'heart attack'){
            "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
        } else if(outcome == 'heart failure'){
            "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
        } else if(outcome == 'pneumonia'){
            "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
        }

        by_state <- data[data$State == state, c("Hospital.Name", illness)]
        by_state[, 2] <- as.numeric(by_state[, 2])
        ordered_data_for_state <- order(by_state[illness], by_state$Hospital.Name, na.last=NA)
        
        if(num == 'best'){
            result <- as.character(by_state$Hospital.Name[ordered_data_for_state[1]])
        } else if(num == 'worst'){
            result <- as.character(by_state$Hospital.Name[ordered_data_for_state[length(ordered_data_for_state)]])
        } else if(is.numeric(num)){
            if(num > length(by_state$Hospital.Name) | num < 1){
                return(NA)
            } else if(num <= length(by_state$Hospital.Name)){
                result <- as.character(by_state$Hospital.Name[ordered_data_for_state[num]])
            }
        }
    } else if(state %in% data$State == FALSE){
        stop('invalid state')
    } else if(outcome %in% c('heart failure', 'heart attack', 'pneumonia') == FALSE){
        stop('invalid outcome')
    }
    result
}
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("TX", "heart failure", 5)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)


## 4 Ranking hospitals in all states
rankall <- function(outcome, num = "best") {
    data <- read.csv("ProgAssignment3/outcome-of-care-measures.csv", colClasses = 'character')
    if(outcome %in% c('heart failure', 'heart attack', 'pneumonia')){
        illness <- if(outcome == 'heart failure'){
            data[, 11] <- as.numeric(data[, 11])
            'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure'
        } else if(outcome == 'heart attack'){
            data[, 17] <- as.numeric(data[, 17])
            'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'
        } else if(outcome == 'pneumonia'){
            data[, 11] <- as.numeric(data[, 23])
            'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia'
        }
        
        by_state <- split(data[, c('Hospital.Name', 'State', illness)], data$State)
        ## For each state, find the hospital of the given rank
        rank_res <- function(by_state, num){
            ordered_data_for_state <- order(by_state[3], by_state$Hospital.Name, na.last=NA)
            if(num == 'best'){
                by_state$Hospital.Name[ordered_data_for_state[1]]
            } else if(num == 'worst'){
                by_state$Hospital.Name[ordered_data_for_state[length(ordered_data_for_state)]]
            } else if(is.numeric(num)){
                by_state$Hospital.Name[ordered_data_for_state[num]]
            } else {
                stop("invalid num")
            }
        }
        
    } else {
        stop('invalid outcome')
    }
    preres <- lapply(by_state, rank_res, num)
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    data.frame(hospital = unlist(preres), state = names(preres), row.names = names(preres))
}
head(rankall("heart attack", 20), 10)
r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)
