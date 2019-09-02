#downloading and loading data onto R
library(RCurl)
filePath <- getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", file.path(filePath,"./PowerConsumption.zip"))
unzip("./PowerConsumption.zip")

#assigning data
Powerdata <- read.csv("household_power_consumption.txt", header = TRUE, sep=';', na.strings="?")
housEnergy <- subset (Powerdata, Date %in% c("1/2/2007","2/2/2007"))
EnergyDates <- as.Date(housEnergy$Date,format="%d/%m/%Y")

#plot 1

hist(housEnergy$Global_active_power, col ="red", main = "Global Active Power", xlab = " Global Active Power(kilowatts)", ylab = "Frequency")

#to create png file
png("plot1.png", width=480, height=480)
dev.off()
