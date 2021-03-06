### Plot 1

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


### Plot 1

png("plot1.png", width=480, height=480)

with(pw, hist(Global_active_power, main="Global Active Power", 
              xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red"))
dev.off()
