## Getting and Cleaning Data Project

## Get Working Directory
wd <- getwd()

## Step 1: Prepare Data

## 1. Download data file from url: 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip")


## 2. Read and Explore Data:
##  -- features.txt
file <- unz("file",paste0(wd,"/Dataset.zip/UCI HAR Dataset/features.txt"))
features <- read.table(paste0(wd,"/Dataset.zip/UCI HAR Dataset/features.txt"),header = FALSE)

## Step 2: Explore Data