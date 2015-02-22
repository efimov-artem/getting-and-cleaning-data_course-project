## About
This repo contains course project of 'Getting and Cleaning Data' course provided by Coursera.org and JHBSPH.
The purpose of this course project is demonstration the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
The original input data are data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The input data for project are here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Preparing input data
The input data for project shoud be exracted into the working directory so the directory 'UCI HAR Dataset' should be in the working directory. 

## How the script run_analysis.R works

1. Read the labels of activitis.
2. Read the activities from 'train' and 'test' sets.
3. Bind the activities into the single data frame, transform activities from data frame to factor so the activites would have descriptive names.
4. Read the subjects from 'train' and 'test' sets.
5. Bind the subjects into the single data frame.
6. Read the features.
7. Read the measured values of features from 'train' and 'test' sets.
8. Bind the sets into the single data frame, assign names of variables from features names.
9. Extracts indices of the measurements on the mean and standard deviation for each measurement.
10. Extracts the measurements on the mean and standard deviation for each measurement.
11. Add to Set data frame columns with ids of subjects and activities.
12. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
13. Rename the columns with variables in the second data set to descript that they are average values.
14. Write tidy data set to file.