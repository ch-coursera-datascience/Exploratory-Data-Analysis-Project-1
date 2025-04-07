### Plot 2
# Load packages
library(tidyverse)

# Load data 
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

# Update date and time variables
data$DateTime = paste(data$Date, data$Time, sep = " ")
data$DateTime = as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Create plot2
png("plot2.png")

plot(data$DateTime, data$Global_active_power, 
     type = "l",
     xaxt = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
axis.POSIXct(1, 
             at = seq(min(data$DateTime), max(data$DateTime)+86400, by = "day"), 
             format = "%a")

dev.off()