data <- read.csv("../data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
fdata <- data[data$Date==as.Date('01/02/2007',format='%d/%m/%Y')| data$Date==as.Date('02/02/2007',format='%d/%m/%Y'),]
fdata$DateTime <-  as.POSIXct(paste(fdata$Date, fdata$Time))

#type=n keep open the plot for more additional points.
plot(fdata$DateTime,fdata$Sub_metering_1,type='n',ylab='Energy sub metering',xlab='')
lines(fdata$DateTime,fdata$Sub_metering_1,col='black')
lines(fdata$DateTime,fdata$Sub_metering_2,col='red')
lines(fdata$DateTime,fdata$Sub_metering_3,col='blue')
legend('topright',lty=1,lwd=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.copy(png,'plot3.png')
dev.off()