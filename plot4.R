# Read the data in the local directory. Read the headers (column names) and set the separators as ';'
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

# Subset the dates as be only 2007-02-01 and 2007-02-02. After a first visual inspection, these dates 
# correspond to 1/2/2007 and 2/2/2007
data_sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Create the png plot with 480 x 480 pixels
png("plot4.png", width = 480, height = 480)

# Create 2x2 array for the plots
par(mfrow=c(2,2))

# Plot top left
plot(strptime(paste(data_sub$Date,data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(data_sub$Global_active_power), type="l", xlab="", ylab="Global Active Power")

# Plot top right
plot(strptime(paste(data_sub$Date,data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(data_sub$Voltage), type="l", xlab="datetime", ylab="Voltage")

# Plot bottom left
with(data_sub, plot(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(Sub_metering_1), type="n", xlab="",ylab="Energy sub metering"))
with(data_sub, lines(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(Sub_metering_1) ))
with(data_sub, lines(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(Sub_metering_2), col="red" ))
with(data_sub, lines(strptime(paste(Date,Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(Sub_metering_3), col="blue" ))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot bottom right
plot(strptime(paste(data_sub$Date,data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(data_sub$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

# Close the png file
dev.off()

# See this plot at https://github.com/clarajorda/ExData_Plotting1/blob/master/figure/plot4.png
