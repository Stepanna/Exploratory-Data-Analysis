setwd("C:/Users/admin/Documents/R Programming/project")

power_consumption <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
february <- subset(power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_consumption)
datetime <- paste(as.Date(february$Date), february$Time)
february$Datetime <- as.POSIXct(datetime)

#Plot2
plot(february$Global_active_power~february$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file ="Plot2.png", height = 480, width = 480)
dev.off()