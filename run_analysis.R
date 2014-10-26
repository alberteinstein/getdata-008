##  This script will do the following:
##  (1) Merges the training and the test sets to create one data set.
##  (2) Extracts only the measurements on the mean and standard deviation for each measurement. 
##  (3) Uses descriptive activity names to name the activities in the data set
##  (4) Appropriately labels the data set with descriptive variable names. 
##  (5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##  The supplied README.txt from the data set provides information about the filenames:
##  'train/X_train.txt': Training set.
##  'test/X_test.txt': Test set.

training_set<-read.table("UCI HAR Dataset/train/X_train.txt")
test_set<-read.table("UCI HAR Dataset/test/X_test.txt")

##  Each row of the data sets correspond to a specific activity that is stored in:
##  'train/y_train.txt': Training labels.
##  'test/y_test.txt': Test labels.

training_labels<-read.table("UCI HAR Dataset/train/y_train.txt")
test_labels<-read.table("UCI HAR Dataset/test/y_test.txt")

##  Each row can be linked to one of the 30 subjects of the study. Load this data:
training_subjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
test_subjects<-read.table("UCI HAR Dataset/test//subject_test.txt")

##  We use the dplyr package to manipulate the data

library(dplyr)

##  Combine the data entries with the activity labels

training_set<-mutate(training_set,activity=as.factor(training_labels[,1]),subject_ID=as.factor(training_subjects[,1]))
test_set<-mutate(test_set,activity=as.factor(test_labels[,1]),subject_ID=as.factor(test_subjects[,1]))

##  Rename the activity levels --> (3)

activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
levels(training_set$activity)<-activity_labels$V2
levels(test_set$activity)<-activity_labels$V2

##  Each column of these data sets can be labeled using the provided feature labels

features<-read.table("UCI HAR Dataset/features.txt")

##  Rename the sets --> (4)

names(training_set)<-c(as.character(features[,2]),"activity","subject_ID")
names(test_set)<-c(as.character(features[,2]),"activity","subject_ID")

##  Merge both set to generate one big data set. --> (1)

merged_set<-rbind(test_set,training_set)

##  Extract only the measurements on the mean and standard deviation for each measurement. --> (2)
##  Find all the features with the string "mean"

mean_ids<<-grep("mean",as.character(features[,2]),ignore.case=TRUE)

##  Add the activity and subject_ID columns into the extracted data  

extract<-merged_set[,c(mean_ids,562,563)]


##  Now prepare the second tidy data set --> (5)

second_tidy_set<-data.frame()
factor_levels<-character()

##  Average each Variable for each activity and subject_id

for (i in levels(extract$activity))
{
    for (j in levels(extract$subject_ID))
    {
        ##  subset the data for a the level of activity and subject_id
        subset<-extract[extract$activity==i & extract$subject_ID==j,]
        ##  Calculate the Mean of every column
        column_means<-rbind(second_tidy_set,colMeans(subset[,1:53]))
        factor_levels<-rbind(factor_levels,c(i,j))
    }
}

##  Combine and label the columns 

second_tidy_set<-data.frame(column_means,factor_levels)
names(second_tidy_set)<-names(extract)
  
##  Write this frame as a .txt file

write.table(second_tidy_set,file="second_tidy_set.txt",row.names=FALSE,col.names=TRUE)

