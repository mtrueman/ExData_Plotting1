read.hpc <- function(datadir='.') {
    data <- read.table(file=file.path(datadir, 'household_power_consumption.txt'),
                       sep=';', header=TRUE, na.strings='?')
    
    # Only get rows we care about
    data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
    
    # Convert to datetime
    data$Date <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
    return(data)
}

make.plot.1 <- function(datadir='.', outdir='.') {
    data <- read.hpc(datadir)
    
    png(filename=file.path(outdir, 'plot1.png'))
    hist(data$Global_active_power, col='red', main='Global Active Power',
         xlab='Global Active Power (kilowatts)')
    dev.off()
}

make.plot.1()