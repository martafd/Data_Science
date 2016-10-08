# plot 1

plot1 <- function(data){
    png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
    hist(data$Global_act_pow, col = 'red', xlab = 'Global Active Power (kilowatts)', main='Global Active Power')
    dev.off()    
}