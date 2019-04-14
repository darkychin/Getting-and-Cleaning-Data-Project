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

## Explanation


