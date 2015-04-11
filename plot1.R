data<-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=T )
data2<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data2$Time<-strptime(data2$Time, "%H:%M:%S")
data2$Date<-as.Date(data2$Date, "%d/%m/%Y")

png(filename="plot1.png", width=480, height=480, units="px")
hist(data2$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
    ylab="Frequency"
)
dev.off()
