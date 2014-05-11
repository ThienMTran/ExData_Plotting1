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

## Plot 1
### Making Plot 1: Histogram of Global Active Power
data$Global_active_power <- as.numeric(levels(data$Global_active_power)) [data$Global_active_power]

hist(data$Global_active_power, breaks = 12, col = 34,
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

### Copy to PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
