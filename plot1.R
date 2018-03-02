## Exploratory Data Analysis, Week 1, Course Project
## Graph 1 : histogram of the Global Active Power

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
feb1_2_07 <- subset(raw_data, raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02")

## Creation of Plot
hist(feb1_2_07$Global_active_power
     , main = "Global Active Power"
     , xlab="Global Active Power (kilowatts)"
     , ylab = "Frequency"
     , col = "Red")

## Save Plot using dev.copy as a png file
dev.copy(png, file = "plot1.png"
         , height = 480
         , width = 480)
dev.off()
