tab5rows <- read.table('household_power_consumption.txt', header = TRUE, nrows = 5, sep=';')
classes <- sapply(tab5rows,class)
tabAll <- read.table('household_power_consumption.txt', header = TRUE, sep=';',colClasses = classes,na.strings='?')
myData <- subset(tabAll, as.Date(tabAll$Date,'%d/%m/%Y') >= as.Date('01/02/2007','%d/%m/%Y'))
myData <- subset(myData, as.Date(myData$Date,'%d/%m/%Y') <= as.Date('02/02/2007','%d/%m/%Y'))
rm(tabAll)

myData$Global_active_power <- as.numeric(myData$Global_active_power)
myData$Date <- as.Date(myData$Date,'%d/%m/%Y') 

myData$Timestamp <- as.POSIXct(paste(myData$Date,myData$Time),'%d/%m%Y %H:%M:%S')

plot(myData$Timestamp,myData$Sub_metering_1, type='l',ylab='Energy sub metering', xlab='')
lines(myData$Timestamp,myData$Sub_metering_2, type='l',ylab='Energy sub metering', xlab='',col='red')
lines(myData$Timestamp,myData$Sub_metering_3, type='l',ylab='Energy sub metering', xlab='',col='blue')

dev.copy(png,'plot3.png')
dev.off
