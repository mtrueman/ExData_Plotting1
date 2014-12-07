read.hpc <- function(datadir='.') {
    data <- read.table(file=file.path(datadir, 'household_power_consumption.txt'),
                       sep=';', header=TRUE, na.strings='?')
    
    # Only get rows we care about
    data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
    
    # Convert to datetime
    data$Date <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
    return(data)
}

make.plot.2 <- function(datadir='.', outdir='.') {
    data <- read.hpc(datadir)
    
    png(filename=file.path(outdir, 'plot2.png'))
    plot(data$Date, data$Global_active_power, type='l', main='',
         xlab='', ylab='Global active power (kilowatts)')
    dev.off()
}

make.plot.2()