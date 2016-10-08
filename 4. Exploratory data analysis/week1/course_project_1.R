library(data.table)
library(lubridate)
f <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', colClasses=c(rep('character',2),rep('numeric',7)))

data <- f[f$Date == '1/2/2007' | f$Date == '2/2/2007', ]
colnames(data) <- c('Date','Time', 'Global_act_power', 'Global_react_power', 'Voltage', 'Global_intensity', 'Sub_metering_1','Sub_metering_2', 'Sub_metering_3')

# plot 1
source(file="plot1.R")
plot1(data)

#plot 2
source(file="plot2.R")
plot2(data)

#plot 3
source(file="plot3.R")
plot3(data)

#plot 4
source(file="plot4.R")
plot4(data)
