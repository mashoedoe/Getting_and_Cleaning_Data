# test_train_tidy database Codebook

There are 180 records in this dataset and each record has 68 variables namely:
* An identifier of the subject who carried out the experiment.
* An identifier of the activity carried out
* 66 variables representing average(mean) values calculated for each subject and each activity from 66 of the 561 vector of features in the "Human Activity Recognition Using Smartphones Dataset" 

### Variable in column 1
Each of the 30 volunteers who carried out the experiment is represented by a unique number (from 1 to 30) in the "subject" variable

### Variable in column 2
Each subject performed six activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) represented as levels in the factor variable "activity"

### Variables in column 3 to 68

Variables 3 to 68 are the mean(average) values for each subject and each activty calculated for 66 time and frequency domain features and are normalized and bounded within [-1,1]

The names for variables 3 to 68 are descriptions of the data from from which they were averaged and can be understood as follows:

All measurments selected for this database are calulated from the accelerometer and gyroscope 3-axial raw signals.
Variable names 3 to 68 either contain the string "Acc" indicating they are derived from accelerometer signals OR contain the string "Gyro" indicating they are derived from gyroscope signals

Time domain signals were captured at a constant rate of 50 Hz. These variable names are prefixed with the string "time". 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The time domain acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. These variable names contain the string "Body" or "Gravity".
The variable names that match this description start with "time_Body_Acc" or "time_Gravity_Acc" or "time_Body_Gyro"

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. These variable names contain the string "Jerk". The variable names that match this description start with "time_Body_Acc_Jerk" or "time_Body_Gyro_Jerk". 

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm and these variable names contain the string "Mag". Variable names that match this description start with "time_Body_Acc_Mag" or "time_Gravity_Acc_Mag" or "time_Body_Acc_Jerk_Mag" or "time_Body_Gyro_Mag" or "time_Body_Gyro_Jerk_Mag". 

Finally a Fast Fourier Transform was applied to some of these signals. These variable names are prefixed with the string "FFT" to indicate these frequency domain signals.
The variable names that match this description are "FFT_Body_Acc" or "FFT_Body_Acc_Jerk" or "FFT_Body_Gyro" or FFT_Body_Acc_Jerk_Mag" or FFT_Body_Gyro_Mag" or "FFT_Body_Gyro_Jerk_Mag". 

Variable names that contain "X" or "Y" or "Z" at the end, denote 3-axial signals in the X, Y or Z directions.

Variables in column 3 to 35 are the means estimated from these signals while Variables in column 36 to 68 are standard deviations estimated from these signals. The string "mean" or "std" denote which is applicable.

##### Names; measurement level; maximum possible range of values for the 68 variables for each record are:

