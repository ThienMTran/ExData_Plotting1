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

## Plot 3
### Making Plot 3 
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

### Copy to PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()