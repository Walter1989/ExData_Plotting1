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

# create the second plot (histogram of distribution of Global Active power).
png("plot3.png")
plot(mydata$Datetime, mydata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy by metering")
lines(mydata$Datetime, mydata$Sub_metering_2, type = "l", col = "red" )
lines(mydata$Datetime, mydata$Sub_metering_3, type = "l", col = "blue" )
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))
dev.off()