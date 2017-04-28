pollutantmean <- function(directory, pollutant, id = 1:332){

	files <- list.files(path = directory, pattern = ".csv")
	
	idstart <- id[1]
	
	if(length(id)>1){
		idsecond <- id[2]
		idlast <- id[length(id)]
	}
	else{
		idsecond <- id[1]
		idlast <- id[length(id)]
	}
		

	specdata <- read.csv(paste(directory, "/", files[[idstart]], sep = ""))
	
	for(f in files[idsecond:idlast])
	{
		temp <- read.csv(paste(directory, "/", f, sep = ""))
		specdata <- rbind(specdata, temp)		

	}
	
	mean(specdata[,c(pollutant)], na.rm = TRUE)
	
	
}