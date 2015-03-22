#   File: run_analysis.R
#     By: accords
# github: https://github.com/accords/getcleandata
#
#
# Note to evaluator:
#          As this is not the R coding  project, my primary goal was to apply the coding style that, 
#          I hope, simplifies the evaluation process
#          As result, you will find a redundancy and repetition.
#          In return, the evaluation, supported by comments, should be simple and from top to bottom.

createDF.train <- function(){

   # Function: createDF.train()
   # Returns : data.frame (training tidy data set)
   # Purpose : Loading train observation data from csv files. 
   #           Only csv file variables (columns) that are corresponding 
   #           to std() mean() calculations are loaded.
   # By      : accords

   
   # 1. IN FOLLOWING SECTION LOCAL CONSTANT VARIABLES ARE CREATED
   # 1.a File name: activity labels
   fnames_ActivityLabels <- c("./activity_labels.txt")
   
   # 1.b File name: features
   fnames_Features <- c("./features.txt")
   
   # 1.c File names: training set
   fnames_trainSet <- c("./subject_train.txt"
                       ,"./y_train.txt"
                       ,"./X_train.txt")
   
   # 2. IN FOLLOWING SECTION THE TRAINING SET IS CREATED
   # 2.e Reading features from the file
   vFeaturesALL <- read.csv(fnames_Features, sep="", header = FALSE, quote = "", colClasses = c("integer","character"))
   #   - only features related to std() and mean() calculations are used. The following subsets them from all available features.
   vFeatures <- vFeaturesALL[grep('std|mean' ,vFeaturesALL[,2]),]
   #   - generating local variable colClassesInclude. It will be used in read.csv() so that only needed columns are fetched from csv file.
   colClassesInclude <- replace(rep("NULL",nrow(vFeaturesALL)),vFeatures[,1],NA)

   # 2.a Reading training sets and creating single training set data.frame
   #   - note that a local variable 'fnames_trainSet' from above is used.
   for ( i in 1:length(fnames_trainSet)) {
     if (i==1 | i==2) {
       dt <- read.csv(fnames_trainSet[i], sep="", header = FALSE, quote = "")
     } 
     else {
       # note that local variable 'colClassesInclude' directs the selection of csv file columns.
       dt <- read.csv(fnames_trainSet[i], sep="", header = FALSE, quote = "", colClasses=colClassesInclude)
     } 
     if (i==1) {
       DtrainSet <- dt 
     }
     else {
       DtrainSet <- cbind(DtrainSet,dt)
     }
   }
   
   # 2.c Reading activity labels from the file
   vActivityLabels  <-  read.csv(fnames_ActivityLabels, sep="", header = FALSE
                                 ,quote = "",colClasses=c("integer","character"))
   
   # 2.d Substituting activity codes (the numbers) with activity labels (text)
   for (i in 1:nrow(DtrainSet)) {
       DtrainSet[i,2] <- vActivityLabels[DtrainSet[i,2],2]
   }

   # 2.e Generating variable (column) names.
   #     The order of column names below must not be changed. It depends on sequence of bindings from above (DtrainSet) 
   #     note that first two lines from below are updating feature names. The goal is to name variables as following R convention.
   vFeatures[,2] <- gsub('-','.',vFeatures[,2])
   vFeatures[,2] <- gsub("\\(\\)",'',vFeatures[,2])
   colNames  <-  c("person.Number", "activity.Name", vFeatures[,2])

   
   # 2.g Assigning column names to data frame 
   names(DtrainSet) <- colNames


   # FINAL STEP
   # 4.A Return unified result by binding two data frames
   #return(cbind(DtrainSet,DtrainSignals))
   return(DtrainSet)
 }


