library(data.table)
require(sqldf)
library(lubridate)  

file<-"household_power_consumption.txt"
df <- read.csv.sql(f,sep=";" ,"select * from file where Date='1/2/2007' or Date='2/2/2007' ")
Date<-as.Date(df$Date, format = "%d/%m/%Y") 
DateTime <- as.POSIXct(paste(Date, df$Time))
png("Plot4.png", width=480, height= 480)


#4 graphs
par(mfrow=c(2,2)) 
#t l
plot(DateTime, df$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 
#t r
plot(DateTime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")   
# b l
plot(DateTime, df$Sub_metering_1,type="l", ylab= "Energy sub metering", xlab="")
lines(DateTime, df$Sub_metering_2,type="l", col="red")
lines(DateTime, df$Sub_metering_3,type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n",col=c("black","red","blue")) 
#b r
plot(DateTime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  

graphics.off()

