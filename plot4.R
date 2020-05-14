library(data.table)
library(dplyr)
library(lubridate)
library(tidyr)

power <- fread("household_power_consumption.txt", na.strings = "?")
power <- tbl_df(power)
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)

power_sub <- power %>% filter(Date =='2007-02-01'| Date == '2007-02-02') %>%
        mutate(Date_Time = Date + Time)

rm(power)

png("plot4.png", width=480, heigh=480)
par(mfrow = c(2,2))

with(power_sub, plot(Date_Time, Global_active_power, type="l", 
                     ylab="Global Active Power (kilowatts)", xlab=""))

with(power_sub, plot(Date_Time, Voltage, type="l", 
                     ylab="Voltage", xlab="datetime"))

with(power_sub, plot(Date_Time, Sub_metering_1, type="n", 
                     ylab="Energy sub metering"), xlab="")
with(power_sub, lines(Date_Time, Sub_metering_1))
with(power_sub, lines(Date_Time, Sub_metering_2, col="red"))
with(power_sub, lines(Date_Time, Sub_metering_3, col="blue"))
legend("topright", col = c("black", "red", "blue"), lwd = 1, bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(power_sub, plot(Date_Time, Global_reactive_power, type="l", 
                     ylab="Global_reactive_power", xlab="datetime"))

dev.off()




