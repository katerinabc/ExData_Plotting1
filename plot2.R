install.packages("lubridate")
library(lubridate)
data<-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=T )
data2<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data2$Time<-strptime(data2$Time, "%H:%M:%S")
data2$Date<-as.Date(data2$Date, "%d/%m/%Y")
data2$weekday<-wday(data2$Date, label=T, abbr=T)

png(filename="plot2.png", width=480, height=480, units="px")
plot(data2$Global_active_power,type="l",
    ylab="Global Active Power (kilowatts)",
    xaxt="n")
axis(1, c(1,
          length(data2$Global_active_power)/2,
          length(data2$Global_active_power)),labels=c("Thu", "Fri", "Sat"))
dev.off()
