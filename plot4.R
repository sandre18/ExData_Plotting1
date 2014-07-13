##Sets working directory to forked repository
setwd("C:/Users/SeanTA/SkyDrive/School/Data Science/datasciencecoursera/ExData_Plotting1")

##Reads in the power consumption data
household_power_consumption <- read.csv("C:/Users/SeanTA/SkyDrive/School/Data Science/Getting and Cleaning Data/household_power_consumption.txt", sep=";", na.strings="?")

##Reformats the "Date" variable to as.Date object type
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

##Combines Date and Time data into a single DateTime variable with POSIXct object type
household_power_consumption$DateTime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), "%Y/%m/%d %H:%M:%S")

##Subsets out the data from just 2007-02-01 and 2007-02-02
powersub <- subset(household_power_consumption, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02")

#Draws all plots
par(mfrow = c(2,2))
plot(powersub$DateTime, powersub$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(powersub$DateTime, powersub$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(powersub$DateTime, powersub$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(powersub$DateTime, powersub$Sub_metering_1)
lines(powersub$DateTime, powersub$Sub_metering_2, col = "red")
lines(powersub$DateTime, powersub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue"))
plot(powersub$DateTime, powersub$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

##Saves .png file
dev.copy(png, file = "plot4.png")
dev.off()