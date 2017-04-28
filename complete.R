complete <- function(directory = "specdata", id = 1:332){

	files <- list.files(path = directory, pattern = ".csv")	
	
	completecasescount <- data.frame(matrix(nrow = 0, ncol = 2))
	colnames(completecasescount) <- c('id','nobs')
	
	j <- 1
	
	for(i in id){
		tempdata <- read.csv(paste(directory,"/",files[i],sep = ""))
		
		compcasecount <- sum(complete.cases(tempdata))
		completecasescount[j,] <- list(i,compcasecount)
		j <- j+1
	}
	
	completecasescount
	
}