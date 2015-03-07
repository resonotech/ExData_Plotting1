data <- read.csv("../data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
fdata <- data[data$Date==as.Date('01/02/2007',format='%d/%m/%Y')| data$Date==as.Date('02/02/2007',format='%d/%m/%Y'),]
fdata$DateTime <-  as.POSIXct(paste(fdata$Date, fdata$Time))

par(mfrow=c(2,2))
#Plot 1
plot(fdata$DateTime,fdata$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")

#Plot 2

plot(fdata$DateTime,fdata$Voltage,type="l",ylab="Voltage",xlab="datetime")


#Plot 3 
plot(fdata$DateTime,fdata$Sub_metering_1,type='n',ylab='Energy sub metering',xlab='')
lines(fdata$DateTime,fdata$Sub_metering_1,col='black')
lines(fdata$DateTime,fdata$Sub_metering_2,col='red')
lines(fdata$DateTime,fdata$Sub_metering_3,col='blue')
legend('topright',lty=1,lwd=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

#Plot 4
plot(fdata$DateTime,fdata$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.copy(png,'plot4.png')
dev.off()