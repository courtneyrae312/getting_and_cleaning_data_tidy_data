##run_analysis.R

##Performs the steps for completing Coursera Getting & Cleaning Data Course Project

##################################################################STEP 1 ################################################
##Step 1: Merges the training and the test sets to create one data set.

##first pull in all test set files as tables
test_subject_ids <- read.table("test/subject_test.txt")
test_activities <- read.table("test/y_test.txt")
test_results <- read.table ("test/X_test.txt")

##combine activities and results into a single table and rename columns
test_table <-cbind(test_activities, test_results)
colnames(test_table)[1] <- "activity"
test_table <-cbind(test_subject_ids, test_table)
colnames(test_table)[1] <- "subjectid"


##repeat the same steps used for creating test_results table for the training data

training_subject_ids <- read.table("train/subject_train.txt")
training_activities <- read.table("train/y_train.txt")
training_results <- read.table ("train/X_train.txt")

training_table <-cbind(training_activities, training_results)
colnames(training_table)[1] <- "activity"
training_table <-cbind(training_subject_ids, training_table)
colnames(training_table)[1] <- "subjectid"

##merge the training and test datasets together
merged_data <-rbind(test_table, training_table)

##sort data in a logical way
##sorted by subject id and activity
merged_data <-merged_data[order(merged_data$subjectid, merged_data$activity), ]

##################################################################STEP 2 ################################################
##Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

## Read in column names from the features document
features <- read.table ("features.txt")

## Identify column names representing means and stds
mean_std_columns <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
mean_std_column_nums <- mean_std_columns$V1

# Select the columns required for the dataset
## Required to add two to the mean_std_column_nums to account for the first two columns
columns_needed <-c(1,2, mean_std_column_nums+2) ##need to add back in 1 and 2 to account for subjectid and activity rows

##select required columns from the dataset
mean_std_data <- merged_data[ , columns_needed]

##################################################################STEP 3 ################################################
##Step 3: Uses descriptive activity names to name the activities in the data set

##read in the activity lables from the provided text file
activity_label <- read.table("activity_labels.txt")

##replace acitivity ids with the activity 
mean_std_data$activity <- activity_label[mean_std_data$activity, 2]

##################################################################STEP 4 ################################################
##Step 4: Appropriately labels the data set with descriptive variable names. 

##select the column names from the previously determined columns contains mean and std data (identified in step 2)
mean_std_columns_names <- mean_std_columns$V2

##convert to a vector
mean_std_columns_names_vector <- as.character(mean_std_columns_names)


##assign column header names to appropriate column
colnames(mean_std_data) <- c("subjectid", "activity", mean_std_columns_names_vector ) ####ERROR HERE - need to figure out

##################################################################STEP 5 ################################################
##Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#aggregate the data by activity and subject id and then take the mean
summary_data <- aggregate(mean_std_data[ , 3:ncol(mean_std_data)], by =list(subjectid = mean_std_data$subjectid, activity = mean_std_data$activity), mean)

##########################################################################################################################

##Write data to file
write.table(summary_data, "tidy_summary_data_file", row.name = FALSE)

