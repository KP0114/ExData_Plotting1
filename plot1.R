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

## Plot 1 : Histogram : Global Active Power Frequency
# Set display parameters
png("plot1.png", width=480, height=480)

# Create histogram
hist(data_consumption$Global_active_power, 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red" )

# Close dev
dev.off()
