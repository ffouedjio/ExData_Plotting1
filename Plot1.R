## Loading Data set
Data<-read.csv("./household_power_consumption.txt",sep=";", header=TRUE,nrows=2075259,na.strings = "?")
Data$Date<-as.Date(Data$Date,format="%d/%m/%Y")

## Selecting Data
StartDate=as.Date("2007-02-01",format="%Y-%m-%d") 
EndDate=as.Date("2007-02-02",format="%Y-%m-%d")
SubData<-Data[which(Data$Date %in% c(StartDate,EndDate)),]


## Plotting 1
GlobalActivePower<-as.numeric(SubData$Global_active_power)
png("Plot1.png",width=480,height=480,units = "px")
hist(GlobalActivePower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
