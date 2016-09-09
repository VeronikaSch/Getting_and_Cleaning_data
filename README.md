# Getting_and_Cleaning_data - Programming assignment

This is the README.md for the Programming Assignment of the Coursera Course "Getting and Cleaning Data"

The scripts provided are the following:

* run_analysis.R - This script does the following:
       	
	1. Downloads and unzips the UCI HAR dataset, if the data set is not yet existing in the current working directory
	2. Reads in "features.txt" and "activity_labels.txt", which contain informations on kind of measurement (variables) and activity. With these informations data columns can be named with its appropriate variable name and activity labels can be transformed into descriptive names.
	3. Extracts variable names of all measurements on the mean and standard deviation for each measurement. With those names the proper columns can be selected out of the data set.
	4. Transforms the selected variable names to proper descriptive variable names for labeling the data set.
	5. Merges the training and testing data set by first loading both data sets, extracting the needed columns in both data sets and merges both adapted sets with adding the descriptive column labels prepared in step 4.
	6. Calculates the average of the selected columns for each Subject/Activity pair
	7. Writes the output in a file "tidy.txt"
        
