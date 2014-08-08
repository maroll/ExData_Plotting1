#read in data
in.data <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", 
                   na.strings="?", as.is = c(1,2))

#subset only needed dates
data <- subset(in.data, (in.data$Date == "1/2/2007" | in.data$Date == "2/2/2007"))

#convert to Date/Time class
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#draw plot
png('plot1.png')
hist(data$Global_active_power, main = "Global Active Power",
     xlab= "Global Active Power (kilowatts)", col = "red")
dev.off()