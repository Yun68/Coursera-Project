run_analysis <- function(){
  ## This function reads 7 data files related human activity, work with them, 
  ## and produce a cleaned set of data
  
  library(reshape2)
  library(dplyr)
  
  SubjectTest <- read.table("./data10/subject_test.txt")
  SubjectTest <- rename(SubjectTest, subject = V1)
  ## Reads participants for test group and change the variable name to subjects 
  
  MeasureTest <- read.table("./data10/X_test.txt")
  ## Reads measurement data for test group
  
  Features <- read.table("./data10/features.txt")
  ExtractColumns <- grep("mean|std", Features$V2)
  ## Reads features data and identify columns that includes the words 'mean' or "std"
  
  MeasureTest <- MeasureTest[, ExtractColumns]
  ## Extracts only the meausrement on the mean and standard deviation
  
  ActivityTest <- read.table("./data10/y_test.txt")
  ActivityTest <- rename(ActivityTest, activity = V1)
  ## Reads activities for test group and change the variable name 
  
  TestData <- cbind(SubjectTest, MeasureTest, ActivityTest)
  ## Create a single file for test group by column binding
  
  SubjectTrain <- read.table("./data10/subject_train.txt")
  SubjectTrain <- rename(SubjectTrain, subject = V1)
  MeasureTrain <- read.table("./data10/X_train.txt")
  MeasureTrain <- MeasureTrain[, ExtractColumns]
  ActivityTrain <- read.table("./data10/y_train.txt")
  ActivityTrain <- rename(ActivityTrain, activity = V1)
  TrainData <- cbind(SubjectTrain, MeasureTrain, ActivityTrain)
  
  ## Repeats for training data and creates a single file for training group
  
  Data <- rbind(TestData, TrainData)
  ## Creates one data set by merging test data and training data
  
  Data$activity <- factor(Data$activity, labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITING","STANDING","LAYING"))
  ## Changes the numeric activity into descriptive activity names
  
  FeatureNames <- grep("mean|std", Features$V2, value = TRUE)
  ## identify specific featurename for the measurements on the mean and standard deviation
  
  names(Data)[2:80] <- FeatureNames
  ## Use descriptive variable names for measurements
  
  DataMelt <- melt(Data, id = c("subject","activity"), measure.vars = FeatureNames)
  ReducedData <- dcast(DataMelt, subject + activity ~ variable, mean)
  ## Melts data to calculate the average of each measurements for each subject and activity
  
  write.table(ReducedData, "./data10/ReducedData.txt", sep = ",")
  ## make outoutfile into more readable format
  
}
  