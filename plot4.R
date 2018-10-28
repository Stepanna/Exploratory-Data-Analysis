setwd("C:/Users/admin/Documents/R Programming/project")


power_consumption <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
february <- subset(power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_consumption)
datetime <- paste(as.Date(february$Date), february$Time)
february$Datetime <- as.POSIXct(datetime)

#Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1))
plot(february$Global_active_power~february$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(february$Voltage~february$Datetime, type="l", ylab="Voltage", xlab="datetime")
plot(february$Datetime, february$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(february$Datetime, february$Sub_metering_2, col="red")
lines(february$Datetime, february$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(february$Global_reactive_power~february$Datetime, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, file ="Plot4.png", height = 480, width = 480)
dev.off()