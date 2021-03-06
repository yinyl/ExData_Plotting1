library(dplyr)

#Load data
hpc = read.table("./plot 1/household_power_consumption.txt", header = TRUE, sep=";",na.strings="?",colClasses=c("character","character","double","double","double","double","double","double","numeric"))
subhpc = subset(hpc, Date=="1/2/2007" | Date == "2/2/2007")

subhpc$DateTime = paste(subhpc$Date, subhpc$Time)
subhpc$DateTime = as.POSIXlt(subhpc$DateTime,format="%d/%m/%Y %H:%M:%S")

plot(x=(subhpc$DateTime),y=subhpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(subhpc$DateTime),y=subhpc$Sub_metering_2,col="red")
lines(x=(subhpc$DateTime),y=subhpc$Sub_metering_3,col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()