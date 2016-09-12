# Code Book - Getting_and_Cleaning_data - Programming assignment

This document describes the code of run_analysis.R, which was generated for the Programming Assignment of the Coursera Course "Getting and Cleaning Data" as well as the output file with its generated and transformed variables.

## Data set and Codebook
The raw data set used as input data for this assignment is provided via the following link: 
* Data file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* CodeBook: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

In this data set the measured raw data was provided for both testing and training data sets in the folder `../Inertial Signals`. But this data was already preprocessed and certain extracted features were provided in some preprocessed files. These data files were used for the assignment:  

* `X_train.txt` and `X_test.txt`: containing the feature measurements
* `y_train.txt` and `y_test.txt`: containing the activity labels corresponding to the rows of `X_train` and `X_test`
* `subject_test.txt` and `subject_train.txt`: containing the subjects from which the measurements were taken corresponding to the rows of `X_train` and `X_test`. 
* `features.txt`: variable names for describing the kind of measurement/feature
* `activity_labels.txt`: Link between activity ids and descriptive name of the activity

## Code description
The code within run_analysis.R can be separated in a few sections, which was highlighted via comments at the beginning of each section:

* Downloading, unzipping and loading data
* Extracting and transforming relevant variables
* Manipulating data (Merging and transforming/averaging)
* Writing final data to txt file

### Downloading, unzipping and loading data
* Downloads and unzips the UCI HAR dataset `fileURL`, if the data set `filename` is not yet existing in the current working directory
* Reads in "features.txt" into `features` and "activity_labels.txt" into `activity_labels`, which contain informations on kind of measurement (variables) and activity. With these informations data columns can be named with its appropriate variable name and activity labels can be transformed into descriptive names.

### Extracting and transforming relevant variables
* Extracts variable names of all measurements on the mean and standard deviation for each measurement `features_selected_names`. With those names the proper columns can be selected out of the data set.
* Transforms the selected variable names to proper descriptive variable names for labeling the data set.

### Manipulating data (Merging and transforming/averaging)
* Merges the training and testing data set by first loading both data sets in `measurements_test` and `measurements_train`, extracting the needed columns in both data sets `measurements_test_selected` and `measurements_test_selected` and merges both adapted sets `test` and `train` into `selected_data` with adding the descriptive column labels `features_selected_names`.
* Calculates the average of the selected columns stored in `selected data` via melting the data set along 2 factors Subject and Activity into `selected_data_melted` and averages for each Subject/Activity pair, storeing it in `selected_data_average`.  
It looks like this:  

  `Subject Activity           tBodyAcc_Mean_X   tBodyAcc_Mean_Y      tBodyAcc_Mean_Z    `  
  `1       WALKING            0.277330758736842 -0.0173838185273684  -0.111148103547368 `   
  `1       WALKING_UPSTAIRS   0.255461689622641 -0.0239531492643396  -0.0973020020943396`  
  `1       WALKING_DOWNSTAIRS 0.289188320408163 -0.00991850461020408 -0.107566190908163`  

### Writing final data to txt file
* Writes the `selected_data_average` data to the outputfile "tidy.txt" in the current working directory.
        
        
## Variables description

All used variable names in alphabetical order with short descriptions:

