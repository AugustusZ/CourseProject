#------------------------------------------------------------------------------------------
# 1 Merges the training and the test sets to create one data set.
# Read training set and test set:
X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")

# Combine two sets by ROW in the order of 1) training and 2) test
allData <- rbind(X_train, X_test)

# Remove used data for the sake of memory...
rm(X_train)
rm(X_test)
#----------------------------------------- 1 DONE -----------------------------------------


#------------------------------------------------------------------------------------------
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# Read features for the sets:
features <- read.table("features.txt")

# name the cols with features:
names(allData) <- features$V2

# Use exact matching to look up the column names that contain "-mean()" or "-sd()"
extractColNames_mean <- grep("-mean()", features$V2, fixed = TRUE, value = TRUE)
extractColNames_std <- grep("-std()", features$V2, fixed = TRUE, value = TRUE)
extractedData <- allData[, c(extractColNames_mean, extractColNames_std)]

# Remove used data for the sake of memory...
rm(features)
rm(extractColNames_mean)
rm(extractColNames_std)
#----------------------------------------- 2 DONE -----------------------------------------


#------------------------------------------------------------------------------------------
# 3 Uses descriptive activity names to name the activities in the data set
# Read the labels of training and test sets
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")

# Combine two vectors by ROW in the order of 1) training and 2) test
activityLabel <- rbind(y_train, y_test)

# Read the links between class labels and activity names
activityLabelNames <- read.table("activity_labels.txt")

# Name the observations with 6 activity names according to the corresponding class labels
extractedData$activityName <- activityLabelNames$V2[activityLabel$V1]

# Remove used data for the sake of memory...
rm(y_train)
rm(y_test)
rm(activityLabel)
rm(activityLabelNames)
rm(allData)
#----------------------------------------- 3 DONE -----------------------------------------


#------------------------------------------------------------------------------------------
# 4 Appropriately labels the data set with descriptive variable names. 
# Change the "-" to "." and eliminate brackets:
names(extractedData) <- gsub("-", ".", names(extractedData))
names(extractedData) <- gsub("[(][)]", "", names(extractedData))

# Before go to step 5, add the subject ID to the data set:
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subjectID <- rbind(subject_train, subject_test)
extractedData$subjectID <- as.numeric(data.matrix(subjectID))

# Remove used data for the sake of memory...
rm(subject_train)
rm(subject_test)
rm(subjectID)
#----------------------------------------- 4 DONE -----------------------------------------


#------------------------------------------------------------------------------------------
# 5 From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.
# Group the observations and then summarize them:
groupedData <- group_by(extractedData, activityName, subjectID)
finalData <- summarise_each(groupedData, funs(mean))

# Output the final dataset:
write.table(finalData, file = "../Course_Project_Output.txt", row.name = FALSE)

# Remove used data for the sake of memory...
rm(groupedData)
rm(extractedData)
rm(finalData)

# To read the outputfile, just use read.table:
# Course_Project_Output <- read.table("../Course_Project_Output.txt")
#----------------------------------------- 5 DONE -----------------------------------------
