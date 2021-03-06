## read the data
#setwd("~//datasciencecoursera/experimental")
Sys.setlocale("LC_TIME", "English")
require(stringr)
require(lubridate)
library(stringr)
library(lubridate)

# read the data
mydata <- read.table("household_power_consumption.txt", na.strings = "?", stringsAsFactors = TRUE, sep = ";", header = TRUE)
mydata$Date <- str_trim(mydata$Date)
mydata <- (subset(mydata, Date == "1/2/2007" | Date == "2/2/2007"))
mydata$Date <- as.Date(dmy(mydata$Date))
mydata$Datetime <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S")

# create the fourth plot (global active power over time, voltage over time, energy by metering over time, global reactive power over time).
png("plot4.png")
par(mfrow = c(2,2))
plot(mydata$Datetime, mydata$Global_active_power, type = "l", xlab = "", ylab = "Global active power")
plot(mydata$Datetime, mydata$Voltage, type = "l", xlab = "", ylab = "Voltage")
plot(mydata$Datetime, mydata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy by metering")
lines(mydata$Datetime, mydata$Sub_metering_2, type = "l", col = "red" )
lines(mydata$Datetime, mydata$Sub_metering_3, type = "l", col = "blue" )
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))
plot(mydata$Datetime, mydata$Global_reactive_power, type = "l", xlab = "", ylab = "Global reactive power")
dev.off()