library(data.table)
require(sqldf)
library(lubridate)  

file<-"household_power_consumption.txt"
df <- read.csv.sql(f,sep=";" ,"select * from file where Date='1/2/2007' or Date='2/2/2007' ")

png("Plot1.png", width=480, height= 480)

hist(df$Global_active_power , col="red" , xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
graphics.off()