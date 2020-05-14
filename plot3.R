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

png("plot3.png", width=480, heigh=480)
with(power_sub, plot(Date_Time, Sub_metering_1, type="n", 
                     ylab="Energy sub metering"), xlab="")
with(power_sub, lines(Date_Time, Sub_metering_1))
with(power_sub, lines(Date_Time, Sub_metering_2, col="red"))
with(power_sub, lines(Date_Time, Sub_metering_3, col="blue"))
legend("topright", col = c("black", "red", "blue"), lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()




