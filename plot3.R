#read data subset
power <- read.table("household_power_consumption.txt",header=TRUE,sep= ";",stringsAsFactors = FALSE,skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrows=60*48)

#read header
names <- as.character(read.table("household_power_consumption.txt",header=FALSE,sep=";",stringsAsFactors=FALSE,nrows=1))

#name data frame columns
names(power)<-names

#change column formats
power$DT <- as.POSIXct(paste(power$Date, power$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#plot
png("plot3.png", width=480, height=480)

plot(power$DT, power$Sub_metering_1, type = "l", col = "black",ylab = "Energy sub metering", xlab = "")
lines(power$DT, power$Sub_metering_2, type = "l", col = "red")
lines(power$DT, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()