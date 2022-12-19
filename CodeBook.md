# Code Book
This  is a code book that describes the variables, the data, and any transformations or works that were performed to clean up the data.


## Data Source
The data used in this project is the data collected from the accelerometers from the Samsung Galaxy S smartphone. The data is downloaded from the Human Activity Recognition Using Smartphones Data Set webpage of UCI Machine Learning Repository site.

**Data Set Download Link:** https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

**Data Set Description:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Data Set Information (Directly Quoted from UCI)
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

### Attribute Information (Directly Quoted from UCI)
"For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope.

- A 561-feature vector with time and frequency domain variables.

- Its activity label.

- An identifier of the subject who carried out the experiment."

- Features are normalized and bounded within [-1,1].

- Each feature vector is a row on the text file.

### Data Files (Directly Quoted from Downloaded README File)
The downloaded data set includes the following files: 

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## Transformation Details
The **run_analysis.R** script is used to perform the analysis by following the five guidelines.

### Variables Used in the R Script 
- 'fileUrl': stores download url of zip file.

- 'fileName': stores file name to save the download file as.

- 'filePath': stores file path and file name to download the file.

- 'training_subject': stores the data from subject_train.txt file.

- 'x_train': stores the data from X_train.txt file.

- 'y_train': stores the data from y_train.txt file.

- 'test_subject': stores the data from subject_test.txt file.

- 'x_test': stores the data from X_test.txt file.

- 'y_test': stores the data from y_test.txt file.

- 'features': stores the data from features.txt file.

- 'activity_labels': stores the data from activity_labels.txt file.

- 'all_data': stores merged data of training data and test data. 

- 'required_col': stores the required columns which are subjectID, activityID and all column names with mean or std text.

- 'all_data_col': stores the column names of 'all_data' data frame.

- 'tidy_data': stores the tidy data with the average of each variable for each activity and each subject.


### Step 1: Merges the training and the test sets to create one data set.
1. the zip file containing the data set is downloaded and unzipped. 
2. read all the required text files. 
3. add column names to the data frame variables of training and text data sets so that the data could be merged correctly. 
4. to merge the training and test data, first, the training data: 'y_train', 'x_train', and 'training_subject' are bound as columns, and the test data: 'y_test', 'x_test', and 'test_subject' are bound as columns as well. After that, row bind is used to bind all the rows.

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
1. get only the column names we want using 'grepl' and select only those columns from 'all_data'. 

### Step 3: Uses descriptive activity names to name the activities in the data set
1. use 'factor' to replace activity ID with the activity type labels. 

### Step 4: Appropriately labels the data set with descriptive variable names. 
1. get all column names of 'all_data' data frame and remove special characters such as parentheses. 
2. replace abbreviations with descriptive names. 
3. apply the cleaned column names to 'all_data' data frame.

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
1. aggregate data to get the average of each variable for each activity and each subject.
2. order the data by subject ID and activity type. 
3. write the data frame to 'tidy_data_set.txt' file. 


## Final Tidy Data Set
The final tidy data set in 'tidy_data_set.txt' text file includes **180 observations** of **81 features**. "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyAccelerometerJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAccelerometerJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerometerMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude. (Note the 'frequency' prefix to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

'mean' is used to note mean value and 'std' is used to note standard deviation value." - Referenced from the downloaded data


The features are as follow: 

