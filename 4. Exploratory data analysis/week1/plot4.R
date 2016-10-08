# plot 4

plot4 <- function(data){
    png(filename='plot4.png',width=480,height=480,units='px')
    par(mfrow = c(2,2))
    datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
    plot(datetime, data$Global_act_pow, ylab='Global Active Power', xlab='', type='l')
    plot(datetime, data$Voltage, ylab='Voltage', xlab='datetime', type='l')
    plot(datetime, data$Sub_metering_1, ylab='Energy sub metering', xlab='', type='l')
    lines(datetime, data$Sub_metering_2, col = 'red')
    lines(datetime, data$Sub_metering_3, col = 'blue')
    legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black', 'red', 'blue'),lty=c(1,1))
    plot(datetime, data$Global_react_power, ylab='Global_reactive_power', xlab='datetime', type='l')
    dev.off()
}