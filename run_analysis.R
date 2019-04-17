# Getting and Cleaning Data Project

## Get Working Directory
wd <- getwd()

## Step 1: Prepare Data

### 1. Download data file from url: 
### - since .zip file is binary, mode ="wb" is required. (Read ?download.file)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip",mode="wb")


## Step 2: Explore Data

## 1. Please refer to Exploration.md on steps about how to formulate the following conclusions.

## 2. Conclusion for required data are as below :
## Note: Use dim() to find row and col count

## *1 "activity_labels"       [row : 6      , column : 2]
## - Used as the y_train labels mapping.
## - activity_labels$V1 may be used to mapped back with y_train$V1
## - variable name will be "activity" after mapped

## *2 "features"              [row : 561    , column : 2]
## - "features_info.txt" stated that this dataframe to be "List of all features."
## - Used as the variable name for X_train all columns

## *3 "subject_test"          [row : 2947   , column : 1]
## - subjects (the one who do the action) for train data set
## - own individual column name "subject"

## *4 "X_test"                [row : 2947   , column : 561]
## Main data sets for "test"
## - Will be col-merge with subject_test , y_test

## *5 "y_test"                [row : 2947   , column : 1]
## - map back to activity labels to determine which activity is which
## - Will be col-merge with subject_train , X_train

## *6 "subject_train"         [row : 7352   , column : 1]
## - subjects (the one who do the action) for train data set
## - own individual column name "subject"

## *7 "X_train"               [row : 7352   , column: 561]
## Main data sets for "train"
## - Will be col-merge with subject_train , y_train

## *8 "y_train"               [row : 7352   , column : 1]
## - map back to activity labels to determine which activity is which
## - Will be col-merge with subject_train , X_train


## Step 3: Read Required Data

## Set up zip file directory
zip_dir <- paste0(wd,"/Dataset.zip")

## === General Data ===

### File : activity_labels.txt
### Establish link to "features.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/activity_labels.txt")
### Read file into a "activity_labels" dataframe
activity_labels <- read.table(file,header = FALSE)

### File : features.txt
### Establish link to "features.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/features.txt")
### Read file into a "features" dataframe
features <- read.table(file,header = FALSE)

## === General Data END ===

## === Test Data ===

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

### File : test /y_test.txt
### Establish link to "y_test.txt" inside zip file
file <- unz(zip_dir,"UCI HAR Dataset/test/y_test.txt")
### Read file into a "y_test.txt" dataframe
y_test <- read.table(file,header = FALSE)

## === Test Data END ===

## === Train Data ===

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

## === Train Data END ===


## Step 4: Merging Data

## 1. Prepare Test Data

## Column : "activity"
## Merge y_test and activity_labels , subset "V2", save into "activity"
activity <- merge(y_test,activity_labels,sort = FALSE)[2]
## Rename colname "V2" to "activity"
colnames(activity) <- "activity"

## Main Data : "main"
## Rename colnames in "X_test" with "features"
featuresVec <- as.character(features$V2)
X_renamed <- X_test
names(X_renamed) <- featuresVec
## Note: to read about names vs colnames , https://stackoverflow.com/questions/24799153/what-is-the-difference-between-names-and-colnames
## Subset "X_renamed" to pickup "standard deviation" and "mean" columns only
main <- X_renamed[grep("(-mean|-std)",names(X_renamed))]

## Column : "subject"
subject <- subject_test
names(subject) <- "subject"

## Column bind all Test data and save into "Test"
Test <- cbind(subject,activity,main)


## 2. Prepare Train Data

## Column : "activity"
## Merge y_train and activity_labels , subset "V2", save into "activity"
activity <- merge(y_train,activity_labels,sort = FALSE)[2]
## Rename colname "V2" to "activity"
colnames(activity) <- "activity"

## Main Data : "main"
## Rename colnames in "X_train" with "features"
featuresVec <- as.character(features$V2)
X_renamed <- X_train
names(X_renamed) <- featuresVec
## Subset X_renamed on "standard deviation" and "mean" columns only
main <- X_renamed[grep("(-mean|-std)",names(X_renamed))]

## Column : "subject"
subject <- subject_train
names(subject) <- "subject"

## Column bind all Train data and save into "Train"
Train <- cbind(subject,activity,main)

## 3. Combine Test & Train data
## Rbind "Test" Data and "Train" Data , save it as "Full"
Full <- rbind(Test,Train)


## Step 5: Reshaping & Tidy Data

## 1. Import package "tidyr"
library(tidyr)

## 2. Transform "Full" into long table "Full_tidy" ,  with "features" - key , "measurement" - value as new columns
Full_tidy <- 
  Full %>% 
  gather("feature","measurement",-subject,-activity) %>%
## 3. Separate "feature" into "feature" , "variable" - (mean(),std()) , "direction" - (x,y,z,NA)
  separate(feature,sep="-",into=c("feature","variable","direction"),fill = "right") %>%
## 4. Separate prefix "t" and "f" into new "domain" column
## Side note: supply integer to sep for it to separate by position
  separate(feature,sep=1,into=c("domain","feature"))


## Step 6: Prepare a final summarize data
## Requirement: average of each activity and each subject

## 1. Import library (dplyr)
library(dplyr)

## 2. Select "activity" , "subject" and "average"
summ_tidy <- 
  Full_tidy %>% 
  select(activity , subject , measurement) %>%
## 3. Group by "activity" and "subject"
  group_by(activity,subject) %>%
## 4. Summarise it with a new column "average" and save it as "summ_tidy"
  summarise(average=mean(measurement))


## Step 6: Write "summ_tidy" data into "tidydata.txt" text file
write.table(summ_tidy,"tidydata.txt")
