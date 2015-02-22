# ReadME

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   

The goal of this repository is to prepare a tidy data set from the data source that can be used for later analysis as per the instructions of the Getting and Cleaning Data Course Project instructions. The steps taken to produce the final tidy data set are listed below from A.1 to B.7.

The R script that creates the tidy data set can be downloaded here:

ReadME_URL <- "https://github.com/mashoedoe/Getting_and_Cleaning_Data/run_analysis.R"

The Codebook that has a further information about the variables in the tidy data set created by run_analysis.R can be downloaded here:

codebook_URL <- "https://github.com/mashoedoe/Getting_and_Cleaning_Data/CodeBook.md"

The data source for creating this tidy data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

## A.1
store the URL for the source data for the project in the object named data_URL

## A.2
download and unzip the source data into your working directory. It contains text files with two groups of data: 
a test data set
a training data set
The source data aslo contains the activity names and a codebook that explains the source data, applicable to both the test and training data sets.

## A.3
Open the codebook for the original source data in R's text editor 
to get familiar with the source data 

Step 1 (merging) and Step 4 (descriptive variable naming) of the Course 
Project instructions are performed between B.1 to B.2.v

## B.1
Before Merging the training and the test sets in the source data to create one data set, we will create appropriate labels for the data set with which to provide descriptive variable names from "UCI HAR Dataset/features.txt". We will also create descriptive activity names to name the activities in the data set from "UCI HAR Dataset/activity_labels.txt"
### B.1.i
Creation of descriptive names for the signal variables as a character vector to apply when we read the test and training data in to R.
### B.1.ii
Read descriptive activity lables into R which will be assigned to the 

## B.2
Merge the test and training data:
### B.2.i
First prepare the test data by reading the subjects, activities and signal data in from the test data. The descriptive variable names created in step B.1.i are provided as the argument col.names when reading in the signal data 
into the data.frame "test":
### B.2.ii
column bind the subject, activity and signal data for the test data, adding a column that identifies this as the test data
### B.2.iii
Now prepare the training data by reading the subjects, activities and signal data for the training data. The descriptive variable names created in step B.1.i are provided as the argument col.names when reading in the signal data into the data.frame "train":
### B.2.iv
column bind the subject, activity and signal data for the training data, adding a column that identifies this as the training data
### B.2.v
Merge the test and training datasets by row binding them together

## B.3 (Step 2 of the Course Project Instructions)
Extract only the the mean and standard deviation for each signal measurement.
### B.3.i
assign the names of the merged test and training data variables to a character vector and match which signal variables are the mean AND standard deviation measurements.
### B.3.ii
Using the dplyr package extract the subject, activity and these identified mean and standard deviation measurements, using the select function. 

## B.4 (Step 3 of the Course Project Instructions)
Apply the descriptive activity names created in step B.1.ii to name the activities in the data set (and remove objects created or used during steps B.1 to B.4 that are no longer needed)

## B.5 (Step 5 of the Course Project Instructions)
From the data set created between steps B.1 - B.4 we now create a second, independent data set with the average of each variable for each activity and each subject which follows the principles of tidy data: (Each variable you measure should be in one column, Each different observation of that 
variable should be in a different row).
We use the dplyr package and the pipe operator to first group the data by subject and activity and then create the summary value (the mean) that we want for each of the 66 measurements of each of 6 activities for each of the 30 subjects. Tis tidy data set is presented in wide format as the instructions in the Course Project allow for.

## B.6
write the created tidy data set to a text file

## B.7
with the tidy data settext file ("test_train_tidy.txt") in your working directory you will be able to read it into R with the following code:
test_train_tidy <- read.table("test_train_tidy.txt", header = TRUE)

