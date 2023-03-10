Getting and Cleaning Data Project
==============
  
This is the GitHub Repository for the Getting and Cleaning Data Course Project

## Data Set Description ##

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Data Analysis Description ##

R script called **run_analysis.R ** that does the following. 

1. Downloads the data sets to the local directory called **project _data.zip**.
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each         measurement. 
4. Names the activities in the data set
5. Labels the data set with descriptive variable names. 
6. From the data set in step 4, creates a second, independent tidy data set with      the average of each variable for each activity and each subject.
7. Saves a tidy data set to the local directory called **TidyDataSet.txt**

