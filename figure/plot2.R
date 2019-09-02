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

#plot 2

with(housEnergy, {plot(Global_active_power~EnergyDateTimes , type="l", xlab= "", ylab="Global Active power (kilowatts)")})

#to create png file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
