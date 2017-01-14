#read data subset
power <- read.table("household_power_consumption.txt",header=TRUE,sep= ";",stringsAsFactors = FALSE,skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrows=60*48)

#read header
names <- as.character(read.table("household_power_consumption.txt",header=FALSE,sep=";",stringsAsFactors=FALSE,nrows=1))

#name data frame columns
names(power)<-names

#change column formats
power$DT <- as.POSIXct(paste(power$Date, power$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#plot
png("plot2.png", width=480, height=480)

plot(power$DT, power$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


dev.off()