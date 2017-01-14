#read data subset
power <- read.table("household_power_consumption.txt",header=TRUE,sep= ";",stringsAsFactors = FALSE,skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrows=60*48)

#read header
names <- as.character(read.table("household_power_consumption.txt",header=FALSE,sep=";",stringsAsFactors=FALSE,nrows=1))

#name data frame columns
names(power)<-names

#change column formats
power$DT <- as.POSIXct(paste(power$Date, power$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#plot
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(power$DT, power$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(power$DT, power$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(power$DT, power$Sub_metering_1, type = "l", col = "black",ylab = "Energy sub metering", xlab = "")
lines(power$DT, power$Sub_metering_2, type = "l", col = "red")
lines(power$DT, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(power, plot(DT, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()