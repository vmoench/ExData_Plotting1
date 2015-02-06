#define column classes in seperate variable
columnClass<- c("character", "character", rep("numeric", 7))
#load dataset from file, assign column classes, define missing values as "?"
data<-read.csv2(file="household_power_consumption.txt", header=TRUE, sep=";", dec=".", fill=TRUE, colClasses=columnClass, na.strings="?")
#create subset for dates 2007-02-01 and 2007-02-02
data<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
#create variable "Datetime"
Datetime<-as.POSIXlt(paste(as.Date(data$Date,format="%d/%m/%Y"), data$Time, sep=" "))
data<-cbind(data, Datetime)
#create PNG to save Plot3, size 480x480
png(file="plot4.png", width=480, height=480)
#create Plot4
#2 cols, 2 rows
par(mfrow = c(2, 2))
#margins upper left
par(mar=c(4, 4, 4 ,1))
#insert plot upper left  (Plot2)
plot(data$Datetime, data$Global_active_power, type="l", xlab= "", ylab="Global Active Power")
#margins upper right
par(mar=c(4, 4, 4 ,1))
#insert plot upper right
plot(data$Datetime, data$Voltage, type="l", xlab= "datetime", ylab="Voltage")
#margins lower left
par(mar=c(4, 4, 4 ,1))
#insert plot lower left
#first plot sub_metering_1 
plot(data$Datetime, data$Sub_metering_1, col="black", type="l", xlab= "", ylab="Energy sub metering")
#add sub_metering_2 as a red line
lines(data$Datetime, data$Sub_metering_2, col="red", type="l")
#add sub_metering_3 as a blue line
lines(data$Datetime, data$Sub_metering_3, col="blue", type="l")
#add legend in top right corner
legend("topright", lty=c(1, 1, 1), bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#margins lower right
par(mar=c(4, 4, 4 ,1))
#insert plot lower right
plot(data$Datetime, data$Global_reactive_power, type="l", xlab= "datetime", ylab="Global_reactive_power")

#close PNG file device
dev.off()