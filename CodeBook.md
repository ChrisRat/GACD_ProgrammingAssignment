You can find the source data and its description here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script "run_analysis.R" performs the fallowing operations:

1. Read and merge the training data and the test data to one data set. 
This includes the following files:
  - features.txt
  - activity_labels.txt
  - train/X_train.txt
  - train/subject_train.txt
  - train/y_train.txt
  - test/X_test.txt
  - test/subject_test.txt
  - test/y_test.txt
  
The data from "subject_train.txt" and "subject_test.txt" is merged to a column with name "Subject".
The data from "y_train.txt" and "y_test.txt" is merged to a column with name "Activity".
The names for the other colums are from the file "activity_labels.txt".
Character-columns are not converted to factors during the read operation.

2. Extraction of all columns which contain mean-values or standard deviation values.
	The columns are selected by searching for the strings "-mean" and "-std" in the column name. This includes columns with names containing "meanFreq".
	The columns "Activity" and "Subject" are also extracted. This leads to a data set with 81 columns.
	
3. Replacing the numerical values in the column "Activity" with the corresponding character values from the file "activity_labels.txt".
	In addition the replaced values are converted to variables of type "factor".
	
4. Rename the column names with more descriptive ones.
	Therefore all brackets in the column names are removed.
	
5. The data set is grouped by "Subject" and "Activity". Foreach Subject-Activity-pair the mean of all other columns is calculated.
	This new clean and tiny data set is returned.
	
The returned data set has the fallowing 81 columns:

  - Subject
  - Activity
  - tBodyAcc-mean-X
  - tBodyAcc-mean-Y              
  - tBodyAcc-mean-Z
  - tBodyAcc-std-X                
  - tBodyAcc-std-Y                
  - tBodyAcc-std-Z               
  - tGravityAcc-mean-X            
  - tGravityAcc-mean-Y
  - tGravityAcc-mean-Z 
  - tGravityAcc-std-X            
  - tGravityAcc-std-Y
  - tGravityAcc-std-Z
  - tBodyAccJerk-mean-X
  - tBodyAccJerk-mean-Y          
  - tBodyAccJerk-mean-Z
  - tBodyAccJerk-std-X
  - tBodyAccJerk-std-Y
  - tBodyAccJerk-std-Z          
  - tBodyGyro-mean-X
  - tBodyGyro-mean-Y
  - tBodyGyro-mean-Z              
  - tBodyGyro-std-X              
  - tBodyGyro-std-Y
  - tBodyGyro-std-Z
  - tBodyGyroJerk-mean-X
  - tBodyGyroJerk-mean-Y         
  - tBodyGyroJerk-mean-Z
  - tBodyGyroJerk-std-X           
  - tBodyGyroJerk-std-Y
  - tBodyGyroJerk-std-Z          
  - tBodyAccMag-mean              
  - tBodyAccMag-std               
  - tGravityAccMag-mean           
  - tGravityAccMag-std           
  - tBodyAccJerkMag-mean
  - tBodyAccJerkMag-std
  - tBodyGyroMag-mean             
  - tBodyGyroMag-std             
  - tBodyGyroJerkMag-mean         
  - tBodyGyroJerkMag-std          
  - fBodyAcc-mean-X               
  - fBodyAcc-mean-Y              
  - fBodyAcc-mean-Z               
  - fBodyAcc-std-X
  - fBodyAcc-std-Y                
  - fBodyAcc-std-Z               
  - fBodyAcc-meanFreq-X
  - fBodyAcc-meanFreq-Y
  - fBodyAcc-meanFreq-Z
  - fBodyAccJerk-mean-X          
  - fBodyAccJerk-mean-Y
  - fBodyAccJerk-mean-Z
  - fBodyAccJerk-std-X
  - fBodyAccJerk-std-Y           
  - fBodyAccJerk-std-Z
  - fBodyAccJerk-meanFreq-X
  - fBodyAccJerk-meanFreq-Y
  - fBodyAccJerk-meanFreq-Z      
  - fBodyGyro-mean-X
  - fBodyGyro-mean-Y
  - fBodyGyro-mean-Z
  - fBodyGyro-std-X              
  - fBodyGyro-std-Y
  - fBodyGyro-std-Z
  - fBodyGyro-meanFreq-X
  - fBodyGyro-meanFreq-Y         
  - fBodyGyro-meanFreq-Z
  - fBodyAccMag-mean          
  - fBodyAccMag-std
  - fBodyAccMag-meanFreq         
  - fBodyBodyAccJerkMag-mean     
  - fBodyBodyAccJerkMag-std       
  - fBodyBodyAccJerkMag-meanFreq  
  - fBodyBodyGyroMag-mean        
  - fBodyBodyGyroMag-std         
  - fBodyBodyGyroMag-meanFreq     
  - fBodyBodyGyroJerkMag-mean     
  - fBodyBodyGyroJerkMag-std     
  - fBodyBodyGyroJerkMag-meanFreq

Each of these columns is the mean grouped by Activity and Subject.
The detailled description of these columns is part of the zip file of the original data source.