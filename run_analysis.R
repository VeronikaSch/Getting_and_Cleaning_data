library(reshape2)

filename <- "getdata_dataset.zip"

## Download and unzip the UCI HAR dataset:
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

# Read features and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])


# Extracts feature names of all mean and standard deviation measurements
features_selected <- grep(".*mean.*|.*std.*", features[,2])
features_selected_names <- features[features_selected,2]

# Transform selected feature names to proper column names
features_selected_names <- gsub('[-()]', '', features_selected_names)
features_selected_names <- gsub('mean$', '_Mean', features_selected_names)
features_selected_names <- gsub('std$', '_Std', features_selected_names)
features_selected_names <- gsub('mean', '_Mean_', features_selected_names)
features_selected_names <- gsub('std', '_Std_', features_selected_names)


# Merging the data sets
# 1. Load the training data set and select requested measurements
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
activities_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
measurements_train <- read.table("UCI HAR Dataset/train/X_train.txt")
measurements_train_selected <- measurements_train[features_selected]
train <- cbind(subjects_train, activities_train, measurements_train_selected)

# 2. Load the testing data set and select requested measurements
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
activities_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
measurements_test <- read.table("UCI HAR Dataset/test/X_test.txt")
measurements_test_selected <- measurements_test[features_selected]
test <- cbind(subjects_test, activities_test, measurements_test_selected)

# 3. Merge training and testing data set and add column labels
selected_data <- rbind(train, test)
colnames(selected_data) <- c("Subject", "Activity", features_selected_names)


# Calculate the average of the selected columns for each Subject/Activity pair
# 1. Transform subjects & activities to factors
selected_data$Subject <- as.factor(selected_data$Subject)
selected_data$Activity <- factor(selected_data$Activity, levels = activity_labels[,1], labels = activity_labels[,2])

# 2. Melt and calculate average
selected_data_melted <- melt(selected_data, id = c("Subject", "Activity"))
selected_data_average <- dcast(selected_data_melted, Subject + Activity ~ variable, mean)

# Write output to tidy.txt
write.table(selected_data_average, "tidy.txt", row.names = FALSE, quote = FALSE)