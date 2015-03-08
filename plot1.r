plot1 <- function () {
  #Assumes that household_power_consumption.txt file is in the working directory
  #Read household_power_consumption.txt file into table stating the separator as ; and missing values are coded as ?
  hpc_data <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
  
  #Subset data from the dates 2007-02-01 and 2007-02-02.
  hpc_data_s <- hpc_data[(hpc_data$Date=="1/2/2007"|hpc_data$Date=="2/2/2007"),]
  
  #Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
  png(file="plot1.png", width = 480, height = 480, units = "px")
  hist(hpc_data_s$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
}