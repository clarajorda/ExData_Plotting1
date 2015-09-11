# Read the data in the local directory. Read the headers (column names) and set the separators as ';'
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", , stringsAsFactors=FALSE)

# Subset the dates as be only 2007-02-01 and 2007-02-02. After a first visual inspection, these dates 
# correspond to 1/2/2007 and 2/2/2007
data_sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Create the png plot with 480 x 480 pixels
png("plot1.png", width = 480, height = 480)

# Create the histogram as given in the example
hist(as.numeric(data_sub$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frecuency", col="red")

# Close the png file
dev.off()

# See this plot at https://github.com/clarajorda/ExData_Plotting1/blob/master/figure/plot1.png