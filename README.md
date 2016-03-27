# Getting And Cleaning Data Project Assignment

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The raw data, linked to from the website below, represents data collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The goal of this project is to provide a clean tidy data set with the average of each variable for each activity and each subject, from the Samsung raw accelerometer and gyroscope data as described.

The accompanying R script `run_analysis.R` achieves the above by doing the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates and outputs a second, independent tidy data set with the average of each variable for each activity and each subject.

The resultant data set output is included in this project, `Smartphone_Human_Activity_Summary_Stats.txt`, along with a CodeBook, `codebook.md`, describing the raw and resultant data, together with the process and summary choices made in compiling this data.

