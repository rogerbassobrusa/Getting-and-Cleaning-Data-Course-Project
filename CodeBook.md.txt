## Code Book for Getting and Cleaning Data Course Project

### Description of the variables

* y_train, X_train, subject_train: train files
* y_test, X_test, subject_test: test files
* features: features.txt file containing the list of variables of the X files
* activities: content of the activity_labels.txt file containing the activities codes and descriptions
* y_train2, y_test2: new versions of the y files, where the activity codes are replaced with activity descriptions
* merged_train: result of the column binding of y_train, X_train and subject_train
* merged_test: result of the column binding of y_test, X_test and subject_test
* merged: result of the row binding of merged_train and merged_test
* keep: contains the variables names that match the text "mean()" or "std()"
* merged_final: data with columns whose headers are contained in the keep dataset, plus subject and activity
* grouped: merged_final data grouped by subject and activity
* summ: summary of the grouped data with calculated mean per each column


### Description of the data

The input zip file contains several text files:
These 3 files can be used to train an algorithm:
* subject_train.txt: each row n represents a subject code which is linked to the n-th observation in the X_train file
* X_train.txt: each row is an observation containing parameters provided by the Samsung device accelerometer
* y_train.txt: each row n is an activity code which is linked to the n-th observation in the X_train file
These 3 files can be used to test the algorithm:
* subject_test.txt: each row m represents a subject code which is linked to the m-th observation in the X_test file
* X_test.txt: each row is an observation containing parameters provided by the Samsung device accelerometer
* y_test.txt: each row m is an activity code which is linked to the m-th observation in the X_test file

In addition to the files above, there are these 2 files:
* features.txt: contains the list of variables names in the X files
* activity_labels.txt: contains the list of activity codes and desciptions


### Description of the data transformations

The main transformations performed by the script are:
* update the column headers with meaningful values
* replace the activity codes with the activity descriptions
* merge the input datasets in one single dataset
* select the columns which match the mean/std requirement
* group the data by subject and activity
* apply the mean function to all the columns