### Plot 4
# Load packages
library(tidyverse)

# Load data 
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

# Update date and time variables
data$DateTime = paste(data$Date, data$Time, sep = " ")
data$DateTime = as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Create plot4

png("plot4.png")

par(mfrow = c(2, 2))

  # Top left plot
  plot(data$DateTime, data$Global_active_power, 
     type = "l",
     xaxt = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
    axis.POSIXct(1, 
             at = seq(min(data$DateTime), max(data$DateTime)+86400, by = "day"), 
             format = "%a")
    
    # Top right plot
    plot(data$DateTime, data$Voltage, 
         type = "l", 
         xaxt = "n", 
         xlab = "datetime", 
         ylab = "Voltage")
    axis.POSIXct(1, 
                 at = seq(min(data$DateTime), max(data$DateTime)+86400, by = "day"), 
                 format = "%a")
    
    # Bottom left plot
    plot(data$DateTime, data$Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
    lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
    lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
    axis.POSIXct(1, 
                 at = seq(min(data$DateTime), max(data$DateTime)+86400, by = "day"), 
                 format = "%a")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty = 1)
    
    # Bottom right plot
    plot(data$DateTime, data$Global_reactive_power,
         type = "l",
         xaxt = "n",
         xlab = "datetime",
         ylab = "Global_reactive_power")
    
  dev.off()
  