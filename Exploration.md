## Exploration

## Working directory is begin with "Dataset.zip\UCI HAR Dataset\..."

## 1. Read Data

### Zip file directory
zip_dir <- paste0(wd,"/Dataset.zip")


### File : activity_labels.txt

### Establish link to "features.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/activity_labels.txt")
# ------------------------------
# *Important note for unz() and "description" :
#   unz reads (only) single files within zip files, in binary mode. 
#   The "description" is the full path to the zip file, with '.zip' extension if required.
# ------------------------------

### Read file into a "activity_labels" dataframe
activity_labels <- read.table(file,header = FALSE)


### File : features.txt

### Establish link to "features.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/features.txt")

### Read file into a "features" dataframe
features <- read.table(file,header = FALSE)


## Test Data

### File : test/subject_test.txt

### Establish link to "subject_test.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/test/subject_test.txt")

### Read file into a "subject_test.txt" dataframe
subject_test <- read.table(file,header = FALSE)


### File : test/X_test.txt

### Establish link to "X_test.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/test/X_test.txt")

### Read file into a "X_test.txt" dataframe
X_test <- read.table(file,header = FALSE)


### File : test/y_test.txt

### Establish link to "y_test.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/test/y_test.txt")

### Read file into a "y_test.txt" dataframe
y_test <- read.table(file,header = FALSE)


## Train Data 

### File : train/subject_train.txt

### Establish link to "subject_train.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/train/subject_train.txt")

### Read file into a "subject_train.txt" dataframe
subject_train <- read.table(file,header = FALSE)


### File : train/X_train.txt

### Establish link to "X_train.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/train/X_train.txt")

### Read file into a "X_train.txt" dataframe
X_train <- read.table(file,header = FALSE)


### File : train/y_train.txt

### Establish link to "y_train.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/train/y_train.txt")

### Read file into a "y_train.txt" dataframe
y_train <- read.table(file,header = FALSE)


### File : train/Inertial Signals/body_acc_x_train.txt

### Establish link to "body_acc_x_train.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")

### Read file into a "body_acc_x_train.txt" dataframe
body_acc_x_train <- read.table(file,header = FALSE)


### File : train/Inertial Signals/body_acc_y_train.txt

### Establish link to "body_acc_y_train.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")

### Read file into a "body_acc_x_train.txt" dataframe
body_acc_y_train <- read.table(file,header = FALSE)





### Exploration of "activity_labels" dataframe
### Directory : ...\
### Description : Links the class labels with their activity name.
### Row No : 6
### Col No : 2
### summary(activity_labels)
###  ------------------------------------------
### |       V1                        V2       |
### | Min.   :1.00   LAYING            :1      |
### | 1st Qu.:2.25   SITTING           :1      |
### | Median :3.50   STANDING          :1      |
### | Mean   :3.50   WALKING           :1      |
### | 3rd Qu.:4.75   WALKING_DOWNSTAIRS:1      |
### | Max.   :6.00   WALKING_UPSTAIRS  :1      |
###  ------------------------------------------
### str(activity_labels) ?
### Class  : V1 - integer , V2 - factor
### Unique : V1 - 6 , V2 - 6


### Exploration of "features" dataframe :
### Description : List of all features.
### Row No : 561
### Col No : 2
### summary(features)
###  -----------------------------------------------------
### |       V1                                 V2         |
### | Min.   :  1   fBodyAcc-bandsEnergy()-1,16 :  3      |
### | 1st Qu.:141   fBodyAcc-bandsEnergy()-1,24 :  3      |
### | Median :281   fBodyAcc-bandsEnergy()-1,8  :  3      |
### | Mean   :281   fBodyAcc-bandsEnergy()-17,24:  3      |
### | 3rd Qu.:421   fBodyAcc-bandsEnergy()-17,32:  3      |
### | Max.   :561   fBodyAcc-bandsEnergy()-25,32:  3      |
### |               (Other)                     :543      |
###  -----------------------------------------------------
### Class  : V1 - integer , V2 - factor
### Unique : V1 - 561 , V2 - 477    (duplication is present)


### Exploration of "subject_train" dataframe :
### Description : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
### Row No : 7352
### Col No : 1
### summary(subject_train)
###  -------------------
### |       V1          |
### | Min.   : 1.00     |
### | 1st Qu.: 8.00     |
### | Median :19.00     |
### | Mean   :17.41     |
### | 3rd Qu.:26.00     |
### | Max.   :30.00     |
###  -------------------
### Class  : V1 - integer
### Unique : V1 -> 21


### Exploration of "X_train" dataframe :
### Description : Training set.
### Row No : 7352
### Col No : 561
### summary(X_train)
###  ----------------------------------------------------------------------------------
### |       V1                  V2                   V3                 V4             |
### | Min.   :-1.0000     Min.   :-1.00000     Min.   :-1.00000   Min.   :-1.0000  ... |
### |                                                                                  |
### |     V557                V558                 V559               V560             |
### | Min.   :-1.000000   Min.   :-1.0000000   Min.   :-1.0000    Min.   :-1.00000     |
### |     V561                                                                         |
### | Min.   :-1.000000  [ reached getOption("max.print") -- omitted 5 rows ]          |
###  ----------------------------------------------------------------------------------
### Class  : V1 to V561 - numeric
### Unique : not applicable


### Exploration of "y_train" dataframe :
### Description :Training labels.
### Row No : 7352
### Col No : 1
### summary(y_train)
###  -------------------
### |       V1          |
### | Min.   :1.000     |  
### | 1st Qu.:2.000     | 
### | Median :4.000     |
### | Mean   :3.643     |
### | 3rd Qu.:5.000     |
### | Max.   :6.000     |
###  -------------------
### Class  : V1 - integer
### Unique : V1 -> 6



### Exploration of "body_acc_x_train" dataframe :
### Directory : ...\train\Inertial Signals\body_acc_x_train
### Description :

- 128 variables , but absent of variable labels name in this directory 
- human readable variable name is not possible to achieve 
- So this data can be safely ignored when generating the final tidy data set
- This data is hypothesize to be the raw source data of X_train.txt   