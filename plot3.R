read.hpc <- function(datadir='.') {
    data <- read.table(file=file.path(datadir, 'household_power_consumption.txt'),
                       sep=';', header=TRUE, na.strings='?')
    
    # Only get rows we care about
    data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
    
    # Convert to datetime
    data$Date <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
    return(data)
}

make.plot.3 <- function(datadir='.', outdir='.') {
    data <- read.hpc(datadir)
    
    png(filename=file.path(outdir, 'plot3.png'))
    plot(data$Date, data$Sub_metering_1, type='l', ylab='Energy sub metering',
         xlab='')
    lines(data$Date, data$Sub_metering_2, type='l', col='red')
    lines(data$Date, data$Sub_metering_3, type='l', col='blue')
    legend(x='topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col=c('black', 'red', 'blue'), lwd=1)
    dev.off()
}

make.plot.3()