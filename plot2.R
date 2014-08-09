
##Working directory must contain file "household_power_consumption.txt"
##before running this code

power <- read.table("household_power_consumption.txt", header = T,
sep = ";", na.strings = "?")					##read in data

power$Date <- as.Date(as.character(power$Date), "%d/%m/%Y")

feb <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]

febdt <- paste(feb$Date, feb$Time)				##pastes date and time
feb$Date <- strptime(as.character(febdt), "%Y-%m-%d %H:%M:%S")	##strptime

									##head(feb$Date) check 
									##class(feb$Date) 
									##should be POSIXlt	

png(file = "plot2.png")						##new png file

plot(feb$Date, feb$Global_active_power, type = "l", xlab = "",
ylab = "Global Active Power (kilowatts)")

dev.off()								##close graphics device


