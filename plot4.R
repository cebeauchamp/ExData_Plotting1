##Code to Recreate Plot 4
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

##Create a PNG file of the Plot
png (file = "plot4.png", width = 480, height = 480)

##Create All 4 of the Plots 
par(mfcol = c(2,2))
with (sd, {
      plot(DateTime,Global_active_power,type = 'l', ann=FALSE) #1 (Top Left)
      title(ylab = "Global Active Power")
      plot(sd$DateTime,  sd$Sub_metering_1,type = 'l', ann=FALSE) #2 (Bottom Left)
      lines(sd$DateTime, sd$Sub_metering_2, type = 'l', col = "red")
      lines(sd$DateTime, sd$Sub_metering_3, type = 'l', col = "blue")
      title(ylab = "Energy sub metering")
      legend("topright", lty = 1, lwd = 1.5, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(DateTime,Voltage,type = 'l', ylab = "Voltage", xlab = "datetime") #3 (Top  Right)
      plot(DateTime,Global_reactive_power,type = 'l', xlab = "datetime") #4 (Bottom Right)
      })

##Close the PNG Device
dev.off()