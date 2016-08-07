## assumes that the zip file extract location is RStudio's default working directory. 
## UCI HAR Dataset folder is saved in RStudio's default working directory
## Uses plyr & dplyr packages

## Read in test and training data for X
## Merge test and training data for x into one table for x
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
xtable <- rbind(xtest, xtrain)

## Read in test and training data for y
## Merge test and training data for y into one table for y
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")
ytable <- rbind(ytest, ytrain)

## Read in test and training data for subject
## Merge test and training data for subject into one table for subject
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")
subjecttable <- rbind(subjecttest, subjecttrain)

## Merge/Bind x, y and subject data into one big table
bigtable <- cbind(ytable, subjecttable, xtable)

## Read in features file and set feature descriptions as column headers along with 
## activity label and subject


features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, sep = "")
featurecolnames <- as.vector(features[,2])
colnames(bigtable) <- c("activitylabel", "subject", featurecolnames)

## Filter column headings to leave only the activity label, the subject and those columns containing
## mean() or standard deviation - std() references

tablemeansd <- bigtable[ , grepl("[Mm]ean\\()|[Ss]td\\()|activitylabel|subject", names(bigtable))]

## Uses descriptive activity names to name the activities in the data set
## Read in Activity Label file and create a descriptive activity column based on activitylabel
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")
colnames(activity) <- c("activitylabel", "activity")
tableactivity <- merge(activity, tablemeansd, all.y = TRUE)

## Labels the data set with descriptive variable names
names(tableactivity) <- gsub("tbody", "timedomain", names(tableactivity))
names(tableactivity) <- gsub("Acc", "accelerometer", names(tableactivity)) 
names(tableactivity) <- gsub("Mag", "magnitude", names(tableactivity))
names(tableactivity) <- gsub("Gyro", "gyroscope", names(tableactivity))
names(tableactivity) <- gsub("std", "standarddeviation", names(tableactivity))
names(tableactivity) <- gsub("fbody|fbodybody", "frequencydomain", names(tableactivity))
names(tableactivity) <- gsub("-y", "yaxis", names(tableactivity))
names(tableactivity) <- gsub("-x", "xaxis", names(tableactivity))
names(tableactivity) <- gsub("-z", "zaxis", names(tableactivity))
names(tableactivity) <- gsub("-", "", names(tableactivity))
names(tableactivity) <- gsub("\\()", "", names(tableactivity))
names(tableactivity) <- tolower(names(tableactivity))

##uses plyr and dplyr packages
library(plyr)
library(dplyr)

## Creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.
tableactivity2 <- select(tableactivity, -activitylabel)
tidymeans <- ddply(tableactivity2, .(activity, subject), colwise(mean) )

## Writes text file "TidyDataSetofMeans" table as output
write.table(tidymeans, "TidyDataSetofMeans", row.names = FALSE)