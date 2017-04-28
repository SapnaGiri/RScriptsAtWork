---------1---------------------
myapp <- oauth_app("github", 
		key = "8da79b0bd22fc13417e1", 
		secret = "0b0bf628c5d4b7a4841956584f7e1785cf405948")


github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)

req <- GET("url here", gtoken)
stop_for_status(req)

myjson <- content(req)
myjson2 <- jsonlite :: fromJSON(toJSON(myjson))

df <- as.data.frame(myjson2)
names(df)

df1<- select(df,name,created_at)
filter(df1, name == "datasharing")


--------------2-----------------
install.packages("sqldf")
library(sqldf)

filename <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

download.file(filename, destfile ="C:/Sapna/USComData.csv")
acs <- read.csv("USComData.csv")

------4-----------
con <- url("xxx.html")
htmlCode <- readLines(con)
close(con)

h <- html[c(10,20,30,100)]
nchar(h)

--------------5-----------------
file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
