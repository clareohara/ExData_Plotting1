##Working directory must contain file "household_power_consumption.txt"
##before running this code

power <- read.table("household_power_consumption.txt", header = T,
sep = ";", na.strings = "?")					##read in data

power$Date <- as.Date(as.character(power$Date), "%d/%m/%Y")
									##format date

feb <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]
									##read data for specified
									##dates

febdt <- paste(feb$Date, feb$Time)				##pastes date and time
feb$Date <- strptime(as.character(febdt), "%Y-%m-%d %H:%M:%S")	##strptime	

png(file = "plot4.png")						##new png file

par(mfrow = c(2,2))						##2 x 2 plot array

plot(feb$Date, feb$Global_active_power, type = "l",
 ylab = "Global Active Power (kilowatts)", xlab = "")	##plot(1,1)


plot(feb$Date, feb$Voltage, type = "l",
 xlab = "datetime", ylab = "Voltage")			##plot(1,2)


plot(feb$Date, feb$Sub_metering_1, type = "l",
ylab = "Energy sub metering", xlab = "")			
lines(feb$Date, feb$Sub_metering_2, type = "l", col = "red")									
lines(feb$Date, feb$Sub_metering_3, type = "l", col ="blue")									
legend("topright", lty = 1, col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.7)
									##plot(2,1)

plot(feb$Date, feb$Global_reactive_power, type = "l",
xlab = "datetime", ylab = "Global_reactive_power")	##plot(2,2)

dev.off()								##close graphics device