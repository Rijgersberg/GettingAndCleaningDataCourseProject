CodeBook: Human Activity Recognition Using Smartphones Data Set (Cleaned)
=========================================================================

Original Dataset
----------------
The original dataset is the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
It contains the results of experiments with 30 volunteers who performed 6 activities while wearing a smartphone on their waist.
The smartphone collected 3-axial linear acceleration and 3-axial angular velocity data, which was used to calculate a vector of features.
For full details on the original dataset, we refer to the above link.

Cleaned Dataset
---------------
The documents describes the cleaned version of the original UCI HAR dataset. 
The data have been reshaped to conform to the principles of [tidy data](http://vita.had.co.nz/papers/tidy-data.pdf).
The tidy data consists of a single file (the test and training datasets are merged), containing one column per variable and one row per observation.
Importantly, only the columns which pertain to means or standard deviations of variables were extracted from the raw data. 
The other columns were omitted.
Finally, the tidy data summarizes the data. 
In the original dataset, there are multiple entries for each combination of subject and activity, each with their own set of values for the variables.
In the tidy dataset, only the average over those entries is given.

Structure of the Dataset
------------------------
The original dataset is scattered over multiple files.
The tidy dataset is present as a single table in a single file.
The structure of the data is most easily shown in the image posted by [David Hood](https://class.coursera.org/getdata-007/forum/profile?user_id=134866) on [David's project FAQ on the Coursera Discussion Forums](https://class.coursera.org/getdata-007/forum/thread?thread_id=49#comment-570).
![Data structure](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png)


Processing script
-----------------
In short, running the script

- downloads the zipped raw data files
- unzips the data files
- reads in all the relevant files
- for both the training and test sets, merges the data into a single set
- merges the training and the test sets
- labels all the variables
- extracts only the measurements on the mean and standard deviation for each measurement
- computes the mean of each measurement by subject and activity
- writes the resulting tidy dataset to the file ``tidydata.txt`` in the ``data`` directory

Variable description
--------------------
The following description was excerpted from the ``features_info.txt`` and ``README.txt`` files of the original dataset.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation 
-  [others ommitted]

Features are normalized and bounded within [-1,1].

