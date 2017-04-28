remove(list=ls())
library(dplyr)

df <- read.table("household_power_consumption.txt",header=TRUE, sep=";", dec=".", na.strings = "?")

df1 <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')

DateTime <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")

df2 <- select(df1, -(Date:Time))

data <- cbind(DateTime, df2)

par(mfrow = c(2,2), mar=c(2,6,1,1), pin=c(2.4,2.0))
plot(data$DateTime, data$Global_active_power, type='l', ylab="Global Active Power", xlab="")
plot(data$DateTime, data$Voltage, type='l', ylab="Voltage", xlab="datetime")


plot(data$DateTime, data$Sub_metering_1, type='l', ann=F)
lines(data$DateTime, data$Sub_metering_2, type='l', col='red')
lines(data$DateTime, data$Sub_metering_3, type='l', col='blue')
title(ylab='Energy sub metering')
legend('topright', col=c('black','red','blue'), 
	legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
	lty=1, bty="n")

plot(data$DateTime, data$Global_reactive_power, type='l', ylab="Global_reactive_power", xlab="datetime")


dev.copy(png, "plot4.png")
dev.off()
