
##Working directory must contain file "household_power_consumption.txt"
##before running this code

power <- read.table("household_power_consumption.txt", header = T,
sep = ";", na.strings = "?")					##read in data

power$Date <- as.Date(as.character(power$Date), "%d/%m/%Y")
									##format date

feb <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02",]									


gap <- feb$Global_active_power				##column to be plotted

png(file = "plot1.png")						##new png file

hist(as.numeric(gap), col = "red", main = "Global Active Power", 
xlab = "Global Active Power (kilowatts)")			##histogram 

dev.off()								##close graphics device
								
