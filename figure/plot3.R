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

#plot 3

with(housEnergy, { plot(Sub_metering_1 ~ EnergyDateTimes, type="l", xlab= "", ylab="Energy Sub Metering")
    lines(Sub_metering_2 ~ EnergyDateTimes, col = 'Red')
    lines(Sub_metering_3 ~ EnergyDateTimes, col = 'Blue')
})

#to create legend

legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#to create png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()