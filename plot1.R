
plot1 <- function() {
  
  #Check if file exists in current directory, if no exit with error
  
  inputfile <- "household_power_consumption.txt"
  
  if(!(file.exists(inputfile))) return("Input file is missing")
  
  #Read 2 days data
  
  dailydata <- read.delim(inputfile,skip = 66637, nrows = 2880, sep = ";", header = FALSE)
  
  #Add reasonable headers
  
  names(dailydata) <- c("Date","Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

  #Create the output file, plot histogram, close file
  png("plot1.png", width = 480, height = 480, units = "px")
  hist(dailydata$Global_active_power, col ="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
  
  }