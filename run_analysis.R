#####################################################################################
# This R script does the following steps in cleaning the collected data. Check README.md file for more details. 
#
#   1. Merge the training and the test data sets to create one data set.
#   2. Extract only the measurements on the mean and standard deviation for each measurement. 
#   3. Use descriptive activity names to name the activities in the data set.
#   4. Appropriately label the data set with descriptive variable names. 
#   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#####################################################################################

library(dplyr)


#####################################################################################
# STEP 1: Download and merge the training and the test data sets
#####################################################################################

# DOWNLOAD DATA

# check if a directory exists, create one if doesn't
if(!dir.exists("./data")){dir.create("./data")}

# set file URL, file name and file path to download 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "project_data.zip"
filePath <- paste0("./data/", fileName)

# download the file
download.file(fileUrl, destfile = filePath, method = "curl")

# unzip the downloaded file
unzip(zipfile = filePath, exdir = "./data/")



# READ DATA

# read training data
training_subject <- read.table('./data/UCI HAR Dataset/train/subject_train.txt', header=FALSE)
x_train <- read.table('./data/UCI HAR Dataset/train/X_train.txt', header=FALSE)
y_train <- read.table('./data/UCI HAR Dataset/train/y_train.txt', header=FALSE)

# read test data
test_subject <- read.table('./data/UCI HAR Dataset/test/subject_test.txt', header=FALSE)
x_test <- read.table('./data/UCI HAR Dataset/test/X_test.txt', header=FALSE)
y_test <- read.table('./data/UCI HAR Dataset/test/y_test.txt', header=FALSE)

# read features data
features <- read.table('./data/UCI HAR Dataset/features.txt', header=FALSE)

# read activity data
activity_labels <- read.table('./data/UCI HAR Dataset/activity_labels.txt', header=FALSE)

# add column names
colnames(training_subject) <- "subjectID"
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"

colnames(test_subject) <- "subjectID"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"


# MERGE DATA 

all_data <- rbind(
    cbind(y_train, x_train, training_subject),
    cbind(y_test, x_test, test_subject)
)


#####################################################################################
# STEP 2: Extract only the measurements on the mean and standard deviation for each measurement
#####################################################################################

# grep columns to extract
required_col <- grepl("subjectID|activityID|mean|std", colnames(all_data))

all_data <- all_data[, required_col]


#####################################################################################
# STEP 3: Use descriptive activity names to name the activities in the data set
#####################################################################################

# map activity ID with the labels 
all_data$activityID <- factor(all_data$activityID, levels = activity_labels[,1], labels = activity_labels[, 2])


#####################################################################################
# STEP 4: Appropriately label the data set with descriptive variable names
#####################################################################################

# get column names
all_data_col <- colnames(all_data)

# remove special characters
all_data_col <- gsub("[\\(\\)]", "", all_data_col)

# use descriptive column names
all_data_col <- gsub("activityID", "activityType", all_data_col)
all_data_col <- gsub("^t", "time", all_data_col)
all_data_col <- gsub("^f", "frequency", all_data_col)
all_data_col <- gsub("Acc", "Accelerometer", all_data_col)
all_data_col <- gsub("Gyro", "Gyroscope", all_data_col)
all_data_col <- gsub("Mag", "Magnitude", all_data_col)
all_data_col <- gsub("Freq", "Frequency", all_data_col)
all_data_col <- gsub("BodyBody", "Body", all_data_col)

# apply cleaned up column names
colnames(all_data) <- all_data_col


#####################################################################################
# STEP 5: From above data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#####################################################################################

# get average number
tidy_data <- aggregate(. ~subjectID + activityType, all_data, mean)

# sort by subjectID and activityType
tidy_data <- tidy_data[order(tidy_data$subjectID, tidy_data$activityType),]

# create a txt file of the tidy data set
write.table(tidy_data, file = "tidy_data_set.txt", row.names = FALSE)

