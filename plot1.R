#read the data from file
data <- read.csv('../data/household_power_consumption.txt', header = TRUE, sep = ";")
data$Date <- strptime(data$Date,'%d/%m/%Y')
data$Time <- strptime(data$Time,'%H:%M:%S')
#filter data for specific dates
fdata <- data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]

gapower <- as.numeric(as.character((fdata$Global_active_power)))

hist(gapower,col='red',main='Global Active Power', xlab='Global Active Power (kilowatts)')
#copy to png
dev.copy(png,'plot1.png')
dev.off()