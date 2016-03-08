---
title: "CodeBook"
author: "Jean Pierre Turgeon"
date: "Monday, March 07, 2016"
output: html_document
---

## Human Activity Recognition Using Smartphones Dataset
## Version 1.0  

==================================================================  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  
==================================================================  

### Description of the experiments

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

For each record, the following information is provided:  

1. A 561-feature vector with time and frequency domain variables. 
2. Its activity label. 
3. An identifier of the subject who carried out the experiment.  

### The base data frames

The data frames are stored as text files.  

x_train.txt: Training records (561 variables each)  
y_train.txt: Training activity labels  
subject_train.txt: Training subject labels
x_test.txt: Test records (561 variables each)    
y_test.txt: Test activity labels  
subject_test.txt: Test subject labels
features.txt: Measured features labels (561)  
activity_labels.txt: Correspondence between activity codes and activity names

Raw measurements used to build the features are in standard gravity units "g".  The features are normalized and bounded within [-1,1].  

### The tidy data sets
The following sections describe the manipulations and transformations applied to data frames "x_train" and "x_test" in order to create a single tidy data frame that contains all measurements from all expriments and the creation of a data  frame that summarizes that information.

#### Create the main data frame
1. Two columns are added to data frames x_train and x_test.  The first column named "activity" and containing the activity labels of the individual records is the single column of data frames y_train and y_test, respectively.  Similarly, the column "subject" that contains the subject identifier of each record is taken from data frames subject_train and subject_test. 
2. The data frames x_train and y_train are merged (by row binding) into one data frame that contains the features (variables) for all subjects and all activities.  The resulting data frame is named "x".
3. In data frame "x", select columns that contain either mean or standard deviation measurements and assign meaninful names extracted from data frame "features" to those columns.

#### Create new data frame
Using the *dplyr* command *summarise* create data frame "summary_df" that contains the average of each variable in "x" for each activity and each subject. 
