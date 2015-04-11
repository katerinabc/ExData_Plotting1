install.packages("lubridate")
library(lubridate)
data<-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=T )
data2<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data2$Time<-strptime(data2$Time, "%H:%M:%S")
data2$Date<-as.Date(data2$Date, "%d/%m/%Y")
data2$weekday<-wday(data2$Date, label=T, abbr=T)

png(filename="plot3.png", width=480, height=480, units="px")
with(data2, plot(Sub_metering_1, type="n", ylab="Energy sub metering", xaxt="n"))
with(subset(data2, select=Sub_metering_1), lines(Sub_metering_1, col="black"))
with(subset(data2, select=Sub_metering_2), lines(Sub_metering_2, col="red"))
with(subset(data2, select=Sub_metering_3), lines(Sub_metering_3, col="blue"))
axis(1, c(1,
          length(data2$Global_active_power)/2,
          length(data2$Global_active_power)),labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