`activities_test` : data.frame; Activity labels encoded as numbers of the testing data set  
`activities_train` : data.frame; Activity labels encoded as numbers of the training data set  
`activity_labels` : data.frame; Transformation table activity label numbers to descriptive name  
`features` : data.frame; Feature names corresponding to the columns in X_train and X_test data sets  
`features_selected` : integer; All row ids selected out of `features`, with feature names that are linked to measurements on the mean or standard deviation           
`features_selected_names` : character; All feature names, that are linked to a measurement on the mean or standard deviation        
`filename` : character; Filename of the zip file to be downloaded                      
`fileURL` : character; URL of the zip file to be downloaded                      
`measurements_test` : data.frame; All preprocessed measurements of the testing data set           
`measurements_test_selected` : data.frame; Only selected preprocessed measurements of the testing data set  
`measurements_train` : data.frame; All preprocessed measurements of the training data set          
`measurements_train_selected` : data.frame; Only selected preprocessed measurements of the training data set 
`selected_data` : data.frame; Merged training and testing data set; only selected features            
`selected_data_average` : data.frame; Output data set with the average of all selected features per Subject/Activity pair         
`selected_data_melted` : data.frame; Transformed (melted) data set based on the 2 factors Subject and Activity          
`subjects_test` : data.frame; Subject ids of the testing data set                
`subjects_train` : data.frame; Subject ids of the training data set              
`test` : data.frame; Selected features of the testing data set with Subject id, Activity and selected measurements (only on mean and standard deviation)                      
`train` : data.frame; Selected features of the training data set with Subject id, Activity and selected measurements (only on mean and standard deviation)                


        
## Final data set
The final data set stored in the file "tidy.txt" consists of 181 rows (header + 180 Subject/Activity pair combinations) and 81 columns (Subject, Activity + 79 variables). It contains the averaged data of the following observed variables for each Subject/Activity pair:

 * tBodyAcc_Mean_X               
 * tBodyAcc_Mean_Y               
 * tBodyAcc_Mean_Z               
 * tBodyAcc_Std_X               
 * tBodyAcc_Std_Y                
 * tBodyAcc_Std_Z               
 * tGravityAcc_Mean_X           
 * tGravityAcc_Mean_Y            
 * tGravityAcc_Mean_Z            
 * tGravityAcc_Std_X            
 * tGravityAcc_Std_Y             
 * tGravityAcc_Std_Z            
 * tBodyAccJerk_Mean_X          
 * tBodyAccJerk_Mean_Y           
 * tBodyAccJerk_Mean_Z        
 * tBodyAccJerk_Std_X           
 * tBodyAccJerk_Std_Y           
 * tBodyAccJerk_Std_Z            
 * tBodyGyro_Mean_X             
 * tBodyGyro_Mean_Y             
 * tBodyGyro_Mean_Z              
 * tBodyGyro_Std_X               
 * tBodyGyro_Std_Y               
 * tBodyGyro_Std_Z              
 * tBodyGyroJerk_Mean_X          
 * tBodyGyroJerk_Mean_Y          
 * tBodyGyroJerk_Mean_Z          
 * tBodyGyroJerk_Std_X           
 * tBodyGyroJerk_Std_Y           
 * tBodyGyroJerk_Std_Z          
 * tBodyAccMag_Mean             
 * tBodyAccMag_Std               
 * tGravityAccMag_Mean          
 * tGravityAccMag_Std            
 * tBodyAccJerkMag_Mean         
 * tBodyAccJerkMag_Std           
 * tBodyGyroMag_Mean             
 * tBodyGyroMag_Std              
 * tBodyGyroJerkMag_Mean         
 * tBodyGyroJerkMag_Std         
 * fBodyAcc_Mean_X               
 * fBodyAcc_Mean_Y               
 * fBodyAcc_Mean_Z               
 * fBodyAcc_Std_X                
 * fBodyAcc_Std_Y                
 * fBodyAcc_Std_Z               
 * fBodyAcc_Mean_FreqX          
 * fBodyAcc_Mean_FreqY           
 * fBodyAcc_Mean_FreqZ           
 * fBodyAccJerk_Mean_X           
 * fBodyAccJerk_Mean_Y          
 * fBodyAccJerk_Mean_Z           
 * fBodyAccJerk_Std_X            
 * fBodyAccJerk_Std_Y            
 * fBodyAccJerk_Std_Z            
 * fBodyAccJerk_Mean_FreqX       
 * fBodyAccJerk_Mean_FreqY      
 * fBodyAccJerk_Mean_FreqZ      
 * fBodyGyro_Mean_X              
 * fBodyGyro_Mean_Y              
 * fBodyGyro_Mean_Z             
 * fBodyGyro_Std_X               
 * fBodyGyro_Std_Y               
 * fBodyGyro_Std_Z               
 * fBodyGyro_Mean_FreqX          
 * fBodyGyro_Mean_FreqY          
 * fBodyGyro_Mean_FreqZ         
 * fBodyAccMag_Mean              
 * fBodyAccMag_Std               
 * fBodyAccMag_Mean_Freq         
 * fBodyBodyAccJerkMag_Mean      
 * fBodyBodyAccJerkMag_Std       
 * fBodyBodyAccJerkMag_Mean_Freq  
 * fBodyBodyGyroMag_Mean         
 * fBodyBodyGyroMag_Std         
 * fBodyBodyGyroMag_Mean_Freq    
 * fBodyBodyGyroJerkMag_Mean     
 * fBodyBodyGyroJerkMag_Std     
 * fBodyBodyGyroJerkMag_Mean_Freq
