#Coursera- Exploratory Data Analysis
#Assignment 1- plot1
#Rhiannon Wallace
#December 7, 2019

setwd("C:/Users/u1069350/Desktop/Coursera/Exploratory Data Analysis")

#Download zip file here and save manually in Coursera folder

#Import data into R
household_power_consumption <- read.csv("C:/Users/u1069350/Desktop/Coursera/Exploratory Data Analysis/household_power_consumption.txt", 
                                        sep=";")

#Check the class of the Date and Time columns
class(household_power_consumption$Date)
class(household_power_consumption$Time)

#To change the Date column from class = factor to class = date
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

#To change Time to date/time class
household_power_consumption$Time <- strptime(household_power_consumption$Time, "%H:%M:%S")

#Subset the dataset to the dates of interest only
household_power_subset <- subset(household_power_consumption, Date >= "2007/02/01" & Date <= "2007/02/02")

#Create new dataframe of the power data
power <- household_power_subset$Global_active_power

final <- as.numeric(as.character(power))

#Plot a histogram of Global Active Power
hist(final, main = "Global Active Power", 
                     xlab = "Global Active Power (kilowatts)",  
                     col = "red")

#Save the plot in working directory as a png
dev.copy(png, 'plot1.png', width = 480, height = 480, units = "px")
dev.off()





     
     
     
     
     