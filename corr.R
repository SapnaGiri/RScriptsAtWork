corr <- function(directory , threshold =0){
	
	
	files <- list.files(path = directory, pattern = ".csv")
	
	corvector <- numeric(0)
	
	j <- 1
	
	for(f in files){
		tempdata <-  read.csv(paste(directory,"/",f, sep = ""))
		
		compcasescount <- sum(complete.cases(tempdata))

		if(compcasescount > threshold){
			sulfatevector <- tempdata[,c("sulfate")]
			nitratevector <- tempdata[,c("nitrate")]

			corvector[j] <- cor(sulfatevector, nitratevector, use = 'pairwise.complete.obs')
			j <- j+1
		}
		
	}

	corvector
	

}