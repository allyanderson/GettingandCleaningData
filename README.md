Coursera Getting and Cleaning Data Final Assignment

An R script called run_analysis.R has been created to take existing data collected from wearable technology and create a new tidy data set from the original data.

Cited from the course assignment, 
“The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip “

The assignment solution contains:
	⁃	This README.md file
	⁃	The R script called run_analysis.R saved in a text file
	⁃	An updated Codebook

The R script called run_analysis.R which (as cited from the Assignment website):
	1.	Merges the training and the test sets to create one data set.
	2.	Extracts only the measurements on the mean and standard deviation for each measurement. ** uses only those columns with mean and standard deviation calculations in the variable name - mean() and std() at the end of the variable name.
	3.	Uses descriptive activity names to name the activities in the data set
	4.	Appropriately labels the data set with descriptive variable names.
	5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To run the script in R,

The script assumes that the UCI HAR Dataset folder (extracted from the .zip files) is saved in RStudio's default working directory
The script also assumes that the plyr & dplyr packages are installed on the person’s computer.


Tidy data is as per the Coursera course slides: 
- each variable should be in one column 
- each observation of that variable in a different row 
- one table for each kind of variable 
- has a row at the top of each file with variable names 

Variable names are descriptive and tidy as per the Coursera course slides:
- all lowercase when possible 
- descriptive 
- unique 
- contains no punctuation - underscores, dots or spaces
