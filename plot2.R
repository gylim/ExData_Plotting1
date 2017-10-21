master <- read.csv2("./household_power_consumption.txt", nrows = 2075259, stringsAsFactors = F)
master[,3:9] <- lapply(master[,3:9], as.numeric)
master$Date <- as.Date(master$Date, format = "%d/%m/%Y")
subset(master, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")) -> small
master$datetime <- paste(master$Date, master$Time, sep = " ")
strptime(master$datetime, format = "%d/%m/%Y %H:%M:%S") -> master$datetime
png(file = "./plot2.png")
  par(mfrow=c(1,1), mar = c(2,4,1,1))
  with(small, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))
dev.off()