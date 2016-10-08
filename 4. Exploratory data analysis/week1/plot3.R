# plot 3

plot3 <- function(data){
    png(filename='plot3.png',width=480,height=480,units='px')
    datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
    plot(datetime, data$Sub_metering_1, ylab='Energy sub metering', xlab='', type='l')
    lines(datetime, data$Sub_metering_2, col = 'red')
    lines(datetime, data$Sub_metering_3, col = 'blue')
    legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black', 'red', 'blue'),lty=c(1,1))
    dev.off()
}