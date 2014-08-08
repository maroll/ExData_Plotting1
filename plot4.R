#read in data
in.data <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", 
                      na.strings="?", as.is = c(1,2))

#subset only needed dates
data <- subset(in.data, (in.data$Date == "1/2/2007" | in.data$Date == "2/2/2007"))

#convert to Date/Time class
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#change local so days in graph will be in English
Sys.setlocale("LC_TIME", "English")



#draw plot
png('plot4.png')
par(mfcol=c(2,2))
#plot1
plot(data$DateTime, data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
#plot2
plot(data$DateTime, data$Sub_metering_1, type = "n",
     ylab = "Energy sub metering", xlab = "")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd=1)
#plot3
plot(data$DateTime, data$Voltage, type= "l",
     xlab= "datetime", ylab= "Voltage")
#plot4
plot(data$DateTime, data$Global_reactive_power, type= "l",
     xlab= "datetime", ylab= "Global_reactive_power")
dev.off()