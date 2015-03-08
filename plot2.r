plot2 <- function () {
  #Assumes that household_power_consumption.txt file is in the working directory
  #Read household_power_consumption.txt file into table stating the separator as ; and missing values are coded as ?
  hpc_data <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
  
  #Subset data from the dates 2007-02-01 and 2007-02-02.
  hpc_data_s <- hpc_data[(hpc_data$Date=="1/2/2007"|hpc_data$Date=="2/2/2007"),]
  
  #Create a new column name DateTime where the date and time values are combined to make up the content for that column
  hpc_data_s$DateTime <- strptime(paste(hpc_data_s$Date,hpc_data_s$Time),"%d/%m/%Y %H:%M:%S")
  
  #Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
  png(file="plot2.png", width = 480, height = 480, units = "px")
  with(hpc_data_s, plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
  dev.off()
}