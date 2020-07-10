## 
## required package
library(dplyr)

## download dataset
filename <- "Coursera_PAw4_Final.zip"

# Checking if archive already exists.
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists to unzip file
if (!file.exists("UCI HARUS Dataset")) { 
    unzip(filename) 
}
## separating tables with adequate column names
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Task 1: merging training and test sets
## creating one data set
## using row-bind and column-bind
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Data_Set <- cbind(Subject, Y, X)
## head(Data_Set, 15)

## Task 2: extracting only values of mean and standard deviation
## for each measurement
TidyData <- Data_Set %>% select(subject, code, contains("mean"), contains("std"))
## head(TidyData, 15)

## Task 3: rename the activities in the Data Set with descriptive names
TidyData$code <- activities[TidyData$code, 2]

## assigning descriptive variable names
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

## Task 5: From the data set in step 2, 
## creating an independent tidy data set 
## with the average of each variable for each activity and each subject
Data_Final <- TidyData %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(Data_Final, "Data_Final.txt", row.name=FALSE)

## Taking a look at the Data_Final file
str(Data_Final)
Data_Final


