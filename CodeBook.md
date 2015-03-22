# Code Book
The code book for Course Project for Getting and Cleaning Data on Coursera


## Study design
> A thorough description of how you collected the data. [1]

[1]: https://github.com/jtleek/datasharing#the-code-book

1. Raw data is from `X_train.txt`and `X_test.txt`. They consist of `allData`.
2. The variables of `allData` are named according to `features.txt`.
3. The measurements on the mean and standard deviation for each measurement are extracted to be `extractedData`.
4. The observations of `extractedData` are then labeled with `y_train.txt` and `y_test.txt` and `activity_labels.txt` with a new variable named `activityName`.
5. The observations of `extractedData` are then linked with the `subject_train` and `subject_test` with a new variable named `subjectID`.
6. The observations of `extractedData` are then grouped to be `groupedData` by both `activityName` and `subjectID`.
7. The mean values of observations in the corresponding groups from `groupedData` are the data set of `finalData` output as `Course_Project_Output.txt`.
 
The output data set has `180` observations and `68` variables. `66` of the variables are from `features.txt`.


## Code book


> ... that describes each variable and its units. [2]

[2]:  https://github.com/jtleek/datasharing#the-code-book


| \# | variable  | Sources | Description |
|:----:|---------|------|-------------|
| 1 |  activityName | from `y_train.txt`, `y_test.txt` and `activity_labels.txt` | names of activities: WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, and LAYING (without units)|
| 2 |  subjectID | from `subject_train.txt` and `subject_test.txt` |  IDs of subjects who performed the activity: from 1 to 30 (without units)|              
| 3 |  tBodyAcc.mean.X |  from `features.txt` |    *described below*  |      
| 4 |  tBodyAcc.mean.Y |  from `features.txt` |     *described below* |         
| 5 |  tBodyAcc.mean.Z |              from `features.txt` | *described below* |  
| 6 |  tGravityAcc.mean.X |           from `features.txt` | *described below* |  
| 7 |  tGravityAcc.mean.Y |           from `features.txt` | *described below* |  
| 8 |  tGravityAcc.mean.Z |           from `features.txt` | *described below* |  
| 9 |  tBodyAccJerk.mean.X |          from `features.txt` | *described below* |  
| 10 |  tBodyAccJerk.mean.Y |         from `features.txt` | *described below* |  
| 11 |  tBodyAccJerk.mean.Z |         from `features.txt` | *described below* |  
| 12 |  tBodyGyro.mean.X |            from `features.txt` | *described below* |  
| 13 |  tBodyGyro.mean.Y |            from `features.txt` | *described below* |  
| 14 |  tBodyGyro.mean.Z |            from `features.txt` | *described below* |  
| 15 |  tBodyGyroJerk.mean.X |        from `features.txt` | *described below* |  
| 16 |  tBodyGyroJerk.mean.Y |        from `features.txt` | *described below* |  
| 17 |  tBodyGyroJerk.mean.Z |        from `features.txt` | *described below* |  
| 18 |  tBodyAccMag.mean |            from `features.txt` | *described below* |  
| 19 |  tGravityAccMag.mean |         from `features.txt` | *described below* |  
| 20 |  tBodyAccJerkMag.mean |        from `features.txt` | *described below* |  
| 21 |  tBodyGyroMag.mean |           from `features.txt` | *described below* |  
| 22 |  tBodyGyroJerkMag.mean |       from `features.txt` | *described below* |  
| 23 |  fBodyAcc.mean.X |             from `features.txt` | *described below* |  
| 24 |  fBodyAcc.mean.Y |             from `features.txt` | *described below* |  
| 25 |  fBodyAcc.mean.Z |             from `features.txt` | *described below* |  
| 26 |  fBodyAccJerk.mean.X |         from `features.txt` | *described below* |  
| 27 |  fBodyAccJerk.mean.Y |         from `features.txt` | *described below* |  
| 28 |  fBodyAccJerk.mean.Z |         from `features.txt` | *described below* |  
| 29 |  fBodyGyro.mean.X |            from `features.txt` | *described below* |  
| 30 |  fBodyGyro.mean.Y |            from `features.txt` | *described below* |  
| 31 |  fBodyGyro.mean.Z |            from `features.txt` | *described below* |  
| 32 |  fBodyAccMag.mean |            from `features.txt` | *described below* |  
| 33 |  fBodyBodyAccJerkMag.mean |    from `features.txt` | *described below* |  
| 34 |  fBodyBodyGyroMag.mean |       from `features.txt` | *described below* |  
| 35 |  fBodyBodyGyroJerkMag.mean |   from `features.txt` | *described below* |  
| 36 |  tBodyAcc.std.X |              from `features.txt` | *described below* |  
| 37 |  tBodyAcc.std.Y |              from `features.txt` | *described below* |  
| 38 |  tBodyAcc.std.Z |              from `features.txt` | *described below* |  
| 39 |  tGravityAcc.std.X |           from `features.txt` | *described below* |  
| 40 |  tGravityAcc.std.Y |           from `features.txt` | *described below* |  
| 41 |  tGravityAcc.std.Z |           from `features.txt` | *described below* |  
| 42 |  tBodyAccJerk.std.X |          from `features.txt` | *described below* |  
| 43 |  tBodyAccJerk.std.Y |          from `features.txt` | *described below* |  
| 44 |  tBodyAccJerk.std.Z |          from `features.txt` | *described below* |  
| 45 |  tBodyGyro.std.X |             from `features.txt` | *described below* |  
| 46 |  tBodyGyro.std.Y |             from `features.txt` | *described below* |  
| 47 |  tBodyGyro.std.Z |             from `features.txt` | *described below* |  
| 48 |  tBodyGyroJerk.std.X |         from `features.txt` | *described below* |  
| 49 |  tBodyGyroJerk.std.Y |         from `features.txt` |  *described below* |  
| 50 |  tBodyGyroJerk.std.Z |         from `features.txt` | *described below* |  
| 51 |  tBodyAccMag.std |             from `features.txt` | *described below* |  
| 52 |  tGravityAccMag.std |          from `features.txt` | *described below* |  
| 53 |  tBodyAccJerkMag.std |         from `features.txt` | *described below* |  
| 54 |  tBodyGyroMag.std |            from `features.txt` | *described below* |  
| 55 |  tBodyGyroJerkMag.std |        from `features.txt` | *described below* |  
| 56 |  fBodyAcc.std.X |              from `features.txt` | *described below* |  
| 57 |  fBodyAcc.std.Y |              from `features.txt` | *described below* |  
| 58 |  fBodyAcc.std.Z |              from `features.txt` | *described below* |  
| 59 |  fBodyAccJerk.std.X |          from `features.txt` | *described below* |  
| 60 |  fBodyAccJerk.std.Y |          from `features.txt` | *described below* |  
| 61 |  fBodyAccJerk.std.Z |          from `features.txt` | *described below* |  
| 62 |  fBodyGyro.std.X |             from `features.txt` | *described below* |  
| 63 |  fBodyGyro.std.Y |             from `features.txt` | *described below* |  
| 64 |  fBodyGyro.std.Z |             from `features.txt` | *described below* |  
| 65 |  fBodyAccMag.std |             from `features.txt` | *described below* |  
| 66 |  fBodyBodyAccJerkMag.std |     from `features.txt` | *described below* |  
| 67 |  fBodyBodyGyroMag.std |        from `features.txt` |  *described below* |  
| 68 |  fBodyBodyGyroJerkMag.std |    from `features.txt` |  *described below* |   


"*Described below*": 

* Prefix `t` is to denote **time domain**
* Prefix `f` is to denote **frequency domain**
* `Body` is to denote **body linear acceleration** (The units are standard gravity units `g`)
* `Gravity` is to denote **gravity acceleration** (The units are standard gravity units `g`)
* `Gyro` is to denote **angular velocity**. (The units are `rad/s`)
* `Jerk` is to denote **jerk** (The units are `m/s^3`)
* `Mag` is to denote the **magnitude** 
* `mean` is to denote **mean value**
* `std` is to denote **standard deviation**
* `X`, `Y`, and `Z` are to denote **3-axial signals in the X, Y and Z directions**

---
