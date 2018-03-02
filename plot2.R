## Exploratory Data Analysis, Week 1, Course Project
## Graph 2 : Line Type Plot of the Global Active Power in function of the "Date_Time"

## Set the working directory:
setwd("C:/Users/geo/Desktop/Jeff/Coursera/Exploratory_Data_Analysis/Week1/exdata_data_household_power_consumption/")

## Setting of Libraries:
library(data.table)
library(dplyr)

## Creation of Data Table using the read.csv function:
raw_data <- data.table(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                                na.strings = "?"))

## Use of as.Date to change the format date colum to: yyyy-mm-dd, per the instructions
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")

## Creation of Data Table (feb1_2_07) which only has the obeservations for Feb 1, 2007 and Feb 2, 2007.
## New Data Table (feb1_2_07) has only 2880 observations and the 9 columns

feb1_2_07 <- subset(raw_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Creation of new column in "feb1_2_07 which combines the $Date & $Time Columns
## and sets them to proper Date/Time Format using asPOSIXct
Date_Time <- paste(as.Date(feb1_2_07$Date), feb1_2_07$Time)
feb1_2_07$Date_Time <- as.POSIXct(Date_Time)

## "Deletes" the columns "$Date" and "$Time" from the data table "feb1_2_07
feb1_2_07$Date = NULL
feb1_2_07$Time = NULL


## Creation of Line Plot using "$Global_active_power" through the function of "$Date_Time":
plot(feb1_2_07$Global_active_power ~ feb1_2_07$Date_Time 
     ,xlab = "" 
     ,ylab = "Global Active Power (kilowatts)"
     ,type = "l")
     
## Save Plot using dev.copy as a png file
dev.copy(png, file = "plot2.png"
         , height = 480
         , width = 480)
dev.off
