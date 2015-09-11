## File: plot4.R
## Project 1, Exploratory Data Analysis

library(data.table)

# Read entire electric power consumption data file
bigdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")


# Pull subset of data based on two dates
power_data<-bigdata[bigdata$Date=="1/2/2007"|bigdata$Date=="2/2/2007",]


# Create a date/time variable for plotting against time
power_data$DateTime <- as.POSIXct(strptime(paste(power_data$Date, power_data$Time), format="%d/%m/%Y %H:%M:%S"))


# Create a 2 x 2 panel plot
par(mfrow=c(2,2),bg="white",cex.axis=0.9,cex.lab=0.9)

# Upper left plot -- global active power vs. time
plot(power_data$DateTime,power_data$Global_active_power,type="n",
     ylab="Global Active Power",xlab="")
lines(power_data$DateTime,power_data$Global_active_power)


# Upper right plot -- voltage vs. time
plot(power_data$DateTime,power_data$Voltage,type="n",
     ylab="Voltage",xlab="datetime")
lines(power_data$DateTime,power_data$Voltage)


# Lower left plot -- three sub metering variables vs. time
plot(power_data$DateTime,power_data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(power_data$DateTime,power_data$Sub_metering_1,col="black")
lines(power_data$DateTime,power_data$Sub_metering_2,col="red")
lines(power_data$DateTime,power_data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, 
       col=c("black","red","blue"),bty="n",cex=0.8)

# Lower right plot -- global reactive power vs. time
plot(power_data$DateTime,power_data$Global_reactive_power,type="n",
     ylab="Global_reactive_power",xlab="datetime")
lines(power_data$DateTime,power_data$Global_reactive_power)


# Save the plot to a png file
dev.copy(png,"plot4.png",width=480,height=480,units="px")
dev.off()









