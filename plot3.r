## Download and unzip the data
if(!file.exists('data.zip')){
  url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  
  download.file(url,destfile = "data.zip")
}

## Unzip the file
unzip("data.zip")

## Read the data 
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";", na.strings="?")

## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(finalData$Date, finalData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(finalData$Global_active_power)
subMetering1 <- as.numeric(finalData$Sub_metering_1)
subMetering2 <- as.numeric(finalData$Sub_metering_2)
subMetering3 <- as.numeric(finalData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 