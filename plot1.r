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

finalData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

png("plot1.png", height=480, width=480)

hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off ()

