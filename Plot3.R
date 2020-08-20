## Plot3.R
## From: 2007-02-01 
##   To: 2007-02-02

library(dplyr)

setwd( "C:/Users/hankc/OneDrive/Documents/Data Science/Exploratory Data Analysis with R/week1/ExData_Plotting1/develop/ExData_Plotting1" )

## Read data
hpc  <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F) 
hpcs <- subset( hpc,  strptime( hpc$Date , "%d/%m/%Y" ) >= strptime( "01/02/2007", "%d/%m/%Y" ))
hpcs <- subset( hpcs, strptime( hpcs$Date, "%d/%m/%Y" ) <  strptime( "03/02/2007", "%d/%m/%Y" ))

## Plot data
plot( as.POSIXct ( paste(hpcs$Date, hpcs$Time), format="%d/%m/%Y %H:%M:%S"), hpcs$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="n",  )
lines( as.POSIXct( paste(hpcs$Date, hpcs$Time), format="%d/%m/%Y %H:%M:%S"), hpcs$Sub_metering_1, col = "black" )
lines( as.POSIXct( paste(hpcs$Date, hpcs$Time), format="%d/%m/%Y %H:%M:%S"), hpcs$Sub_metering_2, col = "red"   )
lines( as.POSIXct( paste(hpcs$Date, hpcs$Time), format="%d/%m/%Y %H:%M:%S"), hpcs$Sub_metering_3, col = "blue"  )
legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Output png
dev.copy(png, file = "Plot3.png")
dev.off()
