--------1---------------
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile = "C:/Sapna/Course3/USCommData.csv")

df <- read.csv("USCommData.csv")

agricultureLogical <- df$ACR==3 & df$AGS == 6
which(agricultureLogical)



-----------2---------------
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileurl, destfile = "C:/Sapna/Course3/Img1.jpeg")
jpegData <- readJPEG("Img2.jpg", native = TRUE)
n <- as.numeric(jpegData)
quantile(n, probs = c(0.3, 0.8))


-----------3-----------------
fileGDP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileGDP, destfile = "C:/Sapna/Course3/GDPfile.csv")

fileED <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileED, destfile = "C:/Sapna/Course3/EDfile.csv")

GDPData <- read.csv("GDPfile.csv", header = FALSE, dec = ",", colClasses = "character",skip=5)
GDP <- tbl_df(GDPData)
GDP <- filter(GDP, CountryCode != '' & Rank != '')


EDData <- read.csv("EDfile.csv")

