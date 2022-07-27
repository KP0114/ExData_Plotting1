# Load libraries
library(dplyr)
library("data.table")

# Load data
setwd("C:\\Users\\opti1039\\OneDrive - The Toronto-Dominion Bank\\Desktop\\JohnHopkinsCourse\\Data")
data_consumption_full <- data.table::fread(input="household_power_consumption.txt", na.strings="?")

# Convert date variable
data_consumption_full <- data_consumption_full %>% mutate(DateTime = as.POSIXct(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S"))
data_consumption_full$Date <- as.POSIXct(data_consumption_full$Date, format = "%d/%m/%Y")
data_consumption_full$Time <- as.POSIXct(data_consumption_full$Time, format = "%H:%M:%S")

# Filter on dates within range used for this project
data_consumption <- data_consumption_full %>% filter( Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 3 : Energy Sub-Metering by Time
# Set display parameters
png("plot3.png", width=480, height=480)

# Create plot
plot(x = data_consumption$DateTime, y = data_consumption$Sub_metering_1,type = "l",xlab = "", ylab = "Energy sub metering")
lines(x = data_consumption$DateTime, y = data_consumption$Sub_metering_2, col = "red")
lines(x = data_consumption$DateTime, y = data_consumption$Sub_metering_3, col = "blue")
legend("topright",
        c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
        col = c("black","red","blue"),
        lty=c(1,1),lwd=c(1,1))

# Close dev
dev.off()