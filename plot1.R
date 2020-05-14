#download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                        "household_power.zip")
#unzip("household_power.zip")

library(data.table)
library(dplyr)
library(lubridate)

power <- fread("household_power_consumption.txt", na.strings = "?")
power <- tbl_df(power)
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)

power_sub <- filter(power, Date =='2007-02-01'| Date == '2007-02-02')
rm(power)

png("plot1.png", width=480, heigh=480)
hist(power_sub$Global_active_power, col ="red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()


