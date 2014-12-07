read.hpc <- function(datadir='.') {
    data <- read.table(file=file.path(datadir, 'household_power_consumption.txt'),
                       sep=';', header=TRUE, na.strings='?')
    
    # Only get rows we care about
    data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
    
    # Convert to datetime
    data$Date <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
    return(data)
}

make.plot.4 <- function(datadir='.', outdir='.') {
    data <- read.hpc(datadir)
    
    png(filename=file.path(outdir, 'plot4.png'))
    par(mfrow=c(2,2))
    
    # Top left plot
    plot(data$Date, data$Global_active_power, ylab='Global active power',
         xlab='', type='l')
    
    # Top right plot
    plot(data$Date, data$Voltage, ylab='Voltage', xlab='', type='l')
    
    # Bottom left plot
    plot(data$Date, data$Sub_metering_1, type='l', ylab='Energy sub metering',
         xlab='')
    lines(data$Date, data$Sub_metering_2, type='l', col='red')
    lines(data$Date, data$Sub_metering_3, type='l', col='blue')
    legend(x='topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col=c('black', 'red', 'blue'), lwd=1, bty="n")
    
    # Bottom right plot
    plot(data$Date, data$Global_reactive_power, ylab='Global reactive power',
         xlab='', type='l')
    dev.off()
}

make.plot.4()