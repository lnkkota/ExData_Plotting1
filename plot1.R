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
# Open a graphics png device with 480 X 480 pixels. 
# Plot a histogram for the Global Active Power 
#

png(filename="plot1.png", width=480, height=480)
hist(as.numeric(filtered_data$Global_active_power),main="Plot 1 - Global Active Power",
     xlab="Global Active Power(kilowatts)", col="red")
dev.off()