##Working directory must contain file "household_power_consumption.txt"
##before running this code

power <- read.table("household_power_consumption.txt", header = T,
sep = ";", na.strings = "?")		##read in data

power$Date <- as.Date(as.character(power$Date), "%d/%m/%Y")

feb <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]

febdt <- paste(feb$Date, feb$Time)				##pastes date and time
feb$Date <- strptime(as.character(febdt), "%Y-%m-%d %H:%M:%S")	##strptime


png(file = "plot3.png")

plot(feb$Date, feb$Sub_metering_1, type = "l",
ylab = "Energy sub metering", xlab = "")

lines(feb$Date, feb$Sub_metering_2, type = "l", col = "red")

lines(feb$Date, feb$Sub_metering_3, type = "l", col ="blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()