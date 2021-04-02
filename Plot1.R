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

#plot
png("plot1.png" ,width = 480 , height = 480)
with(subdata1 , hist(Global_active_power , col = "red" , main ="Global Active Power" , xlab = "Global Active Power (kilowatts)" ))
dev.off()







