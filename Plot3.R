
# create a temporary file on the local disk
tf <- tempfile()
# download data to the temporary file
download.file( "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" , tf , mode = 'wb' )

# unzip the contents 
data <- unzip( tf , exdir = tempdir() )

data1 <- read.csv(data, sep = ";")

#subset data
subdata1 <- subset(data1 , Date=="1/2/2007" | Date== "2/2/2007")
#character to numeric
subdata1$Sub_metering_1 <- as.numeric(subdata1$Sub_metering_1)
subdata1$Sub_metering_2 <- as.numeric(subdata1$Sub_metering_2)

subdata1$Date <- as.Date(subdata1$Date, format ="%d/%m/%Y" )
subdata1$datetime <- as.POSIXct(paste(subdata1$Date , subdata1$Time) , format="%Y-%m-%d %H:%M:%S")

Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL", "English")

#plot
png("plot3.png" ,width = 480 , height = 480)
with(subdata1 , plot(datetime ,Sub_metering_1 , xlab = "" , ylab = "Energy sub metering" , type = "l" ))
with(subdata1 , lines(datetime ,Sub_metering_2 , col="red" ))
with(subdata1 , lines(datetime ,Sub_metering_3 , col="blue" ))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")

dev.off()


