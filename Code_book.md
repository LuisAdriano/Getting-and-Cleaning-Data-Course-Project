---
title: "GCD-CP-CB"
author: "lamcd"
date: "10/07/2020"
output: pdf_document
---

CODE BOOK for Getting and Cleaning Data Course Project
submitted by LAMCD
The code contained in run_analysis.R script executes the data preparation and the 5 steps required in the course project instructions.
1. Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset
2. Assign each data to variables
  features <- features.txt : 561 rows, 2 columns
	The features selected: accelerometer and gyroscope 3-axial
	(raw signals tAcc-XYZ and tGyro-XYZ).
  activities <- activity_labels.txt : 6 rows, 2 columns
3. List of activities performed when the corresponding measurements were 	taken and its codes (labels)
  subject_test <- test/subject_test.txt : 2947 rows, 1 column
  contains test data of 9/30 volunteer test subjects being observed
  x_test <- test/X_test.txt : 2947 rows, 561 columns
  contains recorded features test data
  y_test <- test/y_test.txt : 2947 rows, 1 columns
  contains test data of activities’code labels
  subject_train <- test/subject_train.txt : 7352 rows, 1 column
  contains train data of 21/30 volunteer subjects being observed
  x_train <- test/X_train.txt : 7352 rows, 561 columns
  contains recorded features train data
  y_train <- test/y_train.txt : 7352 rows, 1 columns
  contains train data of activities code labels
4. Merges the training and the test sets to create one data set (Task 1)
  X (10299 rows, 561 columns) is created by merging x_train and x_test using 	rbind() function
   Y (10299 rows, 1 column) is created by merging y_train and y_test using 	rbind() function
   Subject (10299 rows, 1 column) is created by merging subject_train and 	subject_test using rbind() function
   Data_Set (10299 rows, 563 column) is created by merging Subject, Y 	and X using cbind() function
5. Extracts only the measurements on the mean and standard deviation for 	each measurement (Task 2)
   TidyData (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the
   measurements on the mean and standard deviation (std) for each measurement
6. Uses descriptive activity names to the activities in the data set (Task 3)
   Entire numbers in code column of the TidyData replaced with 	corresponding activity taken from second column of the activities
   variable.
7. Appropriately labels the data set with descriptive variable names (Task 4)
   code in TidyData renamed into activities
   All Acc replaced by Accelerometer
   All Gyro replaced by Gyroscope
   All BodyBody replaced by Body
   All Mag replaced by Magnitude
   All start with character f replaced by Frequency
   All start with character t replaced by Time
8. From the data set in step 7 creates an independent tidy data set with the average of each variable for each activity and each
   subject (Task 5).
9. Data_Final (180 rows, 88 columns) is created by sumarizing TidyData 	taking the means of each variable for each activity and
   each subject, 	after groupped by subject and activity.
10. Export Data_Final into Data_Final.txt file.
