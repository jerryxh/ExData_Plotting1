#plot1.R

# Load tidy dataset (i.e., data from the dates 2007-02-01 and 2007-02-02)
power.consumption <- read.table('household_power_consumption_20070201_20070202.txt', header=TRUE, sep='|')
power.consumption$DateTime <- as.POSIXlt(power.consumption$DateTime)
 
# Construct plot and save it to a PNG file device
png(filename='plot1.png', width=480, height=480, units='px')
hist(power.consumption$GlobalActivePower, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
 
# shut down the current PNG device
x <- dev.off()
