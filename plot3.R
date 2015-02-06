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
png(file="plot3.png", width=480, height=480)
#set margins
par(mar=c(4, 4, 2, 1))
#create Plot3
#first plot sub_metering_1 
plot(data$Datetime, data$Sub_metering_1, col="black", type="l", xlab= "", ylab="Energy sub metering")
#add sub_metering_2 as a red line
lines(data$Datetime, data$Sub_metering_2, col="red", type="l")
#add sub_metering_3 as a blue line
lines(data$Datetime, data$Sub_metering_3, col="blue", type="l")
#add legend in top right corner
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#close PNG file device
dev.off()
