###Getting and Cleaning Data
*by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD*
Repo: getcleandata
File: *README.md (https://github.com/accords/getcleandata/edit/master/README.md)*

Repo Content: *README.md, CookBook.md, run_analysis.R, Tidy_DS_PersonActivity_avg.csv*
Purpose:
         * `README.md` - this file
         * `CookBook.md` - data dictionary. Description of variables from tidy data set file Tidy_DS_PersonActivity_avg.csv
         * `Tidy_DS_PersonActivity_avg.csv` - a tidy data set file
          *`run_analysis.R` - R code that creates tidy data set file, 
####The Project
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 


####The Solution
`run_analysis.R` that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####The Steps in Creating Tidy Data Set
The following steps are taken during the tidy data set creation:
1. Activity labels data set is loaded separately.
2. Training and testing subject and activity data sets are loaded separately.
3. Training and testing feature data sets are loaded separately
4. Only necessary columns (data.frame variables) from Training and testing feature data sets are loaded. These columns are feature column names that contain word `std` or `mean`
5.  Activity numbers from activity data set are updated using activity labels.
6.  Feature variable (column) names are updated applying R data.frame naming convention. Note: characters '-','()' are deleted and '.' is applied.
6.  All data sets are merged using 'cbind'
7.  Training and testing data.frames are merged using `rbind`
8.  Final tidy data set (saved in file: `Tidy_DS_PersonActivity_avg.csv`) is created and based on single data set from above step #6.
9.  Mean function is applyed on each and separate feature variable and for different groups {subject, activity}
10.  Variable (column) names are updated using existing names and concatenated them by 'PerActAvg'
8.  Final tidy data set is created and based on single data set from above step #6

### Note to evaluator:
          As this is not the R coding  project, my primary goal was to apply the coding style that, 
          I hope, simplifies the evaluation process
          As result, you will find a redundancy and repetition.
          In return, the evaluation, supported by comments, should be simple and from top to bottom.

####`run_analysis.R` functions. 
 File   : run_analysis.R
 By     : accords
 github : https://github.com/accords/getcleandata
 Content:
    Function: createDF.tidy.avg()
    Returns : data.frame (merged training and testing tidy data sets)
    Purpose : To create tidy data set with the average of each variable per activity and subject
              This function depends on function createDF.merged()
              Note that createDF.merged depends on functions createDF.train() and createDF.test()   
    
    Function: createDF.from.merged()
    Returns : data.frame (merged training and testing tidy data sets)
              creates a text file 'Tidy_DS_PersonActivity_avg.csv'
    Purpose : Merges the training and the testing tidy sets and creates one data set.
              This function depends on functions createDF.train() and createDF.test()   
    
    Function: createDF.test()
    Returns : data.frame (testing tidy data set)
    Purpose : Loading test observation data from csv files. 
              Only csv file variables (columns) that are corresponding 
              to std() mean() calculations are loaded.
    
    Function: createDF.train()
    Returns : data.frame (training tidy data set)
    Purpose : Loading train observation data from csv files. 
              Only csv file variables (columns) that are corresponding 
              to std() mean() calculations are loaded.

