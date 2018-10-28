setwd("C:/Users/admin/Documents/R Programming/project")

power_consumption <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
february <- subset(power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_consumption)
datetime <- paste(as.Date(february$Date), february$Time)
february$Datetime <- as.POSIXct(datetime)

#Plot3
plot(february$Datetime, february$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(february$Datetime, february$Sub_metering_2, col="red")
lines(february$Datetime, february$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file ="Plot3.png", height = 480, width = 480)
dev.off()