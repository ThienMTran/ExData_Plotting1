# Assigment 1 of Exploratory Data Analysis (Coursera, John Hopkin).

## Load
### Load the "Individual household electric power consumption data set".
original_data <- read.csv("../household_power_consumption.txt", sep = ";")

### Convert to Date/Time classes in R.
original_data$Date <- as.Date(original_data$Date, "%d/%m/%Y")
library(chron)
original_data$Time <- chron(times = original_data$Time)

### Subset the data only using data from the dates 207-02-01 and 2007-02-02.
use <- grep("2007-02-01|2007-02-02", original_data$Date)

data <- original_data[use,]


## Plot 4
### Open screen
windows(480, 480)

### Create plotting frame
par(mfcol = c(2,2), mar = c(4, 4, 4, 4))

### Plot "topleft"
data$Global_active_power <- as.numeric(levels(data$Global_active_power)) [data$Global_active_power]

plot(data$Global_active_power, type = "l", frame.plot = TRUE,
     xlab = "", ylab = "Global Active Power",
     axes = FALSE)
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at = c(0, 2, 4, 6))

### Plot "bottomleft"
data$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1)) [data$Sub_metering_1]
data$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2)) [data$Sub_metering_2]

plot(data$Sub_metering_1, type = "l", frame.plot = TRUE,
     xlab = "", ylab = "Energy sub metering",
     axes = FALSE)
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at = c(0, 10, 20, 30))
lines(data$Sub_metering_2, type = "l", col = 34)
lines(data$Sub_metering_3, type = "l", col = 28)
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

### Plot "topright"
data$Voltage <- as.numeric(levels(data$Voltage)) [data$Voltage]

plot(data$Voltage, type = "l", frame.plot = TRUE,
     xlab = "datetime", ylab = "Voltage",
     axes = FALSE)
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at = c(234, 238, 242, 246))

### Plot "bottomright"
data$Global_reactive_power <- as.numeric(levels(data$Global_reactive_power)) [data$Global_reactive_power]

plot(data$Global_reactive_power, type = "l", frame.plot = TRUE,
     xlab = "datetime", ylab = "Global_reactive_power",
     axes = FALSE)
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))

## Copy to PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
