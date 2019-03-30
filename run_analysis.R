# Getting and Cleaning Data Project

## Get Working Directory
wd <- getwd()

## Step 1: Prepare Data

### 1. Download data file from url: 
### - since .zip file is binary, mode ="wb" is required. (Read ?download.file)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip",mode="wb")


### 2. Read Data:

### Zip file directory
zip_dir <- paste0(wd,"/Dataset.zip")


### File : features.txt

### Establish link to "features.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/features.txt")
# ------------------------------
# *Important note for unz() and "description" :
#   unz reads (only) single files within zip files, in binary mode. 
#   The "description" is the full path to the zip file, with '.zip' extension if required.
# ------------------------------

### Read file into a "features" dataframe
features <- read.table(file,header = FALSE)


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


## Step 2: Explore Data

### Exploration of "features" dataframe :
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


### Exploration of "y_train" dataframe :
