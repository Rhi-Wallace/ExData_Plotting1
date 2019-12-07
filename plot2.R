#Coursera- Exploratory Data Analysis
#Assignment 1- plot2
#Rhiannon Wallace
#December 7, 2019
library(dplyr)
setwd("C:/Users/u1069350/Desktop/Coursera/Exploratory Data Analysis")

#Download zip file here and save manually in Coursera folder

#Import data into R
household_power_consumption <- read.table("C:/Users/u1069350/Desktop/Coursera/Exploratory Data Analysis/household_power_consumption.txt",header=TRUE,sep=";")
household_power_consumption <- tbl_df(household_power_consumption)

#Subset the dataset to the dates of interest only
household_power_consumption_subset <-subset(household_power_consumption,household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007")

#Seperate Global pwer data into new dataframe
power <- household_power_consumption_subset$Global_active_power

#Convert to numeric data
final <- as.numeric(as.character(power))

#Info on where to save the plot
png("plot2.png", width=480, height=480, units = "px")

#re-format date and times
datetime <- strptime(paste(household_power_consumption_subset$Date, household_power_consumption_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, final, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()




