Code Book 
========================================================

The original data are in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The linked data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

In the zip file there is the feature_info.txt file with the description of every single feature.

The following steps are performed from the **run_analysis.R** script

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3) Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names. 

5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


The following dataset are the output of the script

dataset_all_meanstd
--------------------
In the produced **dataset_all_meanstd** there are 68 variables and 10299 observations (the union of the train and test data)

Variables from 1 to 66 are extracted from the original 561 variables choosing only the columns where the name contains "mean()" and "std()". The name of these variables are the same of the corresponding feature name but replacing 
```{r}
"(" and ")" with ""  
"," and "-" with "_"
```

Variable 67 (ActivityType) is the label of the related activity

Variable 68 (subject) is the subject

This is the ordered list of the variables name:
```{r}
"tBodyAcc_mean_X","tBodyAcc_mean_Y","tBodyAcc_mean_Z",
"tBodyAcc_std_X","tBodyAcc_std_Y","tBodyAcc_std_Z",
"tGravityAcc_mean_X","tGravityAcc_mean_Y","tGravityAcc_mean_Z",
"tGravityAcc_std_X","tGravityAcc_std_Y","tGravityAcc_std_Z",
"tBodyAccJerk_mean_X","tBodyAccJerk_mean_Y","tBodyAccJerk_mean_Z",
"tBodyAccJerk_std_X","tBodyAccJerk_std_Y","tBodyAccJerk_std_Z",
"tBodyGyro_mean_X","tBodyGyro_mean_Y","tBodyGyro_mean_Z",
"tBodyGyro_std_X","tBodyGyro_std_Y","tBodyGyro_std_Z",
"tBodyGyroJerk_mean_X","tBodyGyroJerk_mean_Y","tBodyGyroJerk_mean_Z",
"tBodyGyroJerk_std_X","tBodyGyroJerk_std_Y","tBodyGyroJerk_std_Z",
"tBodyAccMag_mean","tBodyAccMag_std","tGravityAccMag_mean",
"tGravityAccMag_std","tBodyAccJerkMag_mean","tBodyAccJerkMag_std",
"tBodyGyroMag_mean","tBodyGyroMag_std","tBodyGyroJerkMag_mean",
"tBodyGyroJerkMag_std","fBodyAcc_mean_X","fBodyAcc_mean_Y",
"fBodyAcc_mean_Z","fBodyAcc_std_X","fBodyAcc_std_Y",
"fBodyAcc_std_Z","fBodyAccJerk_mean_X","fBodyAccJerk_mean_Y",
"fBodyAccJerk_mean_Z","fBodyAccJerk_std_X","fBodyAccJerk_std_Y",
"fBodyAccJerk_std_Z","fBodyGyro_mean_X","fBodyGyro_mean_Y",
"fBodyGyro_mean_Z","fBodyGyro_std_X","fBodyGyro_std_Y",
"fBodyGyro_std_Z","fBodyAccMag_mean","fBodyAccMag_std",
"fBodyBodyAccJerkMag_mean","fBodyBodyAccJerkMag_std","fBodyBodyGyroMag_mean",
"fBodyBodyGyroMag_std","fBodyBodyGyroJerkMag_mean","fBodyBodyGyroJerkMag_std",
"ActivityType","subject"
```

dataset_all_average
--------------------
In the produced **dataset_all_average** there are 68 variables and 180 observations
It is derived from dataset_all_meanstd with the average of each variable for each activity and each subject

Variable 1 is ActivityType 

Variable 2 is Subject 

Variables from 3 to 68 are related to the mean of the variables 1 to 66 of the dataset_all_meanstd. The name of these variables are the same of the corresponding original variable but with "MeanOf_" prefix 

This is the ordered list of the variables name:
```{r}
"Subject","MeanOf_tBodyAcc_mean_X","MeanOf_tBodyAcc_mean_Y","MeanOf_tBodyAcc_mean_Z","MeanOf_tBodyAcc_std_X",
"MeanOf_tBodyAcc_std_Y","MeanOf_tBodyAcc_std_Z","MeanOf_tGravityAcc_mean_X","MeanOf_tGravityAcc_mean_Y",
"MeanOf_tGravityAcc_mean_Z","MeanOf_tGravityAcc_std_X","MeanOf_tGravityAcc_std_Y","MeanOf_tGravityAcc_std_Z",
"MeanOf_tBodyAccJerk_mean_X","MeanOf_tBodyAccJerk_mean_Y","MeanOf_tBodyAccJerk_mean_Z",
"MeanOf_tBodyAccJerk_std_X","MeanOf_tBodyAccJerk_std_Y","MeanOf_tBodyAccJerk_std_Z",
"MeanOf_tBodyGyro_mean_X","MeanOf_tBodyGyro_mean_Y",
"MeanOf_tBodyGyro_mean_Z","MeanOf_tBodyGyro_std_X","MeanOf_tBodyGyro_std_Y","MeanOf_tBodyGyro_std_Z",
"MeanOf_tBodyGyroJerk_mean_X","MeanOf_tBodyGyroJerk_mean_Y","MeanOf_tBodyGyroJerk_mean_Z",
"MeanOf_tBodyGyroJerk_std_X","MeanOf_tBodyGyroJerk_std_Y","MeanOf_tBodyGyroJerk_std_Z",
"MeanOf_tBodyAccMag_mean","MeanOf_tBodyAccMag_std","MeanOf_tGravityAccMag_mean",
"MeanOf_tGravityAccMag_std","MeanOf_tBodyAccJerkMag_mean",
"MeanOf_tBodyAccJerkMag_std","MeanOf_tBodyGyroMag_mean","MeanOf_tBodyGyroMag_std",
"MeanOf_tBodyGyroJerkMag_mean","MeanOf_tBodyGyroJerkMag_std","MeanOf_fBodyAcc_mean_X",
"MeanOf_fBodyAcc_mean_Y","MeanOf_fBodyAcc_mean_Z","MeanOf_fBodyAcc_std_X","MeanOf_fBodyAcc_std_Y",
"MeanOf_fBodyAcc_std_Z","MeanOf_fBodyAccJerk_mean_X",
"MeanOf_fBodyAccJerk_mean_Y","MeanOf_fBodyAccJerk_mean_Z","MeanOf_fBodyAccJerk_std_X",
"MeanOf_fBodyAccJerk_std_Y","MeanOf_fBodyAccJerk_std_Z","MeanOf_fBodyGyro_mean_X",
"MeanOf_fBodyGyro_mean_Y","MeanOf_fBodyGyro_mean_Z",
"MeanOf_fBodyGyro_std_X","MeanOf_fBodyGyro_std_Y","MeanOf_fBodyGyro_std_Z","MeanOf_fBodyAccMag_mean",
"MeanOf_fBodyAccMag_std","MeanOf_fBodyBodyAccJerkMag_mean","MeanOf_fBodyBodyAccJerkMag_std",
"MeanOf_fBodyBodyGyroMag_mean","MeanOf_fBodyBodyGyroMag_std","MeanOf_fBodyBodyGyroJerkMag_mean",
"MeanOf_fBodyBodyGyroJerkMag_std"
```




