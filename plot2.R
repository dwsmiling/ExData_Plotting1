
hpcraw <- read.csv("household_power_consumption.txt",sep=";")
hpcdt <- transform(subset(hpcraw[complete.cases(hpcraw),],Date == '1/2/2007' | Date == '2/2/2007'),DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S”))

y <- as.numeric(levels(hpcdt$Global_active_power)[levels(hpcdt$Global_active_power) != '?'])[hpcdt$Global_active_power]
x <- hpcdt$DateTime

plot(x,y,lines(x,y), type = "s" , xlab = " ", ylab = "Global Active Power (Kilowatts) ")

dev.copy(png,'plot2.png')
dev.off()


