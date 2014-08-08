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
png('plot2.png')
plot(data$DateTime, data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()