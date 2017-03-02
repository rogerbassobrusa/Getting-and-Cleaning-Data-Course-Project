## Script description

### The script performs these operations:

1. set a working directory (commented)
2. download the zip file (commented)
3. load the data file into R
4. update the variable names of the X files from the features file
5. update the variable name of the subject file
6. replace the activity codes in the y files with their description read from the activity file 
7. update the variable name of the activity file and keep only the description column
8. merge the files into a single dataset
9. create a vector with the column names to keep using regex
10. select these columns from the merged dataset (plus the subject and activity columns)
11. group the data by subject and activity with dplyr
12. apply the mean to all columns using summarise