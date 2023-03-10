# JHU Getting and Cleaning Data Course Project
The purpose of this project is to showcase the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data used in this project is the data collected from the accelerometers from the Samsung Galaxy S smartphone. The data is available to download at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The data set information is provided below. 

## Data Set Information (Directly Quoted from UCI)
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment."

## Files
There are four files in this repository:
1. **CodeBook.md**: this file is a code book that describes the variables, the data, and any transformations or works that were performed to clean up the data.

2. **README.md**: this file provides an overview of the repository.

3. **run_analysis.R**: the R script used to perform the analysis by following the five guidelines below:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
4. **tidy_data_set.txt**: this is a space-separated text file containing a tidy data set with the average of each variable for each activity and each subject. 
