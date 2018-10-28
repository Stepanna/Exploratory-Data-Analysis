setwd("C:/Users/admin/Documents/R Programming/project")

power_consumption <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
february <- subset(power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power_consumption)
datetime <- paste(as.Date(february$Date), february$Time)
february$Datetime <- as.POSIXct(datetime)

#Plot One
hist(february$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file ="Plot1.png", height = 480, width = 480)
dev.off()