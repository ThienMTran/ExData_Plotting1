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

## Plot 2
### Open screen
png(filename = "Plot2.png", 480, 480)

### Making Plot 2: Global Active Power on Thu, Fri
data$Global_active_power <- as.numeric(levels(data$Global_active_power)) [data$Global_active_power]

plot(data$Global_active_power, type = "l", frame.plot = TRUE,
     xlab = "", ylab = "Global Active Power (kilowatts)",
     axes = FALSE)
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at = c(0, 2, 4, 6))

### Copy to PNG file
dev.off()