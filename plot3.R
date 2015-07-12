## Download the "Electric power consumption" dataset, unzip it and store the 
## "household_power_consumption.txt" file in working directory

## Reading data
rawdata <- read.table("household_power_consumption.txt", sep = ";", 
                      na.strings = "?", header = TRUE)
rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
data <- rawdata[rawdata$Date >= "2007-02-01" & rawdata$Date <= "2007-02-02",]
data$Time <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

#Plotting
png( filename = "plot3.png")
par("bg" = "transparent")
with(data, plot(Time, Sub_metering_1, type = "n", xlab = "",
                 ylab = "Energy sub metering" ))
with(data, lines(Time, Sub_metering_1, col = "black"))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright" , lty = c(1,1,1), lwd = c(1,1,1),
       col = c("black" , "red" , "blue"),
       legend = c( "Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3" ))
dev.off()