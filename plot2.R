#define column classes in seperate variable
columnClass<- c("character", "character", rep("numeric", 7))
#load dataset from file, assign column classes, define missing values as "?"
data<-read.csv2(file="household_power_consumption.txt", header=TRUE, sep=";", dec=".", fill=TRUE, colClasses=columnClass, na.strings="?")
#create subset for dates 2007-02-01 and 2007-02-02
data<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
#create variable "Datetime"
Datetime<-as.POSIXlt(paste(as.Date(data$Date,format="%d/%m/%Y"), data$Time, sep=" "))
data<-cbind(data, Datetime)
#create PNG to save Plot2, size 480x480
png(file="plot2.png", width=480, height=480)
#set margins
par(mar=c(4, 4, 2, 1))
#create Plot2
plot(data$Datetime, data$Global_active_power, type="l", xlab= "", ylab="Global Active Power (kilowatts)")

#close PNG file device
dev.off()