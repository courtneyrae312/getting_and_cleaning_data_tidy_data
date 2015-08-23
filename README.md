# getting_and_cleaning_data_tidy_data
Coursera Getting and Cleanning Data Course Project

##Performs the steps for completing Coursera Getting & Cleaning Data Course Project

##Step 1: Merges the training and the test sets to create one data set.

	##first pull in all test set files as tables
	##combine activities and results into a single table and rename columns
	##repeat the same steps used for creating test_results table for the training data
	##merge the training and test datasets together

##Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

	## Read in column names from the features document
	## Identify column names representing means and stds
	##select required columns from the dataset

##Step 3: Uses descriptive activity names to name the activities in the data set

	##read in the activity lables from the provided text file
	##replace acitivity ids with the activity name

##Step 4: Appropriately labels the data set with descriptive variable names. 

	##select the column names from the previously determined columns contains mean and std data (identified in step 2)
	##assign column header names to appropriate column

##Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	#aggregate the data by activity and subject id and then take the mean


##Write data to file "tidy_summary_data_file.txt"