###### subject; integer; 1 to 30
###### activity; factor; 6 levels "WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LYING"
###### time_Body_Acc_mean_X; numeric; -1 to 1
###### time_Body_Acc_mean_Y; numeric; -1 to 1
###### time_Body_Acc_mean_Z; numeric; -1 to 1
###### time_Gravity_Acc_mean_X; numeric; -1 to 1
###### time_Gravity_Acc_mean_Y; numeric; -1 to 1
###### time_Gravity_Acc_mean_Z; numeric; -1 to 1
###### time_Body_Acc_Jerk_mean_X; numeric; -1 to 1
###### time_Body_Acc_Jerk_mean_Y; numeric; -1 to 1
###### time_Body_Acc_Jerk_mean_Z; numeric; -1 to 1
###### time_Body_Gyro_mean_X; numeric; -1 to 1
###### time_Body_Gyro_mean_Y; numeric; -1 to 1
###### time_Body_Gyro_mean_Z; numeric; -1 to 1
###### time_Body_Gyro_Jerk_mean_X; numeric; -1 to 1
###### time_Body_Gyro_Jerk_mean_Y; numeric; -1 to 1
###### time_Body_Gyro_Jerk_mean_Z; numeric; -1 to 1
###### time_Body_Acc_Mag_mean; numeric; -1 to 1
###### time_Gravity_Acc_Mag_mean; numeric; -1 to 1
###### time_Body_Acc_Jerk_Mag_mean; numeric; -1 to 1
###### time_Body_Gyro_Mag_mean; numeric;  -1 to 1
###### time_Body_Gyro_Jerk_Mag_mean numeric; -1 to 1
###### FFT_Body_Acc_mean_X; numeric; -1 to 1
###### FFT_Body_Acc_mean_Y; numeric; -1 to 1
###### FFT_Body_Acc_mean_Z; numeric; -1 to 1
###### FFT_Body_Acc_Jerk_mean_X; numeric; -1 to 1
###### FFT_Body_Acc_Jerk_mean_Y; numeric; -1 to 1
###### FFT_Body_Acc_Jerk_mean_Z; numeric; -1 to 1
###### FFT_Body_Gyro_mean_X; numeric; -1 to 1
###### FFT_Body_Gyro_mean_Y; numeric; -1 to 1
###### FFT_Body_Gyro_mean_Z; numeric; -1 to 1
###### FFT_Body_Acc_Mag_mean; numeric; -1 to 1
###### FFT_Body_Acc_Jerk_Mag_mean; numeric; -1 to 1
###### FFT_Body_Gyro_Mag_mean; numeric; -1 to 1
###### FFT_Body_Gyro_Jerk_Mag_mean; numeric   -1 to 1
###### time_Body_Acc_std_X; numeric; -1 to 1
###### time_Body_Acc_std_Y; numeric; -1 to 1
###### time_Body_Acc_std_Z; numeric ; -1 to 1
###### time_Gravity_Acc_std_X; numeric; -1 to 1
###### time_Gravity_Acc_std_Y; numeric; -1 to 1
###### time_Gravity_Acc_std_Z; numeric; -1 to 1
###### time_Body_Acc_Jerk_std_X; numeric; -1 to 1
###### time_Body_Acc_Jerk_std_Y; numeric; -1 to 1
###### time_Body_Acc_Jerk_std_Z; numeric; -1 to 1
###### time_Body_Gyro_std_X; numeric; -1 to 1
###### time_Body_Gyro_std_Y; numeric; -1 to 1
###### time_Body_Gyro_std_Z;numeric; -1 to 1
###### time_Body_Gyro_Jerk_std_X; numeric; -1 to 1
###### time_Body_Gyro_Jerk_std_Y; numeric; -1 to 1
###### time_Body_Gyro_Jerk_std_Z; numeric; -1 to 1
###### time_Body_Acc_Mag_std; numeric; -1 to 1
###### time_Gravity_Acc_Mag_std; numeric; -1 to 1
###### time_Body_Acc_Jerk_Mag_std; numeric; -1 to 1
###### time_Body_Gyro_Mag_std; numeric; -1 to 1
###### time_Body_Gyro_Jerk_Mag_std; numeric; -1 to 1
###### FFT_Body_Acc_std_X; numeric; -1 to 1
###### FFT_Body_Acc_std_Y; numeric; -1 to 1
###### FFT_Body_Acc_std_Z; numeric; -1 to 1
###### FFT_Body_Acc_Jerk_std_X; numeric; -1 to 1
###### FFT_Body_Acc_Jerk_std_Y; numeric; -1 to 1
###### FFT_Body_Acc_Jerk_std_Z; numeric; -1 to 1
###### FFT_Body_Gyro_std_X; numeric; -1 to 1
###### FFT_Body_Gyro_std_Y; numeric; -1 to 1
###### FFT_Body_Gyro_std_Z; numeric; -1 to 1
###### FFT_Body_Acc_Mag_std; numeric; -1 to 1
###### FFT_Body_Acc_Jerk_Mag_std; numeric; -1 to 1
###### FFT_Body_Gyro_Mag_std; numeric; -1 to 1
###### FFT_Body_Gyro_Jerk_Mag_std; numeric; 1 to 1l 
