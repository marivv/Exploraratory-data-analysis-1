### Plot 3


## a) Get data

## 1. Download Data
if(!file.exists("./data")){dir.create("./data")}
fileURL1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL1, "epower.zip")

## 2) unzip

epower <- unzip("epower.zip")
epower <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(epower)

### 3) subsetting
library(dplyr)
library(lubridate)

epower$Date <- as.Date(epower$Date, format = "%d/%m/%Y")
pw <- subset(epower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
View(pw)

## Plot

pw$Date <- as.character(pw$Date)
pw$DateTime <- paste(pw$Date, pw$Time, collapse = NULL)

pw$DateTime <- as.POSIXct(pw$DateTime, format = "%Y-%m-%d %H:%M:%S")
View(pw)

png("plot3.png", width=480, height=480)

plot(pw$Sub_metering_1 ~ pw$DateTime, type = "l", xlab = "", ylab = "Energy sub metering")
lines(pw$Sub_metering_2 ~ pw$DateTime, col= "Red")
lines(pw$Sub_metering_3 ~ pw$DateTime, col= "Blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
