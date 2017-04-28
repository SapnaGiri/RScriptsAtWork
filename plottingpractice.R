library(dplyr)

#read data
df <- read.csv("Payments.csv", header=T, dec=".")

#subset new york data
dfNY <- subset(df, Provider.State=='NY')

#plot1
pdf("plot1.pdf")
plot(dfNY$Average.Covered.Charges, dfNY$Average.Total.Payments, 
	xlab="Average.Covered.Charges", ylab="Average.Total.Payments", 
	main="Mean.Covered.Charges Vs Mean.Total.Payments for New York")
dev.off()


#plot2
states <- unique(as.character(df$Provider.State))
mcond <- unique(as.character(df$DRG.Definition))
color <- c("red", "green", "blue", "black", "yellow", "orange")

s <- length(states)
m <- length(mcond)

pdf("plot2.pdf",width=12, height=7)
par(mfrow = c(2,3), mar=(c(4,4,2,1)))

for(i in 1:m){
	for(j in 1:s){
		dfsub <- subset(df, Provider.State == states[j] & DRG.Definition == mcond[i])

		if(nrow(dfsub) > 0){
			if(j==1){
				plot(dfsub$Average.Covered.Charges, dfsub$Average.Total.Payments, main=mcond[i], 
					xlab="", ylab="", col=color[j],
					xlim=c(min(df$Average.Covered.Charges), max(df$Average.Total.Payments)),
					ylim=c(min(df$Average.Total.Payments), max(df$Average.Total.Payments)),
					cex.main=0.9, cex.labs=0.8)
				
			}
			else{
				points(dfsub$Average.Covered.Charges, dfsub$Average.Total.Payments, col=color[j])
			}
		}
		
		if(i==1){
			legend("topright", pch=1, col=color, legend=states)
			title(xlab="Mean Covered Charges", ylab="Mean Total Payments")
		}
	}
}
dev.off()




