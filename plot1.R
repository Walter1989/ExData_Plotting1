## read the data
#setwd("~//datasciencecoursera/experimental")
Sys.setlocale("LC_TIME", "English")
require(stringr)
require(lubridate)
library(stringr)
library(lubridate)

mydata <- read.table("household_power_consumption.txt", na.strings = "?", stringsAsFactors = TRUE, sep = ";", header = TRUE)
mydata$Date <- str_trim(mydata$Date)
mydata <- (subset(mydata, Date == "1/2/2007" | Date == "2/2/2007"))
mydata$Date <- as.Date(dmy(mydata$Date))

# create the first plot (histogram of distribution of Global Active power).
png("plot1.png")
hist(x = mydata$Global_active_power, col = "red", xlab = "Global Active Power (Neurowatts)", main = "Global Active Power")
dev.off()

# create the first plot (histogram of distribution of Global Active power) with Stephen Few style color palette
#hist(x = mydata$Global_active_power, col = "#5DA5DA", xlab = "Global Active Power (Neurowatts)", main = "Global Active Power")
