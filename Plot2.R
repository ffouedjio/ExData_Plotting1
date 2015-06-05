## Loading Data set
Data<-read.csv("./household_power_consumption.txt",sep=";", header=TRUE,nrows=2075259,na.strings = "?")
Data$Date<-as.Date(Data$Date,format="%d/%m/%Y")

## Selecting Data
StartDate=as.Date("2007-02-01",format="%Y-%m-%d") 
EndDate=as.Date("2007-02-02",format="%Y-%m-%d")
SubData<-Data[which(Data$Date %in% c(StartDate,EndDate)),]

## Plotting 2
DateTime<-strptime(paste(SubData$Date,SubData$Time, sep=" "),"%Y-%m-%d %H:%M:%S")
GlobalActivePower<-as.numeric(SubData$Global_active_power)
png("Plot2.png",width=480,height=480,units = "px")
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
