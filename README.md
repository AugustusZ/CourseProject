# CourseProject
Repository for Course Project for Getting and Cleaning Data on Coursera

## Before running the scripts
First of all, copy `run_Analysis.R` to the same folder with `UCI HAR Dataset`.

Then, set the working directory to the folder `UCI HAR Dataset`. 

Third, include the package of `dplyr` if you have not:

```
install.packages("dplyr")
library("dplyr")
```
 
And now you are ready to go!

## Let's walk through the code
#### 1. Merges the training and the test sets to create one data set.

From the `README.txt` in the folder `UCI HAR Dataset`, we could learn that where the training and test data are:
> - 'train/X_train.txt': Training set.
> - 'test/X_test.txt': Test set.


Notice that they are txt files. So we could simply use `read.table()`

```
X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
```

Then append one to the other using `rbind()`:

```
allData <- rbind(X_train, X_test)
```
*Train first, and then test.* Keep that in mind.

The data which will not be used in the following step(s) are removed from the evironment at the end of each step and regarding code will not be further explained:

```
rm(USELESS_DATA)
```
So far, we get the data set named `allData`.

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

According to `features_info.txt`, the target columns are those variables whose names contain `mean()` or `std()`. 

Note that some names contain `meanFreq()` (e.g. `fBodyAcc-meanFreq()-X`) or `Mean` (e.g. `angle(tBodyAccJerkMean),gravityMean)`) are not required.

Thus, we first extract the target column names with `grep()` by exactly mataching the `-mean()` or `-std()` with column names:

```
extractColNames_mean <- grep("-mean()", features$V2, fixed = TRUE, value = TRUE)
extractColNames_std <- grep("-std()", features$V2, fixed = TRUE, value = TRUE)
```
For exact matching, let `fixed = TRUE`, so that names like `fBodyAcc-meanFreq()-X` will not return. For returning the column name itself, let `value = TRUE`, so that we can directly subset the data set we generate in **Step 1** with columns names:

```
extractedData <- allData[, c(extractColNames_mean, extractColNames_std)]
```
So far, we have got the data set `extractedData` extracted from `allData`.


#### 3. Uses descriptive activity names to name the activities in the data set


The link between class label and activity name is given in `activity_labels.txt`:

Class Label | Activity Name
:-----------:| ------------
1 | WALKING
2 | WALKING_UPSTAIRS
3 | WALKING_DOWNSTAIRS
4 | SITTING
5 | STANDING
6 | LAYING

Before linking the them up, observations should be labeled first.
`README.txt` told us where to find the label data:
> - 'train/y_train.txt': Training labels.
> - 'test/y_test.txt': Test labels.


So all we need to do is read them, combine them and then... **Wait for it!** Do remember: *Train first, and then test.* The code is straightforward:

```
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")

activityLabel <- rbind(y_train, y_test)
```

And then we read the `activity_labels.txt` to get the links:

```
activityLabelNames <- read.table("activity_labels.txt")
```
In R, the `activityNames` is like:

V1 | V2
:-----------:| ------------
1 | WALKING
2 | WALKING_UPSTAIRS
3 | WALKING_DOWNSTAIRS
4 | SITTING
5 | STANDING
6 | LAYING

While `activityLabel` is like:

V1 | 
:-----------:| 
5 | 
... |


With these in mind, it will be much easier to understand the next line of code:

```
extractedData$activityName <- activityLabelNames$V2[activityLabel$V1]
```
So far, we have an updated `extractedData` labeled with activity names.

#### 4. Appropriately labels the data set with descriptive variable names. 


The column names givne in `features.txt` are already descriptive enough. The abbreviated names are concise and informative. So, all we need to do is change `-` to `.`, and remove `(` and `)`. 

```
names(extractedData) <- gsub("-", ".", names(extractedData))
names(extractedData) <- gsub("[(][)]", "", names(extractedData))
```
Before go to **Step 5**, we should add the subject ID to the data set. Again, in `README.txt`, we know where to find Subject ID data:

> The following files are available for the train and test data. Their descriptions are equivalent. 

> - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


So, just read them, combine them and attach it to the `extractedData`:

```
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

subjectID <- rbind(subject_train, subject_test)

extractedData$subjectID <- as.numeric(data.matrix(subjectID)) # Stupid... huh?
```
The conversion of the last line looks **stupid**. I know. Hope some one could make it look smarter! Thanks in advance!

Up to now, we have got `extractedData` ready for final operation!

#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The operation for this step is really straightforward: first, group them; finally, summarise them!

But the tricky thing here is, we can group a data set by more than one variable, i.e., `activityName` and `subjectID`. 

```
groupedData <- group_by(extractedData, activityName, subjectID)
finalData <- summarise_each(groupedData, funs(mean))
```
Note that, there is only `summarise_each()`, no `summari[z]e_each()`. But there are both `summarise()` and `summarize()`.

FINALLY, output `finalData`! Let `row.name = FALSE`.

```
write.table(finalData, file = "../Course_Project_Output.txt", row.name = FALSE)
```
Up to this point, we have successfully output the required data set as `Course_Project_Output.txt`.



## One last thing!

If you want to read `Course_Project_Output.txt` back into R (your working directory is still the folder `UCI HAR Dataset`), remember to let `header = TRUE`:

```
Course_Project_Output <- read.table("../Course_Project_Output.txt", header=TRUE)
```


---
