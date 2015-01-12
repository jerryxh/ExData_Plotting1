#plot4.R

# Load tidy dataset (i.e., data from the dates 2007-02-01 and 2007-02-02)
power.consumption <- read.table('household_power_consumption_20070201_20070202.txt', header=TRUE, sep='|')
power.consumption$DateTime <- as.POSIXlt(power.consumption$DateTime)
 
# Initialize PNG file device and arrange 4 plots in 2 rows and 2 columns
png(filename='plot4.png', width=480, height=480, units='px')
par(mfrow=c(2, 2))

# Construct plot 1 
plot(power.consumption$DateTime, power.consumption$GlobalActivePower, xlab='', ylab='Global Active Power', type='l')
 
# Construct plot 2 
plot(power.consumption$DateTime, power.consumption$Voltage, ylab='Voltage', xlab='datetime', type='l')

# Construct plot 3 
linelabels <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
linecolors <- c('black', 'red', 'blue')
plot(power.consumption$DateTime, power.consumption$SubMetering1, type='l', col=linecolors[1], xlab='', ylab='Energy sub metering')
lines(power.consumption$DateTime, power.consumption$SubMetering2, col=linecolors[2])
lines(power.consumption$DateTime, power.consumption$SubMetering3, col=linecolors[3])
legend('topright', legend=linelabels, col=linecolors, lty='solid', bty='n')

# Construct plot 4 
plot(power.consumption$DateTime, power.consumption$GlobalReactivePower, xlab='datetime', ylab='Global_reactive_power', type='l')

# shut down the current PNG device
x <- dev.off()