master <- read.csv2("./household_power_consumption.txt", nrows = 2075259, stringsAsFactors = F)
master[,3:9] <- lapply(master[,3:9], as.numeric)
master$Date <- as.Date(master$Date, format = "%d/%m/%Y")
subset(master, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")) -> small
png(file = "./plot1.png")
  par(mfrow=c(1,1))
  hist(small$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red", breaks = 12)
dev.off()