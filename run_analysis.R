## load dplyr: it's used for grouping and applying the aggregate mean function
library(dplyr)

## set my working directory
##setwd("C:/Users/Roger/DataScienceSpecialization/Course3-GettingAndCleaningData/wk4/Assignment")

## download the zip file into my wd renaming it "AssignmentData.zip"
## download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "AssignmentData.zip")

## load the 6 data files (3 train and 3 test) and the features and activities files
y_train <- read.table(unz("AssignmentData.zip", "UCI HAR Dataset/train/y_train.txt"))
X_train <- read.table(unz("AssignmentData.zip", "UCI HAR Dataset/train/X_train.txt"))
subject_train <- read.table(unz("AssignmentData.zip", "UCI HAR Dataset/train/subject_train.txt"))
y_test <- read.table(unz("AssignmentData.zip", "UCI HAR Dataset/test/y_test.txt"))
X_test <- read.table(unz("AssignmentData.zip", "UCI HAR Dataset/test/X_test.txt"))
subject_test <- read.table(unz("AssignmentData.zip", "UCI HAR Dataset/test/subject_test.txt"))
features <- read.table(unz("AssignmentData.zip", "UCI HAR Dataset/features.txt"))
activities <- read.table(unz("AssignmentData.zip", "UCI HAR Dataset/activity_labels.txt"))

## replace the column names with the feature names in the X datasets
names(X_train) <- features$V2
names(X_test) <- features$V2

## replace the column names with more explicit values in the subject datasets
names(subject_test) <- c("Subject")
names(subject_train) <- c("Subject")

## merging the y and activities datasets to replace the y content with the activity description
y_train2 <- merge(x = y_train, y = activities, by.x = "V1", by.y = "V1")
y_test2 <- merge(x = y_test, y = activities, by.x = "V1", by.y = "V1")

## keeping only the column with the activity description without losing the data.frame class
y_train2 <- y_train2[ ,"V2", drop = FALSE]
y_test2 <- y_test2[ , "V2", drop = FALSE]

## renaming the column header
names(y_train2) <- c("Activity")
names(y_test2) <- c("Activity")

## merging (by column) the subject, y and X datasets in 2 merged dataset: merged_test and merged_train
merged_test <- cbind(subject_test, y_test2, X_test)
merged_train <- cbind(subject_train, y_train2, X_train)

## merging (by row) the 2 merged datasets in one single dataset
merged <- rbind(merged_test, merged_train)

## creating a vector with the column headers to keep, mean() and std() (using regex)
keep <- names(merged)[grep(pattern = "mean\\(\\)|std\\(\\)", names(merged))]

## extracting the subject, activity and mean/std columns from merged
merged_final <- merged[c("Subject", "Activity", keep)]

## grouping the final merged data by Subject and Activity
grouped <- group_by(merged_final, Subject, Activity)

## applying the mean function to all the columns
summ <- summarise_each(grouped, funs(mean))