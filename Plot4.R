## Loading Data set
Data<-read.csv("./household_power_consumption.txt",sep=";", header=TRUE,nrows=2075259,na.strings = "?")
Data$Date<-as.Date(Data$Date,format="%d/%m/%Y")

## Selecting Data
StartDate=as.Date("2007-02-01",format="%Y-%m-%d") 
EndDate=as.Date("2007-02-02",format="%Y-%m-%d")
SubData<-Data[which(Data$Date %in% c(StartDate,EndDate)),]

## Plotting 4
DateTime<-strptime(paste(SubData$Date,SubData$Time, sep=" "),"%Y-%m-%d %H:%M:%S")
GlobalActivePower<-as.numeric(SubData$Global_active_power)
GlobalReactivePower<-as.numeric(SubData$Global_reactive_power)
Voltage<-as.numeric(SubData$Voltage)
SubMetering1<-as.numeric(SubData$Sub_metering_1)
SubMetering2<-as.numeric(SubData$Sub_metering_2)
SubMetering3<-as.numeric(SubData$Sub_metering_3)

png("Plot4.png",width=480,height=480,units = "px")
par(mfrow=c(2,2))
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DateTime, SubMetering1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(DateTime, SubMetering2,col="red")
lines(DateTime, SubMetering3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2, col=c("black","red","blue"))
plot(DateTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()