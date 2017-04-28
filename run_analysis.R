features <- read.table("UCI HAR Dataset/features.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity <- as.character(activity_labels$V2)



#Train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- c("subject")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
activity_train <- data.frame(activity = activity[y_train$V1])

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
names(X_train) <- features$V2

traindata <- cbind(subject_train, activity_train, X_train)


#Test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- c("subject")

y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
activity_test <- data.frame(activity = activity[y_test$V1])

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
names(X_test) <- features$V2

testdata <- cbind(subject_test, activity_test, X_test)


#1.Merging the training and the test sets to create one data set.
alldata <- rbind(traindata,testdata)


# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
alldatacolumns <- names(alldata)

meansdcolumns <- grep("std()|mean()", alldatacolumns, value = T)










