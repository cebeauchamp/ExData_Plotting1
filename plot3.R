##Code to Recreate Plot 3
##Read Data into R
df <- read.table('household_power_consumption.txt',
                 header = TRUE,
                 as.is = c(1,2),
                 sep = ';', 
                 na.strings = '?')

##Subset the data
sd <- df[df$Date == '1/2/2007' | df$Date == '2/2/2007',]

##Create new date.time variable 
sd$DateTime <- paste(sd$Date,sd$Time, sep = " ")

##Convert the new variable into a timestamp
sd$DateTime <- strptime(sd$DateTime,"%d/%m/%Y %H:%M:%S")

##Oepn the PNG file device for the Plot
png (file = "plot3.png", width = 480, height = 480)

##Create Plot 2 
plot(sd$DateTime,  sd$Sub_metering_1,type = 'l', ann=FALSE)
lines(sd$DateTime, sd$Sub_metering_2, type = 'l', col = "red")
lines(sd$DateTime, sd$Sub_metering_3, type = 'l', col = "blue")
title(ylab = "Energy sub metering")
legend("topright", lty = 1, lwd = 1.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Close the PNG Device
dev.off()