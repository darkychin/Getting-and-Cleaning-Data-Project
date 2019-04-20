## Code Book


### Data Source
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Features
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

### Variables
The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean


## Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

## Study Design

### Tidy Data extracted from Human Activity Recognition Using Smartphones Dataset Version 1.0

subject     1-2
  Subject who performed the activity for each window sample
    1..30   Integer that represent the subject

activity    6-18
  Activity performed by subject wearing a smartphone on a waist
    LAYING              .Laying
    SITTING             .Sitting
    STANDING            .Standing
    WALKING             .Walking
    WALKING_DOWNSTAIRS  .Walking downstairs
    WALKING_UPSTAIRS    .Walking upstairs

domain      1
  Domain signals
    f   .Frequency
    t   .Time

feature     7-19
  Type of estimated variable signals of the feature
    BodyAcc               .Body linear acceleration
    BodyAccJerk           .Body linear acceleration jerk
    BodyAccMag            .Body linear acceleration magnitude
    BodyBodyAccJerkMag    .Body body linear acceleration jerk magnitude
    BodyBodyGyroJerkMag   .Body body angular velocity jerk magnitude
    BodyBodyGyroMag       .Body body angular velocity magnitude
    BodyGyro              .Body angular velocity
    BodyAccJerkMag        .Body linear acceleration jerk magnitude
    BodyGyroJerk          .Body angular velocity jerk
    BodyGyroJerkMag       .Body angular velocity jerk magnitude
    BodyGyroMag           .Body angular velocity magnitude
    GravityAcc            .Gravity linear acceleration
    GravityAccMag         .Gravity linear acceleration magnitude

variable    5-10
  Estimated variables from the signals
    mean()      .Mean value
    meanFreq()  .Weighted average of the frequency components to obtain a mean frequency
    std()       .Standard deviation

direction   1
  Axial signals in the X, Y and Z directions.
    NA  .Not Available
    X   .X direction 
    Y   .Y direction
    Z   .Z direction
    
average     18
  Average of each variable for each activity and each subject
    -0.999999999999999999..0    Decimal value of the measurement
