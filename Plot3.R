## Loading Data set
Data<-read.csv("./household_power_consumption.txt",sep=";", header=TRUE,nrows=2075259,na.strings = "?")
Data$Date<-as.Date(Data$Date,format="%d/%m/%Y")

## Selecting Data
StartDate=as.Date("2007-02-01",format="%Y-%m-%d") 
EndDate=as.Date("2007-02-02",format="%Y-%m-%d")
SubData<-Data[which(Data$Date %in% c(StartDate,EndDate)),]

## Plotting 3
DateTime<-strptime(paste(SubData$Date,SubData$Time, sep=" "),"%Y-%m-%d %H:%M:%S")
SubMetering1<-as.numeric(SubData$Sub_metering_1)
SubMetering2<-as.numeric(SubData$Sub_metering_2)
SubMetering3<-as.numeric(SubData$Sub_metering_3)

png("Plot3.png",width=480,height=480,units = "px")
plot(DateTime, SubMetering1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(DateTime, SubMetering2,col="red")
lines(DateTime, SubMetering3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2, col=c("black","red","blue"))
dev.off()