## Plot2.R
## From: 2007-02-01 
##   To: 2007-02-02

library(dplyr)

setwd( "C:/Users/hankc/OneDrive/Documents/Data Science/Exploratory Data Analysis with R/week1/ExData_Plotting1/develop/ExData_Plotting1" )

## Read data
hpc  <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F) 
hpcs <- subset( hpc,  strptime( hpc$Date,  "%d/%m/%Y" ) >= strptime( "01/02/2007", "%d/%m/%Y"))
hpcs <- subset( hpcs, strptime( hpcs$Date, "%d/%m/%Y" ) <  strptime( "03/02/2007", "%d/%m/%Y"))

## Plot data
plot ( as.POSIXct( paste(hpcs$Date, hpcs$Time), format="%d/%m/%Y %H:%M:%S" ), hpcs$Global_active_power, type="n", xlab = "", ylab = "Global Active Power (kilowatts)" )
lines( as.POSIXct( paste(hpcs$Date, hpcs$Time), format="%d/%m/%Y %H:%M:%S" ), hpcs$Global_active_power )

## Output png
dev.copy(png, file = "Plot2.png")
dev.off()
