#The script "run_analysis.R" performs operations to get a clean and tiny data set from the fallowing data source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Usage:
The script has to be in the following folder-structure:
  - run_analysis.R
  - features.txt
  - activity_labels.txt
  - train
    - X_train.txt
    - subject_train.txt
    - y_train.txt
  - test
    - X_test.txt
    - subject_test.txt
    - y_test.txt

To run the script you have to call the function "run_analysis" without any arguments.
As an output you get a clean and tiny dataset.