#Coursera- Exploratory Data Analysis
#Assignment 1- plot3
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

#re-format date and times
datetime <- strptime(paste(household_power_consumption_subset$Date, household_power_consumption_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Convert data in these columns from factors to numeric 
household_power_consumption_subset$Sub_metering_2 <- as.numeric(as.character(household_power_consumption_subset$Sub_metering_2))
household_power_consumption_subset$Sub_metering_1 <- as.numeric(as.character(household_power_consumption_subset$Sub_metering_1))

#Create line plot. Adding data from each column one at a time
plot(datetime, household_power_consumption_subset$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering",col="black",ylim=c(0,40))
     par(new=TRUE)
plot(datetime, household_power_consumption_subset$Sub_metering_2, type="l", 
     xlab="", ylab="",col="red",ylim=c(0,40))
     par(new=TRUE)
plot(datetime, household_power_consumption_subset$Sub_metering_3, type="l", 
     xlab="", ylab="",col="blue",ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
     lty=1,col=c("black","red","blue"))

#Save the plot in working directory as a png
dev.copy(png, 'plot3.png', width = 480, height = 480, units = "px")
dev.off()






