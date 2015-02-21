## run_analysis.R

# The goal of this R script is to prepare tidy data that can be used for later 
# analysis as per the instructions of the Getting and Cleaning Data Course 
# Project instructions. The steps taken to produce the final tidy data set 
# are listed below from A.1 to B.7.

# The Codebook that has a further information about the variables in the final
# tidy data set created by this script can be downloaded here:
codebook_URL <- "https://github.com/mashoedoe/Getting_and_Cleaning_Data/CodeBook.md"

# The ReadME file describing how this script works can be downloaded here:
ReadME_URL <- "https://github.com/mashoedoe/Getting_and_Cleaning_Data/ReadME.md"

# The data source for creating this tidy data represent data collected from the 
# accelerometers from the Samsung Galaxy S smartphone. 

# A full description of the source data is available at the site where the data 
# was obtained: 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# A.1.
# store the URL for the source data for the project in the object named data_URL
data_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

# A.2.
# download and unzip the source data into your working directory. It contains 
# text files with two groups of data: 
# a test data set
# a training data set
# The source data aslo contains the activity names and a codebook that explains 
# the source data, applicable to both the test and training data sets.
download.file(data_URL, "UCI_HAR_Dataset.zip")
unzip("UCI_HAR_Dataset.zip")

# A.3.
# Open the codebook for the original source data in R's text editor 
# to get familiar with the source data 
file.edit("UCI HAR Dataset/features_info.txt")

# Step 1 (merging) and Step 4 (descriptive variable naming) of the Course 
# Project instructions are performed between B.1 to B.2.v

# B.1
# Before Merging the training and the test sets in the source data to create 
# one data set, we will create appropriate labels for the data set with which 
# to provide descriptive variable names from "UCI HAR Dataset/features.txt". 
# We will also create descriptive activity names to name the activities 
# in the data set from "UCI HAR Dataset/activity_labels.txt"
# B.1.i
# Creation of descriptive names for the signal variables as a character vector 
# to apply when we read the test and training data in to R.
col_names <- as.character(read.table("UCI HAR Dataset/features.txt")[,2])
col_names <- gsub("-", "_", col_names)
col_names <- sub("tBody", "time_Body_", col_names)
col_names <- sub("fBody", "FFT_Body_", col_names)
col_names <- sub("tGravity", "time_Gravity_", col_names)
col_names <- sub("AccJerk", "Acc_Jerk", col_names)
col_names <- sub("AccMag", "Acc_Mag", col_names)
col_names <- sub("Acc_JerkMag", "Acc_Jerk_Mag", col_names)
col_names <- sub("GyroJerk", "Gyro_Jerk", col_names)
col_names <- sub("GyroMag", "Gyro_Mag", col_names)
col_names <- sub("Gyro_JerkMag", "Gyro_Jerk_Mag", col_names)
col_names <- sub("Body_Body", "Body_", col_names)
col_names <- gsub("[()]", "", col_names)
col_names <- gsub("angle", "angle_", col_names)
# B.1.ii
# Read descriptive activity lables into R which will be assigned to the 
# "activity" column once the test and training data are merged
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                              colClasses = c("numeric", "character"))

# B.2
# Merge the test and training data:
# B.2.i
# First prepare the test data by reading the subjects, activities and signal 
# data in from the test data. The descriptive variable names created in step
# B.1.i are provided as the argument col.names when reading in the signal data 
# into the data.frame "test":
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                           col.names = "subject")
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt", 
                            col.names = "activity")
test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, 
                   nrows = 2947, colClasses = "numeric", col.names = col_names)
# B.2.ii
# column bind the subject, activity and signal data for the test data, adding a 
# column that identifies this as the test data
test_or_train <- "test"
test <- cbind(subject_test, activity_test, test, test_or_train)
# B.2.iii
# Now prepare the training data by reading the subjects, activities and signal 
# data for the training data. The descriptive variable names created in step
# B.1.i are provided as the argument col.names when reading in the signal data 
# into the data.frame "train":
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                            col.names = "subject")
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt", 
                             col.names = "activity")
train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, 
                    nrows = 7352, colClasses = "numeric", col.names = col_names)
# B.2.iv
# column bind the subject, activity and signal data for the training data, 
# adding a column that identifies this as the training data
test_or_train <- "train"
train <- cbind(subject_train, activity_train, train, test_or_train)
# B.2.V
# Merge the test and training datasets by row binding them together
test_train <- rbind(test, train)

# B.3 (Step 2 of the Course Project Instructions)
# Extract only the the mean and standard deviation for each signal measurement.
# B.3.i
# assign the names of the merged test and training data variables to a character 
# vector and match which signal variables are the mean AND standard deviation 
# measurements.
test_train_names <- colnames(test_train)
mean <- grep( "mean", test_train_names, ignore.case = FALSE) 
meanF <- grep("meanF", test_train_names)
mean <- mean [! mean %in% meanF]
std <- grep("std", test_train_names, ignore.case = TRUE)
# B.3.ii
# Using the dplyr package extract the subject, activity and these identified 
# mean and standard deviation measurements, using the select function. 
library(dplyr)
test_train <- select(test_train, c(1,2, mean, std))

# B.4 (Step 3 of the Course Project Instructions)
# Apply the descriptive activity names created in step B.1.ii to name the 
# activities in the data set (and remove objects created or used during steps 
# B.1 to B.4 that are no longer needed)
test_train$activity <- factor(test_train$activity, 
                              levels = activity_labels[1][!is.na(activity_labels[1])], 
                              labels = activity_labels[2][ !is.na(activity_labels[2])])
rm(test, train, activity_test, activity_train, subject_test, subject_train, 
   col_names, test_or_train, test_train_names, mean, meanF, mean, std, activity_labels)

# B.5 (Step 5 of the Course Project Instructions)
# From the data set created between steps B.1 - B.4 we now create a second, 
# independent data set with the average of each variable for each activity 
# and each subject which follows the principles of tidy data: (Each variable 
# you measure should be in one column, Each different observation of that 
# variable should be in a different row).

# We use the dplyr package and the pipe operator to first group the data by 
# subject and activity and then create the summary value (the mean) that we want
# for each of the 66 measurements of each of 6 activities for each of the 30
# subjects. Tis tidy data set is presented in wide format as the instructions
# in the Course Project allow for
test_train_tidy <- test_train %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# B.6
# write the created tidy data set to a text file
write.table(test_train_tidy, "test_train_tidy.txt", row.names = FALSE)

# B.7
# with the tidy data settext file ("test_train_tidy.txt") in your working 
# directory you will be able to read it into R with the following code:
test_train_tidy <- read.table("test_train_tidy.txt", header = TRUE)
