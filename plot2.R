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
png(filename = "plot2.png")
# Histogram generation
plot(febData$DateTime, febData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# Release file
dev.off()