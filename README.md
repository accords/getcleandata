###Getting and Cleaning Data
*by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD*
Repo: getcleandata
File: *README.md (https://github.com/accords/getcleandata/edit/master/README.md)*

Repo Content: *README.md, CookBook.md, run_analysis.R, Tidy_DS_PersonActivity_avg.csv*
Purpose: `README.md` - this file
         `CookBook.md` - data dictionary. Description of variables from tidy data set file Tidy_DS_PersonActivity_avg.csv
         `Tidy_DS_PersonActivity_avg.csv` - a tidy data set file
         `run_analysis.R` - R code that creates tidy data set file, 
####The Project
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 


####The solution
`run_analysis.R` that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The first function, `makeVector` creates a special "vector", which is
really a list containing a function to

1.  set the value of the vector
2.  get the value of the vector
3.  set the value of the mean
4.  get the value of the mean

<!-- -->


