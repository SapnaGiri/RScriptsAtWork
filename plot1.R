remove(list=ls())
library(dplyr)

df <- read.table("household_power_consumption.txt",header=TRUE, sep=";", dec=".", na.strings = "?")

df1 <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')

Date1 <- as.Date(df1$Date)

Time1 <- strptime(df1$Time, '%H:%M:%S')

df2 <- select(df1, -(Date:Time))

data <- cbind(Date1, Time1, df2)

hist(data$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, "plot1.png")
dev.off()
