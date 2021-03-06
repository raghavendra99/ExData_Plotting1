df <- read.table("D:/R_files/Assignments/household_power_consumption.txt",skip=grep("1/2/2007",readLines("D:/R_files/Assignments/household_power_consumption.txt",)),nrows=2878,sep = ";",header = TRUE,stringsAsFactors = FALSE)
colnames(df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#converting '?'  to 'NA'
df[df=="?"]<-NA
#changing the date format
df$Date <- strptime(df$Date,format = "%d/%m/%Y")
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

#plot
plot(df$Global_active_power~df$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
