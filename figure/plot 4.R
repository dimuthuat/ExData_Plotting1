#downloading and loading data onto R
library(RCurl)
filePath <- getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", file.path(filePath,"./PowerConsumption.zip"))
unzip("./PowerConsumption.zip")

#assigning data
Powerdata <- read.csv("household_power_consumption.txt", header = TRUE, sep=';', na.strings="?")
housEnergy <- subset (Powerdata, Date %in% c("1/2/2007","2/2/2007"))
EnergyDates <- as.Date(housEnergy$Date,format="%d/%m/%Y")
EnergyDateTimes <- as.POSIXct(paste(EnergyDates, housEnergy$Time))

#plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(housEnergy, {
    plot(Global_active_power~EnergyDateTimes, type="l", xlab="",
         ylab="Global Active Power (kilowatts)" )})

with(housEnergy, {   plot(Voltage~EnergyDateTimes, type="l", xlab="",
                          ylab="Voltage (volt)", )})

with(housEnergy, {    plot(Sub_metering_1~EnergyDateTimes, type="l", xlab="",
                           ylab="Global Active Power (kilowatts)" )
    lines(Sub_metering_2~EnergyDateTimes,col='Red')
    lines(Sub_metering_3~EnergyDateTimes,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(housEnergy, {   plot(Global_reactive_power~EnergyDateTimes, type="l", xlab="",
                          ylab="Global Rective Power (kilowatts)",)
})

#to create png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()