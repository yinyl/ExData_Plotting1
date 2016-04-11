#Load data
hpc = read.table("./plot 1/household_power_consumption.txt", header = TRUE, sep=";",na.strings="?",colClasses=c("character","character","double","double","double","double","double","double","numeric"))

#plot 1
subhpc = subset(hpc, Date=="1/2/2007" | Date == "2/2/2007")

hist(as.numeric(as.character(subhpc$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency", col="red", xlim = c(0,6), axes = F)
axis(side = 1, at = c(0,2,4,6))
axis(side = 2, at = c(0, 200, 400, 600, 800, 1000, 1200))
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()


