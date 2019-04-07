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


## Step 2: Explore Data

## Please refer to Exploration.md on steps about how to formulate the following conclusions.

## Conclusion for required data are as below :

## *1 "activity_labels"       [row : 6    , column : 2]
## - Used as the y_train labels mapping.
## - activity_labels$V1 may be used to mapped back with y_train$V1
## - variable name will be "activity" after mapped

## *2 "features"              [row : 561  , column : 2]
## - "features_info.txt" stated that this dataframe to be "List of all features."
## - Used as the variable name for X_train all columns

## *3 "subject_test"          [row :      , column :]

## *4 "X_test"                [row :      , column :]

## *5 "y_test"                [row :      , column :]

## *6 "subject_train"         [row :      , column :]

## *7 "X_train"               [row :      , column :]

## *8 "y_train"               [row :      , column :]



## Step 3: Tidy Data