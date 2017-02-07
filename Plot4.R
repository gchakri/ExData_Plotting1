## This section is to read the data and subset

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", comment.char="", na.strings="?")
data$timestamp <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
data$dateonly <- with(data, as.Date(Date, format="%d/%m/%Y"))
projectData <- subset(data, dateonly >= "2007-02-01" & dateonly <= "2007-02-02")


## plot 4 - this section is to construct required graph and plot to a PNG

png(filename = "Plot4.png", width = 480, height = 480, units = "px", bg = "white",  res = NA)
par(mfrow = c(2,2), mar = c(4,4,2,1))
with(projectData, {
	plot(timestamp, Global_active_power, pch="", main="", ylab="Global Active Power (kilowatt)", xlab = "")
	lines(timestamp, Global_active_power)

	plot(timestamp, Voltage, pch="", main="", ylab="Voltage", xlab = "datetime")
	lines(timestamp, Voltage)

	plot(timestamp, Sub_metering_1, pch="", main="", ylab="Energy Sub Metering", xlab = "")
	lines(timestamp, Sub_metering_1)
	lines(timestamp, Sub_metering_2, col="red")
	lines(timestamp, Sub_metering_3, col="blue")

	plot(timestamp, Global_reactive_power, pch="", main="", ylab="Global_reactive_power", xlab = "datetime")
	lines(timestamp, Global_reactive_power)
})
dev.off()

