## File: plot2.R
## Project 1, Exploratory Data Analysis

library(data.table)

# Read entire electric power consumption data file
bigdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")


# Pull subset of data based on two dates
power_data<-bigdata[bigdata$Date=="1/2/2007"|bigdata$Date=="2/2/2007",]


# Create a date/time variable for plotting against time
power_data$DateTime <- as.POSIXct(strptime(paste(power_data$Date, power_data$Time), format="%d/%m/%Y %H:%M:%S"))


# Plot global active power vs. time
par(mar=c(5,4,4,2),bg="white",cex.axis=1,cex.lab=1,cex.main=1)
plot(power_data$DateTime,power_data$Global_active_power,type="n",
     ylab="Global Active Power (kilowatts)",xlab="")
lines(power_data$DateTime,power_data$Global_active_power)


# Save the plot to a png file
dev.copy(png,"plot2.png",width=480,height=480,units="px")
dev.off()



