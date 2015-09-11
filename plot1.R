## File: plot1.R
## Project 1, Exploratory Data Analysis

library(data.table)

# Read entire electric power consumption data file
bigdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# Pull subset of data based on two dates
power_data<-bigdata[bigdata$Date=="1/2/2007"|bigdata$Date=="2/2/2007",]

# Create a histogram for global active power
par(mar=c(5,4,4,2),bg="white",cex.axis=1,cex.lab=1,cex.main=1)
hist(power_data$Global_active_power,col="red",
   xlab="Global Active Power (kilowatts)",main="Global Active Power")

# Save the plot to a png file
dev.copy(png,"plot1.png",width=480,height=480,units="px")
dev.off()

