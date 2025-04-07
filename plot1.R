### Plot 1
# Load packages
library(data.table)
library(tidyverse)

# Load data 
path = getwd()
data <- data.table::fread("household_power_consumption.txt", sep = ";", na.strings = "?") 
data <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

# Create plot1
png("plot1.png")

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
