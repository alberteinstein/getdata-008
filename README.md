#### Description of run_analysis.R

This script will output a file "second_tidy_set.txt" when it is run with the original data set downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip present in the working directory. 

To run this script, copy the data above data into the folder where this script is located. Change the working directory within R to this folder using the *setwd()* command with the folder as an argument. The command *source(run_analysis.R)* will then run the script and will finally output the "second_tidy_set.txt" file requested for the getdata-008 coursera project. 

Part of this project submission is also a file "CodeBook.md" that describes the variables, the data, and any transformations or work that this script performes to clean up the data.