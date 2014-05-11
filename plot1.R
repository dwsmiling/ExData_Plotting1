hpcraw <- read.csv("household_power_consumption.txt", sep=";")
hpcdt <- transform(subset(hpcraw[complete.cases(hpcraw),],Date == '1/2/2007' | Date == '2/2/2007'),DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

hist(as.numeric(levels(hpcdt$Global_active_power)[levels(hpcdt$Global_active_power) != '?'])[hpcdt$Global_active_power],col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.copy(png,'plot1.png', width = 480, height = 480, units = "px")
dev.off()