GetandCleanData
===============

Coursera-Getting and Cleaning Data

How the script "run_analysis.R" works
====================

The script has the following steps to produce a tidy data from the raw data.

 - Specify the "input" folder where the "test" and "train" folders are located. Set the working directory to be the same folder.
 - Use read.table command to import 3 files "X_test.txt", "Y_test.txt" and "Subject_test.txt" under ~/test folder, and 3 files "X_train.txt", "Y_train.txt" and "Subject_train.txt" under ~/train folder.
 - Import "features.txt" file under working directory. 
 - Use "rbind" and "cbind" to merge the training and the test sets to create one data set.Name the data set with labels in "feature.txt" imported above. Name the variable from "Y_test.txt" and "Y_train.txt" as "labelsCode". Name the variable from "subject_test.txt" and "subject_train.txt" as "Subject". The data at this step is 10299 by 563.
 - Use "grep" function to identify which variables' names contain "mean()" and "std()", store the location of them in "temp", and use "temp" to extract the measurements on the mean and standard deviation for each measurement. At the same time, the "labelsCode" and "Subject" columns are retained in the new data set. The data after this step is 10299 by 68.
 - Import the "activity_labels.txt" file. The file has two columns: the first column is the coded number to denote the activities, and the second column is the descriptive strings for the activities. Names the "activity_labels" with "labelsCode" and "ActivityLabel".
 - Merge data with "activity_labels" by "labelsCode" (left join).
 - use "aggregate" function to create an independent tidy data set with the average of each variable for each activity and each subject. The new data is called "data.5".
 - Export "data.5" to working directory. Name it "TidyData.txt". 
