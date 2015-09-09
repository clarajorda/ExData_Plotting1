# Read the data in the local directory. Read the headers (column names) and set the separators as ';'
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Subset the dates as be only 2007-02-01 and 2007-02-02. After a first visual inspection, these dates 
# correspond to 1/2/2007 and 2/2/2007
data_sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Create the png plot with 480 x 480 pixels
png("plot1.png", width = 480, height = 480)

# Create the histogram 1 as given in the example
# 1. Global_active_power: household global minute-averaged active power (in kilowatt) 
# This variable is given in kilowatts, aparently, but if plotted as given, we get it as thousands
# To ge the EXACTLY same x axis (from 0 to 6), I had to divide it by 500
hist(as.numeric(data_sub$Global_active_power)/500, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frecuency", col="red")

# Close the png file
dev.off()