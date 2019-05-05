
plot4 <- function() {
  
  #Check if file exists in current directory, if no exit with error
  
  inputfile <- "household_power_consumption.txt"
  
  if(!(file.exists(inputfile))) return("Input file is missing")
  
  #Read 2 days data
  
  dailydata <- read.delim(inputfile,skip = 66637, nrows = 2881, sep = ";", header = FALSE)
  
  #Add reasonable headers
  
  names(dailydata) <- c("Date","Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  #Create the output file, plot points, close file
  png("plot4.png", width = 480, height = 480, units = "px")
  par(mfrow=c(2,2))
  #First plot
  plot(dailydata$Global_active_power, type = "l", xaxt = "n", ylab = "Global Active Power", xlab = "")
  axis(1, at=c(0,1440,2880),labels=c("Thursday", "Friday", "Saturday"))
  #Second Plot
  plot(dailydata$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
  axis(1, at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
  #Third Plot
  plot(dailydata$Sub_metering_1, type = "l", xaxt = "n", ylab = "Energy sub metering", xlab = "", col = "black")
  lines(dailydata$Sub_metering_2, type = "l", col = "red")
  lines(dailydata$Sub_metering_3, type = "l", col = "blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.8, box.lty = 0, bg = "transparent")
  axis(1, at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
  #Fourth Plot
  plot(dailydata$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
  axis(1, at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
  dev.off()
  
}