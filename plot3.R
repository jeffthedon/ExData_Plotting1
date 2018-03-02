## Exploratory Data Analysis, Week 1, Course Project
## Graph 3 : Line Type Plot of the Sub_Metering in function of the "Date_Time"

## Set the working directory:
setwd("C:/Users/geo/Desktop/Jeff/Coursera/Exploratory_Data_Analysis/Week1/exdata_data_household_power_consumption/")

## Setting of Libraries:
library(data.table)
library(dplyr)

## Creation of Data Table using the read.csv function:
raw_data <- data.table(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                                na.strings = "?"))

## Use of as.Date to change the format date column to: yyyy-mm-dd, per the instructions
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")

## Creation of Data Table (feb1_2_07) which only has the obeservations for Feb 1, 2007 and Feb 2, 2007.
## New Data Table (feb1_2_07) has only 2880 observations and the 9 columns

feb1_2_07 <- subset(raw_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
## Creation of new column in "feb1_2_07 which combines the $Date & $Time Columns
## and sets them to proper Date/Time Format using asPOSIXct
feb1_2_07$Date_Time <- paste(as.Date(feb1_2_07$Date), feb1_2_07$Time)
feb1_2_07$Date_Time <- as.POSIXct(Date_Time)
## Convert Factor Columns $Sub_metering_1 : $Sub_metering_3 into Numeric Types using "as.numeric" and naming them as meter1, meter2, meter3
feb1_2_07$Sub_metering_1 <- as.numeric(as.character(feb1_2_07$Sub_metering_1))
feb1_2_07$Sub_metering_2 <- as.numeric(as.character(feb1_2_07$Sub_metering_2))
feb1_2_07$Sub_metering_3 <- as.numeric(as.character(feb1_2_07$Sub_metering_3))

## Creation of Line Plot using $Energy Sub Metering through the function of "Date_Time"
with(feb1_2_07, plot(x = Date_Time
                     , y = Sub_metering_1
                     , xlab = ""
                     , ylab = "Energy sub metering"
                     , type = "l"))
## Add Line Segments connected to the above plot:
with(feb1_2_07, lines(x = Date_Time
                     , y = Sub_metering_2
                     , col = "red"
                     , type = "l"))
with(feb1_2_07, lines(x = Date_Time
                     , y = Sub_metering_3
                     , col = "blue"
                     , type = "l"))
## Adding the legend to the plot with specified colors, line type and line width parameters:
legend("topright"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col = c("black", "red", "blue")
       , lty = 1
       , cex = .66)
## Save Plot using dev.copy as a png file
dev.copy(png, file = "plot3.png"
         , height = 480
         , width = 480)
dev.off