1.	"subjectID" - subject ID number (1 to 30)
2.	"activityType" - one of six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
3.	"timeBodyAccelerometer-mean-X" 
4.	"timeBodyAccelerometer-mean-Y" 
5.	"timeBodyAccelerometer-mean-Z" 
6.	"timeBodyAccelerometer-std-X" 
7.	"timeBodyAccelerometer-std-Y" 
8.	"timeBodyAccelerometer-std-Z" 
9.	"timeGravityAccelerometer-mean-X" 
10.	"timeGravityAccelerometer-mean-Y" 
11.	"timeGravityAccelerometer-mean-Z" 
12.	"timeGravityAccelerometer-std-X" 
13.	"timeGravityAccelerometer-std-Y" 
14.	"timeGravityAccelerometer-std-Z" 
15.	"timeBodyAccelerometerJerk-mean-X" 
16.	"timeBodyAccelerometerJerk-mean-Y" 
17.	"timeBodyAccelerometerJerk-mean-Z" 
18.	"timeBodyAccelerometerJerk-std-X" 
19.	"timeBodyAccelerometerJerk-std-Y" 
20.	"timeBodyAccelerometerJerk-std-Z" 
21.	"timeBodyGyroscope-mean-X" 
22.	"timeBodyGyroscope-mean-Y" 
23.	"timeBodyGyroscope-mean-Z" 
24.	"timeBodyGyroscope-std-X" 
25.	"timeBodyGyroscope-std-Y" 
26.	"timeBodyGyroscope-std-Z" 
27.	"timeBodyGyroscopeJerk-mean-X" 
28.	"timeBodyGyroscopeJerk-mean-Y" 
29.	"timeBodyGyroscopeJerk-mean-Z" 
30.	"timeBodyGyroscopeJerk-std-X" 
31.	"timeBodyGyroscopeJerk-std-Y" 
32.	"timeBodyGyroscopeJerk-std-Z" 
33.	"timeBodyAccelerometerMagnitude-mean" 
34.	"timeBodyAccelerometerMagnitude-std" 
35.	"timeGravityAccelerometerMagnitude-mean" 
36.	"timeGravityAccelerometerMagnitude-std" 
37.	"timeBodyAccelerometerJerkMagnitude-mean" 
38.	"timeBodyAccelerometerJerkMagnitude-std" 
39.	"timeBodyGyroscopeMagnitude-mean" 
40.	"timeBodyGyroscopeMagnitude-std" 
41.	"timeBodyGyroscopeJerkMagnitude-mean" 
42.	"timeBodyGyroscopeJerkMagnitude-std" 
43.	"frequencyBodyAccelerometer-mean-X" 
44.	"frequencyBodyAccelerometer-mean-Y" 
45.	"frequencyBodyAccelerometer-mean-Z" 
46.	"frequencyBodyAccelerometer-std-X" 
47.	"frequencyBodyAccelerometer-std-Y" 
48.	"frequencyBodyAccelerometer-std-Z" 
49.	"frequencyBodyAccelerometer-meanFrequency-X" 
50.	"frequencyBodyAccelerometer-meanFrequency-Y" 
51.	"frequencyBodyAccelerometer-meanFrequency-Z" 
52.	"frequencyBodyAccelerometerJerk-mean-X" 
53.	"frequencyBodyAccelerometerJerk-mean-Y" 
54.	"frequencyBodyAccelerometerJerk-mean-Z" 
55.	"frequencyBodyAccelerometerJerk-std-X" 
56.	"frequencyBodyAccelerometerJerk-std-Y" 
57.	"frequencyBodyAccelerometerJerk-std-Z" 
58.	"frequencyBodyAccelerometerJerk-meanFrequency-X" 
59.	"frequencyBodyAccelerometerJerk-meanFrequency-Y" 
60.	"frequencyBodyAccelerometerJerk-meanFrequency-Z" 
61.	"frequencyBodyGyroscope-mean-X" 
62.	"frequencyBodyGyroscope-mean-Y" 
63.	"frequencyBodyGyroscope-mean-Z" 
64.	"frequencyBodyGyroscope-std-X" 
65.	"frequencyBodyGyroscope-std-Y" 
66.	"frequencyBodyGyroscope-std-Z" 
67.	"frequencyBodyGyroscope-meanFrequency-X" 
68.	"frequencyBodyGyroscope-meanFrequency-Y" 
69.	"frequencyBodyGyroscope-meanFrequency-Z" 
70.	"frequencyBodyAccelerometerMagnitude-mean" 
71.	"frequencyBodyAccelerometerMagnitude-std" 
72.	"frequencyBodyAccelerometerMagnitude-meanFrequency" 
73.	"frequencyBodyAccelerometerJerkMagnitude-mean" 
74.	"frequencyBodyAccelerometerJerkMagnitude-std" 
75.	"frequencyBodyAccelerometerJerkMagnitude-meanFrequency" 
76.	"frequencyBodyGyroscopeMagnitude-mean" 
77.	"frequencyBodyGyroscopeMagnitude-std" 
78.	"frequencyBodyGyroscopeMagnitude-meanFrequency" 
79.	"frequencyBodyGyroscopeJerkMagnitude-mean" 
80.	"frequencyBodyGyroscopeJerkMagnitude-std" 
81.	"frequencyBodyGyroscopeJerkMagnitude-meanFrequency"

