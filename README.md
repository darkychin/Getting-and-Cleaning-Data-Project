## How to obtain tidy data with "run_analysis.R" in R / RStudio

> Prerequisite :
> 1. Have internet access.
> 2. Run R / RStudio as Administrator.
> 3. Already installed "tidyr" and "dplyr" packages.

1. Set up your designated directory.

```r
    setwd("/SampleDirectory")
```

2. Execute "run_analysis.R" with its absolute path

```r
    source("absolutepath/run_analysis.R")
```

3. View tidy data

```r
    tidydata <- read.table("tidydata.txt",header = TRUE)
	View(tidydata)
```

## Justification
The final data, "tidydata" is tidy because it complies the principles that stated below, cite from [Tidy-Data]:

1. Each variable measured should be in one column
2. Each different observation of that variable should be in a different row
3. One table for each "kind" of variable
If you have multiple tables, they should include a column in the table that allows them to be joined or merged

[Tidy-Data]:https://github.com/jtleek/datasharing#the-tidy-data-set

## Explanation on "run_analysis.R"

Steps:
1. Get designated working directory
2. Download data file zip from url to working directory
3. Read data from zip file and extract files into R objects:
    - activity_labels.txt
    - features.txt
    - subject_test.txt
    - X_test.txt
    - y_test.txt
    - subject_train.txt
    - X_train.txt
    - y_train.txt
4. Process Test Data
4.1 Merge y_test and activity_labels , extract column "V2" and save as activity , rename activity column as "activity"
4.2 Rename X_test columns with features vector , extract column with "-std" or "-mean" and save as main
4.3 Save subject_test as subject, rename subject column as "subject"
4.4 Column bind subject , activity and main and save as Test
5. Process Train Data
5.1 Merge y_train and activity_labels , extract column "V2" and save as activity , rename activity column as "activity"
5.2 Rename X_train columns with features vector , extract column with "-std" or "-mean" and save as main
5.3 Save subject_train as subject, rename subject column as "subject"
5.4 Column bind subject , activity and main and save as Train
6. Row bind Test and Train and save as Full
7. Tidy Full
7.1 Transform Full's columns and its observation into "feature" and "measurement" , except subject and activity 
7.2 Separate "feature" column into "feature", "variable and "direction" with "-"
7.3 Separate "feature" column into "domain" and "feature" with first character
7.4 Save processed Full as Full_tidy
8. Summarize data
8.1 Select activity , subject and measurement from Full_tidy
8.2 Group them by activity , subject
8.3 Summarize them with a new column name "average" as the mean of measurement
8.4 Save them as summ_tidy
9. Export summ_tidy as "tidydata.txt" to the working directory