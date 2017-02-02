df <- read.table("D:/R_files/Assignments/household_power_consumption.txt",skip=grep("1/2/2007",readLines("D:/R_files/Assignments/household_power_consumption.txt",)),nrows=2878,sep = ";",header = TRUE,stringsAsFactors = FALSE)
colnames(df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
df[df=="?"]<-NA
df$Date <- strptime(df$Date,format = "%d/%m/%Y")
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2))

plot(df$Global_active_power~df$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="datetime")
plot(df$Voltage~df$Datetime, type="l",ylab="Voltage", xlab="datetime")

plot(df$Datetime,df$Sub_metering_1,type="l",
     ylab="Energy Sub-metering", xlab="",col="black")
lines(df$Datetime,df$Sub_metering_2,col="red")
lines(df$Datetime,df$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n",lwd=2,cex=0.2) 

plot(df$Global_reactive_power~df$Datetime, type="l",ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()




