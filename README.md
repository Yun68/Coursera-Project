# Getting and Cleaning the Assignment
This repository is meant to submit the assignment for getting and cleaning data science in coursera. 

The project is to read human activity recognition dataset measured by smartphones and produce a cleaned set of data with descriptive variable names. 

Original dataset consists of 561 different measurements related to 6 activities(ex. walking, standing, laying, etc.) for 30 people. But the data is partitioned into two sets of participants, (1) test group and (2) training group. For each group, feature measurement data and activity types are stored in separate files. 

Assignment is, first to merge the separate data files containing subjects, features, and activities into a single data set and then extract only the particular measurements and provide a second tidy data set with average of each measurements for each person and each activity. Use of descriptive variable names and descriptive activity names are necessary. 
For this project, library(dplyr) and library(reshape2) were used to change the variable names to descriptive names and melt data and cast and rearrange them according to people and activity. 

Final tidy data set is 180 observations of 81 variables.
Each column represents each variable and each row represents each observation.

Column information is as follows:
Column 1: subject serial number from 1 to 30.
Column 2: activity with WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
Column 3 ~ 81: average value of each feature that includes mean() or std() in feature information as mean and standard deviation are the main interests.
