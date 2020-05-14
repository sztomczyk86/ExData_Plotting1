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

png("plot2.png", width=480, heigh=480)
with(power_sub, plot(Date_Time, Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()




