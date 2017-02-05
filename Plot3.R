## This section is to read the data and subset

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", comment.char="", na.strings="?")
data$timestamp <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
data$dateonly <- with(data, as.Date(Date, format="%d/%m/%Y"))
projectData <- subset(data, dateonly >= "2007-02-01" & dateonly <= "2007-02-02")


## Plot 3 - this section is to construct required graph and plot to a PNG

png(filename = "Plot3.png", width = 480, height = 480, units = "px", bg = "white",  res = NA)
with(projectData, plot(timestamp, Sub_metering_1, pch="", main="", ylab="Energy Sub Metering", xlab = ""))
with(projectData, lines(timestamp, Sub_metering_1))
with(projectData, lines(timestamp, Sub_metering_2, col="red"))
with(projectData, lines(timestamp, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

