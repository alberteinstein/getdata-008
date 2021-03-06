#### Codebook for "second_tidy_set.txt"

This data is a tidy data version of the original data found on https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

The description of the original data is found in the "README.txt" file within the UCI HAR Dataset folder. 

From the original data, the script "run_analysis.R" modifies it through:

1. Combining the files "train/X_train.txt"" and "test/X_test.txt" into one big file
2. The data from 1) is categorized into different activity levels using the files "train/y_train.txt" and "test/y_test.txt". This categorization is stored in a new colum called activity with levels 1 to 6 using integer numbers.
3. Columns from 1) are labeled using the data from the "features.txt" file
4. Activitation levels from 2) are labeled with the data from "activity_labels.txt" 
5. Using the data in files "train/subject_train.txt" and "test/subject_test.txt" the merged data is extended with one column that contains this information about the subject id for each row. This colum is called "subject_ID"
6. All the columns with names that contain "mean" are filtered from this combined data set together with the column activity and subject_ID.
7. Finally with the data set from 5) the mean over each column for every subject_ID and activity level is calculated and exported into the "second_tidy_set.txt" file.

This "second_tidy_set.txt" contains of these columns:
```str(second_tidy_set) ``` 


| data.frame:  180 obs. of  55 variables: |  |
| ------------------------------------- | ---------------------------------------------------- |
| $ tBodyAcc-mean()-X                   | num  0.281 0.281 0.281 0.281 0.281 ... |
| $ tBodyAcc-mean()-Y                   | num  -0.0194 -0.0194 -0.0194 -0.0194 -0.0194 ...|
| $ tBodyAcc-mean()-Z                   | num  -0.104 -0.104 -0.104 -0.104 -0.104 ...|
| $ tGravityAcc-mean()-X                | num  -0.345 -0.345 -0.345 -0.345 -0.345 ...|
| $ tGravityAcc-mean()-Y                | num  0.733 0.733 0.733 0.733 0.733 ...|
| $ tGravityAcc-mean()-Z                | num  0.681 0.681 0.681 0.681 0.681 ...|
| $ tBodyAccJerk-mean()-X               | num  0.0752 0.0752 0.0752 0.0752 0.0752 ...|
| $ tBodyAccJerk-mean()-Y               | num  0.0108 0.0108 0.0108 0.0108 0.0108 ...|
| $ tBodyAccJerk-mean()-Z               | num  -0.000374 -0.000374 -0.000374 -0.000374 -0.000374 ...|
| $ tBodyGyro-mean()-X                  | num  -0.0268 -0.0268 -0.0268 -0.0268 -0.0268 ...|
| $ tBodyGyro-mean()-Y                  | num  -0.0761 -0.0761 -0.0761 -0.0761 -0.0761 ...|
| $ tBodyGyro-mean()-Z                  | num  0.0938 0.0938 0.0938 0.0938 0.0938 ...|
| $ tBodyGyroJerk-mean()-X              | num  -0.102 -0.102 -0.102 -0.102 -0.102 ...|
| $ tBodyGyroJerk-mean()-Y              | num  -0.0385 -0.0385 -0.0385 -0.0385 -0.0385 ...|
| $ tBodyGyroJerk-mean()-Z              | num  -0.0596 -0.0596 -0.0596 -0.0596 -0.0596 ...|
| $ tBodyAccMag-mean()                  | num  -0.97 -0.97 -0.97 -0.97 -0.97 ...|
| $ tGravityAccMag-mean()               | num  -0.97 -0.97 -0.97 -0.97 -0.97 ...|
| $ tBodyAccJerkMag-mean()              | num  -0.979 -0.979 -0.979 -0.979 -0.979 ...|
| $ tBodyGyroMag-mean()                 | num  -0.962 -0.962 -0.962 -0.962 -0.962 ...|
| $ tBodyGyroJerkMag-mean()             | num  -0.985 -0.985 -0.985 -0.985 -0.985 ...|
| $ fBodyAcc-mean()-X                   | num  -0.975 -0.975 -0.975 -0.975 -0.975 ...|
| $ fBodyAcc-mean()-Y                   | num  -0.96 -0.96 -0.96 -0.96 -0.96 ...|
| $ fBodyAcc-mean()-Z                   | num  -0.97 -0.97 -0.97 -0.97 -0.97 ...|
| $ fBodyAcc-meanFreq()-X               | num  -0.223 -0.223 -0.223 -0.223 -0.223 ...|
| $ fBodyAcc-meanFreq()-Y               | num  0.0706 0.0706 0.0706 0.0706 0.0706 ...|
| $ fBodyAcc-meanFreq()-Z               | num  0.23 0.23 0.23 0.23 0.23 ...|
| $ fBodyAccJerk-mean()-X               | num  -0.977 -0.977 -0.977 -0.977 -0.977 ...|
| $ fBodyAccJerk-mean()-Y               | num  -0.972 -0.972 -0.972 -0.972 -0.972 ...|
| $ fBodyAccJerk-mean()-Z               | num  -0.976 -0.976 -0.976 -0.976 -0.976 ...|
| $ fBodyAccJerk-meanFreq()-X           | num  0.041 0.041 0.041 0.041 0.041 ...|
| $ fBodyAccJerk-meanFreq()-Y           | num  -0.142 -0.142 -0.142 -0.142 -0.142 ...|
| $ fBodyAccJerk-meanFreq()-Z           | num  0.0651 0.0651 0.0651 0.0651 0.0651 ...|
| $ fBodyGyro-mean()-X                  | num  -0.972 -0.972 -0.972 -0.972 -0.972 ...|
| $ fBodyGyro-mean()-Y                  | num  -0.968 -0.968 -0.968 -0.968 -0.968 ...|
| $ fBodyGyro-mean()-Z                  | num  -0.968 -0.968 -0.968 -0.968 -0.968 ...|
| $ fBodyGyro-meanFreq()-X              | num  -0.0662 -0.0662 -0.0662 -0.0662 -0.0662 ...|
| $ fBodyGyro-meanFreq()-Y              | num  -0.24 -0.24 -0.24 -0.24 -0.24 ...|
| $ fBodyGyro-meanFreq()-Z              | num  0.0675 0.0675 0.0675 0.0675 0.0675 ...|
| $ fBodyAccMag-mean()                  | num  -0.963 -0.963 -0.963 -0.963 -0.963 ...|
| $ fBodyAccMag-meanFreq()              | num  0.176 0.176 0.176 0.176 0.176 ...|
| $ fBodyBodyAccJerkMag-mean()          | num  -0.97 -0.97 -0.97 -0.97 -0.97 ...|
| $ fBodyBodyAccJerkMag-meanFreq()      | num  0.172 0.172 0.172 0.172 0.172 ...|
| $ fBodyBodyGyroMag-mean()             | num  -0.962 -0.962 -0.962 -0.962 -0.962 ...|
| $ fBodyBodyGyroMag-meanFreq()         | num  -0.0802 -0.0802 -0.0802 -0.0802 -0.0802 ...|
| $ fBodyBodyGyroJerkMag-mean()         | num  -0.978 -0.978 -0.978 -0.978 -0.978 ...|
| $ fBodyBodyGyroJerkMag-meanFreq()     | num  0.107 0.107 0.107 0.107 0.107 ...|
| $ angle(tBodyAccMean,gravity)         | num  -0.0106 -0.0106 -0.0106 -0.0106 -0.0106 ...|
| $ angle(tBodyAccJerkMean),gravityMean)| num  0.0369 0.0369 0.0369 0.0369 0.0369 ...|
| $ angle(tBodyGyroMean,gravityMean)    | num  0.0372 0.0372 0.0372 0.0372 0.0372 ...|
| $ angle(tBodyGyroJerkMean,gravityMean)| num  0.0174 0.0174 0.0174 0.0174 0.0174 ...|
| $ angle(X,gravityMean)                | num  0.5 0.5 0.5 0.5 0.5 ...|
| $ angle(Y,gravityMean)                | num  -0.492 -0.492 -0.492 -0.492 -0.492 ...|
| $ angle(Z,gravityMean)                | num  -0.507 -0.507 -0.507 -0.507 -0.507 ...|
| $ activity                            | Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...|
| $ subject_ID                          | Factor w/ 30 levels "1","10","11",..: 12 25 30 2 4 5 10 13 17 1 ...| 
