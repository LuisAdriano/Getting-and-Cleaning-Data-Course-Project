
Getting and Cleaning Data Course Project
Peer-graded Assignment - guide to files

The repo has the submission of Luís Adriano Domingues for Getting and Cleaning Data course project. 
It has the general description on how the analysis on Human Activity Recognition (HAR) dataset was performed.

CodeBook.md is a code book that describes "the variables, the data, and any transformations or work performed to clean up the data"

run_analysis.R performs the data preparation and then followed by the 5 steps required as described in the course project’s definition:
	Load required package (dplyr)
	Download the file DataSet.zip to Coursera_PAw4_Final.zip (Program Assignment week 4 Final)
	Unzip file - to UCI HAR DataSet.
	Separates tables assigning descriptive names.
        Merges the training and the test sets creating one data set (Data_Set) - Task 1.
        Extracts only the measurements on the mean and standard deviation for each measurement (-> TidyData) - Task 2.
        Assigns descriptive activity names to name the activities in the data set - Task 3.
	Assigns descriptive variable names - Task 4.
        From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject (data_Final) - Task 5.

Data_Final.txt is the exported final data after going through all the sequences described above.




