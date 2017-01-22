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
# Config Image File in PNG format to export the histogram
png(filename = "plot1.png")
# Histogram generation
hist(febData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# Release file
dev.off()