#Exploratory Data Analysis Project 1

#Plot 2

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

    #convert to numeric:

hpc_target <- mutate(hpc_target, Global_active_power2 = as.numeric(hpc_target$Global_active_power))

    #make plot

plot(hpc_target$Global_active_power2~hpc_target$newdate3, type = "l", lty = 1, xlab = "", ylab = "Global Active Power (Kilowatts)")

    #save as png:

dev.copy(png, file = "plot2.png")

dev.off()