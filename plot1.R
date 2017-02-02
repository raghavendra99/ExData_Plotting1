df <- read.table("D:/R_files/Assignments/household_power_consumption.txt",skip=grep("1/2/2007",readLines("D:/R_files/Assignments/household_power_consumption.txt",)),nrows=2878,sep = ";",header = TRUE,stringsAsFactors = FALSE)
colnames(df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#converting '?'  to 'NA'
df[df=="?"]<-NA
#changing the date format
df$Date <- strptime(df$Date,format = "%d/%m/%Y")
#plot
hist(df$Global_active_power,col="orange",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main ="Global Active Power")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
df <- df[,c(1:9)]
