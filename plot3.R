df <- read.table("D:/R_files/Assignments/household_power_consumption.txt",skip=grep("1/2/2007",readLines("D:/R_files/Assignments/household_power_consumption.txt",)),nrows=2878,sep = ";",header = TRUE,stringsAsFactors = FALSE)
colnames(df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
df[df=="?"]<-NA
df$Date <- strptime(df$Date,format = "%d/%m/%Y")
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

plot(df$Datetime,df$Sub_metering_1,type="l",
     ylab="Energy Sub-metering", xlab="",col="black")
lines(df$Datetime,df$Sub_metering_2,type="l",col="red")
lines(df$Datetime,df$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black", "red","blue"),lty=1,cex=0.6)
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
