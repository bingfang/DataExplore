file <- "household_power_consumption.txt"
hhp <- read.table(file, header = FALSE, sep = ";", skip = 1, na.strings = "?")
cnames = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(hhp) <- cnames

hhp <- hhp[hhp$Date %in% c("1/2/2007", "2/2/2007"),]

hhp$Date_Time <- paste(hhp$Date, hhp$Time)
hhp$Date_Time <- strptime(hhp$Date_Time, "%d/%m/%Y %H:%M:%S")


#Fig2
plot(hhp$Date_Time, hhp$Global_active_power, type = "l", xlab = "", ylab = "Global active power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off
