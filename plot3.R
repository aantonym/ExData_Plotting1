
plot3 <- function() {
  
  #Check if file exists in current directory, if no exit with error
  
  inputfile <- "household_power_consumption.txt"
  
  if(!(file.exists(inputfile))) return("Input file is missing")
  
  #Read 2 days data
  
  dailydata <- read.delim(inputfile,skip = 66637, nrows = 2881, sep = ";", header = FALSE)
  
  #Add reasonable headers
  
  names(dailydata) <- c("Date","Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  
  #Create the output file, plot points, close file
  png("plot3.png", width = 480, height = 480, units = "px")
  #Create graph and plot first line
  plot(dailydata$Sub_metering_1, type = "l", xaxt = "n", ylab = "Energy Sub Metering", xlab = "", col = "black")
  #Add second line
  lines(dailydata$Sub_metering_2, type = "l", col = "red")
  #Add third line
  lines(dailydata$Sub_metering_3, type = "l", col = "blue")
  #Create Axis
  axis(1, at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
  #Create legend
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.8)
  dev.off()
  
}