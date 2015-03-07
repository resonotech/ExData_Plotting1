#read data from file and convert the dates into date data type
data <- read.csv("../data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
fdata <- data[data$Date==as.Date('01/02/2007',format='%d/%m/%Y')| data$Date==as.Date('02/02/2007',format='%d/%m/%Y'),]
#merge new time file with both data and time
fdata$DateTime <-  as.POSIXct(paste(fdata$Date, fdata$Time))
plot(fdata$DateTime,fdata$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.copy(png,'plot2.png')
dev.off()