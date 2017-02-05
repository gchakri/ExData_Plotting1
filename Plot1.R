## This section is to read the data and subset

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", comment.char="", na.strings="?")
data$timestamp <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
data$dateonly <- with(data, as.Date(Date, format="%d/%m/%Y"))
projectData <- subset(data, dateonly >= "2007-02-01" & dateonly <= "2007-02-02")

## Plot 1 - this section is to construct required graph and plot to a PNG

png(filename = "Plot1.png", width = 480, height = 480, units = "px", bg = "white",  res = NA)
hist(projectData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatt)", ylab = "Frequency")
dev.off()
