# Read data
datos <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
# Date and time fields conversion
datos$Date = strptime(datos$Date, "%d/%m/%Y")
datos$Time = strptime(datos$Time, "%H:%M:%S")

# Feb 01 2007 Criteria
feb01 <- datos$Date == "2007-02-01"
# Feb 02 2007 Criteria
feb02 <- datos$Date == "2007-02-02"
# Feb 01 2007 Data
datos2 <- datos[feb01,]
# Feb 02 2007 Data
datos3 <- datos[feb02,]
# Data bind into our working dataset
febData <- rbind(datos2, datos3)
# Column with Date And Time 
febData$DateTime <- as.POSIXct(paste(format(febData$Date, format = "%Y-%m-%d"), format(febData$Time, format = "%H:%M:%S")))
# Config Image File in PNG format to export the histogram
png(filename = "plot3.png")
# Plotting
plot(febData$DateTime, febData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(febData, points(febData$DateTime, febData$Sub_metering_1, col = "black", type = "l") )
with(febData, points(febData$DateTime, febData$Sub_metering_2, col = "red", type = "l") )
with(febData, points(febData$DateTime, febData$Sub_metering_3, col = "blue", type = "l") )
legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Release file
dev.off()


