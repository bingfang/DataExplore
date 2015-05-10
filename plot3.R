file <- "household_power_consumption.txt"
hhp <- read.table(file, header = FALSE, sep = ";", skip = 1, na.strings = "?")
cnames = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(hhp) <- cnames

hhp <- hhp[hhp$Date %in% c("1/2/2007", "2/2/2007"),]

hhp$Date_Time <- paste(hhp$Date, hhp$Time)
hhp$Date_Time <- strptime(hhp$Date_Time, "%d/%m/%Y %H:%M:%S")

#Fig3
plot(x = hhp$Date_Time, y = hhp$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x = hhp$Date_Time, y = hhp$Sub_metering_1)
lines(x = hhp$Date_Time, y = hhp$Sub_metering_2, col = "red")
lines(x = hhp$Date_Time, y = hhp$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.copy(png, "plot3.png")
dev.off

