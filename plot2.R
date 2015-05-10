library(data.table)
require(sqldf)
library(lubridate)  

file<-"household_power_consumption.txt"
df <- read.csv.sql(f,sep=";" ,"select * from file where Date='1/2/2007' or Date='2/2/2007' ")
Date<-as.Date(df$Date, format = "%d/%m/%Y") 
DateTime <- as.POSIXct(paste(Date, df$Time))
png("Plot2.png", width=480, height= 480)
plot(DateTime,df$Global_active_power, type="l", lwd=1,, xlab="", ylab= "Global Active Power (kilowatts)")
graphics.off()