createDF.test <- function(){

   # Function: createDF.test()
   # Returns : data.frame (testing tidy data set)
   # By      : accords
   # Purpose : Loading test observation data from csv files. 
   #           Only csv file variables (columns) that are corresponding 
   #           to std() mean() calculations are loaded.
   # By      : accords

   
   # 1. IN FOLLOWING SECTION LOCAL CONSTANT VARIABLES ARE CREATED
   # 1.a File name: activity labels
   fnames_ActivityLabels <- c("./activity_labels.txt")
   
   # 1.b File name: features
   fnames_Features <- c("./features.txt")
   
   # 1.c File names: testing set
   fnames_testSet <- c("./subject_test.txt"
                       ,"./y_test.txt"
                       ,"./X_test.txt")
   
   # 2. IN FOLLOWING SECTION THE TESTING SET IS CREATED
   # 2.e Reading features from the file
   vFeaturesALL <- read.csv(fnames_Features, sep="", header = FALSE, quote = "", colClasses = c("integer","character"))
   #   - only features related to std() and mean() calculations are used. The following subsets them from all available features.
   vFeatures <- vFeaturesALL[grep('std|mean' ,vFeaturesALL[,2]),]
   #   - generating local variable colClassesInclude. It will be used in read.csv() so that only needed columns are fetched from csv file.
   colClassesInclude <- replace(rep("NULL",nrow(vFeaturesALL)),vFeatures[,1],NA)

   # 2.a Reading testing sets and creating single testing set data.frame
   #   - note that a local variable 'fnames_testSet' from above is used.
   for ( i in 1:length(fnames_testSet)) {
     if (i==1 | i==2) {
       dt <- read.csv(fnames_testSet[i], sep="", header = FALSE, quote = "")
     } 
     else {
       # note that local variable 'colClassesInclude' directs the selection of csv file columns.
       dt <- read.csv(fnames_testSet[i], sep="", header = FALSE, quote = "", colClasses=colClassesInclude)
     } 
     if (i==1) {
       DtestSet <- dt 
     }
     else {
       DtestSet <- cbind(DtestSet,dt)
     }
   }
   
   # 2.c Reading activity labels from the file
   vActivityLabels  <-  read.csv(fnames_ActivityLabels, sep="", header = FALSE
                                 ,quote = "",colClasses=c("integer","character"))
   
   # 2.d Substituting activity codes (the numbers) with activity labels (text)
   for (i in 1:nrow(DtestSet)) {
       DtestSet[i,2] <- vActivityLabels[DtestSet[i,2],2]
   }

   # 2.e Generating variable (column) names.
   #     The order of column names below must not be changed. It depends on sequence of bindings from above (DtestSet) 
   #     note that first two lines from below are updating feature names. The goal is to name variables as following R convention.
   vFeatures[,2] <- gsub('-','.',vFeatures[,2])
   vFeatures[,2] <- gsub("\\(\\)",'',vFeatures[,2])
   colNames  <-  c("person.Number", "activity.Name", vFeatures[,2])

   
   # 2.g Assigning column names to data frame 
   names(DtestSet) <- colNames


   # FINAL STEP
   # 4.A Return unified result by binding two data frames
    return(DtestSet)
 }

 
createDF.merged <- function(){

   # Function: createDF.from.merged()
   # Returns : data.frame (merged training and testing tidy data sets)
   #           creates a text file 'Tidy_DS_PersonActivity_avg.csv'
   # Purpose : Merges the training and the testing tidy sets and creates one data set.
   #           This function depends on functions createDF.train() and createDF.test()   
   # By      : accords

   
   # 1. One tidy data set is created. It is based on training and testing tidy data sets
   DF.train <- createDF.train()
   DF.test <- createDF.test()
   # DF.train.test <- rbind(DF.train, DF.test)
   return (rbind(DF.train, DF.test)) 
}

createDF.tidy.avg  <- function(file, sedCmd=NULL, ...){

   # Function: createDF.tidy.avg
   # Returns : data.frame (merged training and testing tidy data sets)
   # Purpose : To create tidy data set with the average of each variable per activity and subject
   #           This function depends on function createDF.merged()
   #           Note that createDF.merged depends on functions createDF.train() and createDF.test()   
   # By      : accords

   # dplyr package is in use.
   library(dplyr)
   
   # 1. One tidy data set is created. It is based on training and testing tidy data sets
   DF.merged <- createDF.merged()

   # 2. Group by is defined for each subject and each activity
   #    Note that variable names person.Number and activity.Name are defined and hard coded in
   #    functions createDF.train() and createDF.test() 
   #    The hard coding is not a good practice but I decided, for clarity purposes, not to apply better
   #    solution.   
   DF.merged.grouped <- DF.merged %>% group_by(person.Number, activity.Name)

   # 3. The average (mean) function as applied per above defined groups.
   DF.merged.grouped.mean <- DF.merged.grouped %>% summarise_each(funs(mean))

   # 4. Loop through column names and change it to appropriate names
   #    Note that current column names are suffixed by string 'PersActAvg" (average of person and activity) and separated by ".".
   #    First two columns are skipped.
   for (j in 3:ncol(DF.merged.grouped.mean)) names(DF.merged.grouped.mean)[j] <- paste(names(DF.merged.grouped.mean)[j],"PersActAvg", sep=".")
   
   # 5. Create text file (a.k.a save data set using requested function write.table()) 
   #    Note that this is required in course's project specs.
   write.table(DF.merged.grouped.mean, file="./Tidy_DS_PersonActivity_avg.csv", row.name=FALSE)

   # 6. Return resulting data set.
   #    Note that this is not required in course's project specs. but I think it makes perfect sense.
   return(DF.merged.grouped.mean)
 }
 
