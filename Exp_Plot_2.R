library(dplyr)

#Load data
hpc = read.table("./plot 1/household_power_consumption.txt", header = TRUE, sep=";",na.strings="?",colClasses=c("character","character","double","double","double","double","double","double","numeric"))
subhpc = subset(hpc, Date=="1/2/2007" | Date == "2/2/2007")

subhpc$DateTime = paste(subhpc$Date, subhpc$Time)
subhpc$DateTime = as.POSIXlt(subhpc$DateTime,format="%d/%m/%Y %H:%M:%S")

plot(x=(subhpc$DateTime),y=subhpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()