png(file="plot2.png",width=480,height=480)
hpcraw <- read.csv("household_power_consumption.txt",sep=";")
hpcdt <- transform(subset(hpcraw[complete.cases(hpcraw),],Date == '1/2/2007' | Date == '2/2/2007'),DateTime = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))
plot2data = hpcdt[,c("DateTime","Global_active_power")]
y <- as.numeric(levels(plot2data$Global_active_power)[levels(plot2data$Global_active_power) != '?'])[plot2data$Global_active_power]
x <- plot2data$DateTime

plot(x,y, type = "s" , xlab = " ", ylab = "Global Active Power (Kilowatts) ")
lines(x,y)

dev.off()


