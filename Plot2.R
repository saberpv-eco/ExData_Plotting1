
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
subdata1$Global_active_power <- as.numeric(subdata1$Global_active_power)

subdata1$Date <- as.Date(subdata1$Date, format ="%d/%m/%Y" )
subdata1$datetime <- as.POSIXct(paste(subdata1$Date , subdata1$Time) , format="%Y-%m-%d %H:%M:%S")

Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL", "English")
#plot
png("plot2.png" ,width = 480 , height = 480)
with(subdata1 , plot(subdata1$datetime ,subdata1$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power (kilowatts)" , main ="Global Active Power Vs Time"  ))
dev.off()



