#plot3.R

# Load tidy dataset (i.e., data from the dates 2007-02-01 and 2007-02-02)
power.consumption <- read.table('household_power_consumption_20070201_20070202.txt', header=TRUE, sep='|')
power.consumption$DateTime <- as.POSIXlt(power.consumption$DateTime)
 
# Construct plot, add legend, and save it to a PNG file device
png(filename='plot3.png', width=480, height=480, units='px')
lncol <- c('black', 'red', 'blue')
lbls <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
plot(power.consumption$DateTime,power.consumption$SubMetering1, type='l', col=lncol[1], xlab='', ylab='Energy sub metering')
lines(power.consumption$DateTime, power.consumption$SubMetering2, col=lncol[2])
lines(power.consumption$DateTime, power.consumption$SubMetering3, col=lncol[3])
legend('topright', legend=lbls, col=lncol, lty='solid')
 
# shut down the current PNG device
x <- dev.off()