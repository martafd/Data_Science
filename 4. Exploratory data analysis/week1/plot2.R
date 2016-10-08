# plot 2

plot2 <- function(data){
    png(filename='plot2.png',width=480,height=480,units='px')
    datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
    plot(datetime, data$Global_act_pow, ylab='Global Active Power (kilowatts)', xlab='', type='l')
    dev.off()
}
