##Code to Recreate Plot 2
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

##Open the PNG file Device for the Plot
png (file = "plot2.png", width = 480, height = 480)

##Create Plot 2 
with(sd, plot(DateTime,Global_active_power,type = 'l',ann = FALSE))
title(ylab = "Global Active Power (kilowatts)")

##Close the PNG Device
dev.off()