hpcraw <- read.csv("household_power_consumption.txt",sep=";")
hpcdt <- transform(subset(hpcraw[complete.cases(hpcraw),],Date == '1/2/2007' | Date == '2/2/2007'),DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))
plot3data = hpcdt[,c("DateTime","Sub_metering_1","Sub_metering_2","Sub_metering_3")]
plot(plot3data$DateTime,plot3data$Sub_metering_1,type = "s", col="black", ylab = "Energy Sub Metering", xlab = "")
lines(plot3data$DateTime,plot3data$Sub_metering_2,type = "s", col="red")
lines(plot3data$DateTime,plot3data$Sub_metering_3,type = "s", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ), lty=1,  col = c("black","red","blue"))

dev.copy(png,'plot3.png',width = 480, height = 480)
dev.off()