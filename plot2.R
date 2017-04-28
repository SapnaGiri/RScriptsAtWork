remove(list=ls())
library(dplyr)

df <- read.table("household_power_consumption.txt",header=TRUE, sep=";", dec=".", na.strings = "?")

df1 <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')

DateTime <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")

df2 <- select(df1, -(Date:Time))

data <- cbind(DateTime, df2)

plot(data$DateTime, data$Global_active_power, type="l", ann=F)
title(ylab="Global Active Power (kilowatts)")

dev.copy(png, "plot2.png")
dev.off()
