# Coursera Getting and Cleanning Data Course Project

##Introduction
This repository contains my work for the Coursera Data Science: Getting and Cleaning Data course.

##About the Data
The raw data can be found in the x_test.txt file. This file does not contain headers or descriptors for the data. The y_test.txt file contains activity labels and the subject_test.txt file contains the test subjects. 

There is test data and training data. The training data files have the same structure as the test data files. 

##About the code
The run_analysis.R code will merge the testing and training sets to create one tidy data set by completing the following steps:
*Step 1: Merges the training and the test sets to create one data set.
*Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
*Step 3: Uses descriptive activity names to name the activities in the data set
*Step 4: Appropriately labels the data set with descriptive variable names. 
*Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The final tidy data set is contains in the "tidy_summary_data_file.txt" file.
