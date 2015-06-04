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

# create the second plot (Line graph of Global Active power over time).
png("plot2.png")
plot(mydata$Datetime, mydata$Global_active_power, type = "l", xlab="", ylab = "Global active power (kilowatts)")
dev.off()