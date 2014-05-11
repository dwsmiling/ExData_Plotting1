png(file="plot4.png",width=480,height=480)
hpcraw <- read.csv("household_power_consumption.txt", sep=";")
hpcdt <- transform(subset(hpcraw[complete.cases(hpcraw),],Date == '1/2/2007' | Date == '2/2/2007'),DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))
fig1data = hpcdt[,c("DateTime","Global_active_power")]
fig2data = hpcdt[,c("DateTime","Voltage")]
plot3data = hpcdt[,c("DateTime","Sub_metering_1","Sub_metering_2","Sub_metering_3")]
fig4data = hpcdt[,c("DateTime","Global_reactive_power")]

par(mfrow = c(2,2))

x <- fig1data$DateTime
y <- fig1data$Global_active_power
plot(x,y,type = "l", col="black", ylab = "Global Active Power", xlab = "")
lines(x,y)

x2 <- fig2data$DateTime
y2 <- fig2data$Voltage
plot(x2, y2, type = "l", col="black", xlab="", ylab = "Voltage")
lines(x2,y2)

plot(plot3data$DateTime,plot3data$Sub_metering_1,type = "l", col="black", xlab="", ylab = "Energy Sub Metering")
lines(plot3data$DateTime,plot3data$Sub_metering_1,type = "l", col="black")
lines(plot3data$DateTime,plot3data$Sub_metering_2,type = "l", col="red")
lines(plot3data$DateTime,plot3data$Sub_metering_3,type = "l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ), lty=1,  col = c("black","red","blue"))

x4 <- fig4data$DateTime
y4 <- fig4data$Global_reactive_power
plot(x4,y4,type = "l", col="black", ylab = "Global_reactive_power", xlab = "")
lines(x4,y4)

dev.off()