master <- read.csv2("./household_power_consumption.txt", nrows = 2075259, stringsAsFactors = F)
master[,3:9] <- lapply(master[,3:9], as.numeric)
master$Date <- as.Date(master$Date, format = "%d/%m/%Y")
subset(master, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")) -> small
master$datetime <- paste(master$Date, master$Time, sep = " ")
strptime(master$datetime, format = "%d/%m/%Y %H:%M:%S") -> master$datetime
png(file = "./plot4.png")
  par(mfcol = c(2,2), mar = c(3.3, 4, 1, 1), cex = 0.75)
  ##top left plot
  with(small, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power"))
  ##bottom left plot
  with(small, plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering"))
  with(small, lines(datetime, Sub_metering_1, col = "black"))
  with(small, lines(datetime, Sub_metering_2, col = "red"))
  with(small, lines(datetime, Sub_metering_3, col = "blue"))
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(small[,7:9]), bty = "n", cex = 0.9)
  ##top right plot
  par(mar=c(3.8,4,1,1))
  with(small, plot(datetime, Voltage, type = "l"))
  ##bottom right plot
  with(small, plot(datetime, Global_reactive_power, type = "l"))
dev.off()