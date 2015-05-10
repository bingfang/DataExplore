file <- "household_power_consumption.txt"
hhp <- read.table(file, header = FALSE, sep = ";", skip = 1, colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")
cnames <- readLines(file, 1)
cnames <- strsplit(cnames, ";", fixed = TRUE)
names(hhp) <- cnames[[1]]
hhp <- hhp[hhp$Date %in% c("1/2/2007", "2/2/2007"),]

hhp$Date_Time <- paste(hhp$Date, hhp$Time)
hhp$Date_Time <- strptime(hhp$Date_Time, "%d/%m/%Y %H:%M:%S")

# Fig1
with(hhp, hist(Global_active_power, main = "Global active power", xlab = "Global active power (kilowatts)", ylab = "Frequency", col = "red"))
#Fig2
plot(x = hhp$Date_Time, y = hhp$Global_active_power, type = "l", xlab = "", ylab = "Global active power (kilowatts)")
#Fig3
plot(x = hhp$Date_Time, y = hhp$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x = hhp$Date_Time, y = hhp$Sub_metering_1)
lines(x = hhp$Date_Time, y = hhp$Sub_metering_2, col = "red")
lines(x = hhp$Date_Time, y = hhp$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
#Fig 4
par(mfcol = c(2, 2))
plot(x = hhp$Date_Time, y = hhp$Global_active_power, type = "l", xlab = "", ylab = "Global active power")

plot(x = hhp$Date_Time, y = hhp$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x = hhp$Date_Time, y = hhp$Sub_metering_1)
lines(x = hhp$Date_Time, y = hhp$Sub_metering_2, col = "red")
lines(x = hhp$Date_Time, y = hhp$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

plot(x = hhp$Date_Time, y = hhp$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(x = hhp$Date_Time, y = hhp$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

