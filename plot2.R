## Download the "Electric power consumption" dataset, unzip it and store the 
## "household_power_consumption.txt" file in working directory

## Reading data
rawdata <- read.table("household_power_consumption.txt", sep = ";", 
                      na.strings = "?", header = TRUE)
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
data <- rawdata[rawdata$Date >= "2007-02-01" & rawdata$Date <= "2007-02-02",]
data$Time <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

#Plotting
png(filename = "plot2.png")
par("bg" = "transparent")
with(data, plot(Time, Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power (kilowatts) "))
dev.off