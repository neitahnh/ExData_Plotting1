#Exploratory Data Analysis Project 1

#Plot 3

    #packages used:

library(dplyr)
library(lubridate)

    #reading data(after moving unzipped .txt file into wd):

hpc <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

    #subsetting target rows:

hpc_target <- hpc[66637:69516,]

    #creating date/time column:

hpc_target <- mutate(hpc_target, Date2 = paste(hpc_target$Date,hpc_target$Time))

hpc_target <- mutate(hpc_target, newdate3 = dmy_hms(hpc_target$Date2))

    #Convert to numeric:

hpc_target <- mutate(hpc_target, Sub_metering_1_New = as.numeric(hpc_target$Sub_metering_1))

hpc_target <- mutate(hpc_target, Sub_metering_2_New = as.numeric(hpc_target$Sub_metering_2))

hpc_target <- mutate(hpc_target, Sub_metering_3_New = as.numeric(hpc_target$Sub_metering_3))

    #make plot:

plot(hpc_target$Sub_metering_1_New~hpc_target$newdate3, type = "l", lty = 1, xlab = "", ylab = "Energy sub metering")

    #add lines

lines(hpc_target$Sub_metering_2_New~hpc_target$newdate3, type = "l", lty = 1, col = "red")

lines(hpc_target$Sub_metering_3_New~hpc_target$newdate3, type = "l", lty = 1, col = "blue")

    #add legend

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)

    #save as png:

dev.copy(png, file = "plot3.png")

dev.off()