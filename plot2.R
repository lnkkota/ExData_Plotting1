# Load the data
# The file is downloaded into the local directory named "ExploratoryDataAnalysis"
# Unzip the file  and load the file into "raw_data" variable

wd<-"C:/Users/lnkkota.Home-PC/datasciencecoursera/ExData_Plotting1"
if (!is.null(wd)) setwd(wd)

unzip("exdata-data-household_power_consumption.zip")

raw_data <- read.table("household_power_consumption.txt",sep=";",header=T,
                       stringsAsFactors = FALSE)

attach(raw_data)
names(raw_data)
head(raw_data)

startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")

#
# Filter the data to use data from the dates 2007-02-01 and 2007-02-02.
#

filtered_data<- subset(raw_data, 
                       (as.Date(raw_data$Date,format="%d/%m/%Y")>=startDate & 
                       as.Date(raw_data$Date,format="%d/%m/%Y")<=endDate))
head(filtered_data)
max(filtered_data$Global_active_power)
min(filtered_data$Global_active_power)

#
# In order to plot the time vs Global Active power, setup the timestamp data
#
# Open a graphics png device with 480 X 480 pixels. 
# Plot a time series curve for the global active power data
#

filtered_data$timestamp <- strptime(paste(filtered_data$Date,filtered_data$Time, sep=" "),
                                    format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480)
plot(filtered_data$timestamp,as.numeric(filtered_data$Global_active_power),
     main="Plot 2",
     xlab="", ylab="Global Active Power(kilowatts)", type="l",col="purple")
dev.off()