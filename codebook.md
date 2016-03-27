# Getting and Cleaning Data 

## Study Design
This document describes the Smartphone_Human_Activity_Summary_Stats.txt that accompanies it.

The raw data for this dataset was downloaded from data collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone available from this url
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The raw data are the results from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width 
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was 
used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### For each record in the raw dataset it is provided
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Feature Selection
The features selected for the raw data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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

For the purposes of this project, we are only interested in the measurements on the mean and standard deviation for each variable. The training and test data sets are also to be combined into a single data set. 
Each observation in the resultant data set is to represent a single measurement for a subject and activity, with a description of the activity.

The `run_analysis.R` file that accompanies this data set, takes the raw data described above and merges the test (`X_test.txt`) and train (`X_train.txt`) data sets into a single merged data frame. The subject and activity ids are appended to each of the test and train data sets prior to merging, from the data provided in the `subject_xxxx.txt` and `y_xxxx.txt`, respetively (where the `xxxx` is `test` or `train`, for the data set in question.)

The descriptions of the features represented by each of the 561 columns in the test and train data sets, are read in from the `features.txt` provided in the raw data and filtered on mean() and std(). The columns in the merged data are then selected to correspond to just these features.

The feature descriptions are then used to generate meaningful column names.

The activities represented by each of the 1-6 values in the activity values appended to the test and train data sets, are read in from the activity_labels.txt file provided in the raw data and the actvity index replaced with the corresponding category description.

Finally the data is grouped by subject and activity, providing a mean value for each measurement.

The resultant output provides a second, independent tidy data set with the average of each variable for each activity and each subject. 

The resultant data set can be produced by the following R code from the raw data described:-
`source("./run_analysis.R")
run_analysis()`

Assuming that the Samsumg raw data is available in the working directory. The required tidy data set is the output of this function.


## Code Book
The output dataset contains the following columns:-

### subjectid 'Subject Identifier'

Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

---
   Storage mode: integer
   Measurement: ordinal

   Values and labels   N   Percent
                                  
            1   '1'    6   3.3 3.3
            2   '2'    6   3.3 3.3
            3   '3'    6   3.3 3.3
            4   '4'    6   3.3 3.3
            5   '5'    6   3.3 3.3
            6   '6'    6   3.3 3.3
            7   '7'    6   3.3 3.3
            8   '8'    6   3.3 3.3
            9   '9'    6   3.3 3.3
           10   '10'   6   3.3 3.3
           11   '11'   6   3.3 3.3
           12   '12'   6   3.3 3.3
           13   '13'   6   3.3 3.3
           14   '14'   6   3.3 3.3
           15   '15'   6   3.3 3.3
           16   '16'   6   3.3 3.3
           17   '17'   6   3.3 3.3
           18   '18'   6   3.3 3.3
           19   '19'   6   3.3 3.3
           20   '20'   6   3.3 3.3
           21   '21'   6   3.3 3.3
           22   '22'   6   3.3 3.3
           23   '23'   6   3.3 3.3
           24   '24'   6   3.3 3.3
           25   '25'   6   3.3 3.3
           26   '26'   6   3.3 3.3
           27   '27'   6   3.3 3.3
           28   '28'   6   3.3 3.3
           29   '29'   6   3.3 3.3
           30   '30'   6   3.3 3.3

---

### activity 'Activity'

Activity performed by subject wearing a smartphone.

---

   Storage mode: integer
   Measurement: nominal

          Values and labels    N    Percent 
                                            
   1   'LAYING'               30   16.7 16.7
   2   'SITTING'              30   16.7 16.7
   3   'STANDING'             30   16.7 16.7
   4   'WALKING'              30   16.7 16.7
   5   'WALKING_DOWNSTAIRS'   30   16.7 16.7
   6   'WALKING_UPSTAIRS'     30   16.7 16.7

---

### tbodyaccmeanx 'Mean Body Acceleration in the X direction'

The mean value of the body acceleration signal in the X direction, as derived from the accelerometer raw signals tAcc-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

---

   Storage mode: double
   Measurement: interval

            Min:   0.222
            Max:   0.301
           Mean:   0.274
       Std.Dev.:   0.012
       Skewness:  -1.055
       Kurtosis:   2.329

---

### tbodyaccmeany 'Mean Body Acceleration in the Y direction'

The mean value of the body acceleration signal in the Y direction, as derived from the accelerometer 3-axial raw signals tAcc-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.041
            Max:  -0.001
           Mean:  -0.018
       Std.Dev.:   0.006
       Skewness:  -0.537
       Kurtosis:   1.612

---

### tbodyaccmeanz 'Mean Body Acceleration in the X direction'

The mean value of the body acceleration signal in the Z direction, as derived from the accelerometer 3-axial raw signals tAcc-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.153
            Max:  -0.075
           Mean:  -0.109
       Std.Dev.:   0.010
       Skewness:  -1.115
       Kurtosis:   4.910

---

### tbodyaccstdx 'Standard Deviation of Body Acceleration in the X direction'

The standard deviation of the body acceleration signal in the X direction.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.996
            Max:   0.627
           Mean:  -0.558
       Std.Dev.:   0.450
       Skewness:   0.438
       Kurtosis:  -1.216

---

### tbodyaccstdy 'Standard Deviation of Body Acceleration in the Y direction'

The standard deviation of the body acceleration signal in the Y direction.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.990
            Max:   0.617
           Mean:  -0.460
       Std.Dev.:   0.495
       Skewness:   0.235
       Kurtosis:  -1.586

---

### tbodyaccstdz 'Standard Deviation of Body Acceleration in the Z direction'

The standard deviation of the body acceleration signal in the Z direction.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.988
            Max:   0.609
           Mean:  -0.576
       Std.Dev.:   0.394
       Skewness:   0.451
       Kurtosis:  -1.026

---

### tgravityaccmeanx 'Mean Gravity Acceleration in the X direction'

The mean value of the gravity acceleration signal in the X direction, as derived from the accelerometer 3-axial raw signals tAcc-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.680
            Max:   0.975
           Mean:   0.697
       Std.Dev.:   0.486
       Skewness:  -1.811
       Kurtosis:   1.452

---

### tgravityaccmeany 'Mean Gravity Acceleration in the Y direction'

The mean value of the gravity acceleration signal in the Y direction, as derived from the accelerometer 3-axial raw signals tAcc-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.480
            Max:   0.957
           Mean:  -0.016
       Std.Dev.:   0.344
       Skewness:   1.427
       Kurtosis:   1.051

---

### tgravityaccmeanz 'Mean Gravity Acceleration in the Z direction'

The mean value of the gravity acceleration signal in the Z direction, as derived from the accelerometer and 3-axial raw signals tAcc-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.495
            Max:   0.958
           Mean:   0.074
       Std.Dev.:   0.288
       Skewness:   1.145
       Kurtosis:   1.208

---

### tgravityaccstdx 'Standard Deviation of Gravity Acceleration in the X direction'

The standard deviation of the gravity acceleration signal in the X direction.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.997
            Max:  -0.830
           Mean:  -0.964
       Std.Dev.:   0.025
       Skewness:   1.669
       Kurtosis:   5.051

---

### tgravityaccstdy 'Standard Deviation of Gravity Acceleration in the Y direction'

The standard deviation of the gravity acceleration signal in the Y direction.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.994
            Max:  -0.644
           Mean:  -0.952
       Std.Dev.:   0.033
       Skewness:   4.817
       Kurtosis:  42.501

---

### tgravityaccstdz 'Standard Deviation of Gravity Acceleration in the Z direction'

The standard deviation of the gravity acceleration signal in the Z direction.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.991
            Max:  -0.610
           Mean:  -0.936
       Std.Dev.:   0.040
       Skewness:   3.248
       Kurtosis:  22.288

---

###   tbodyaccjerkmeanx 'The mean value of the body jerk linear acceleration jerk in the X direction'

The mean value of the body jerk linear acceleration signal in the X direction, obtained from the body linear acceleration derived in time.

---

   Storage mode: double
   Measurement: interval

            Min:  0.043
            Max:  0.130
           Mean:  0.079
       Std.Dev.:  0.013
       Skewness:  0.821
       Kurtosis:  2.560

---

###   tbodyaccjerkmeany 'The mean value of the body jerk linear acceleration signal in the Y direction'

The mean value of the body jerk linear acceleration signal in the Y direction, obtained from the body linear acceleration derived in time.

---------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.039
            Max:   0.057
           Mean:   0.008
       Std.Dev.:   0.014
       Skewness:  -0.192
       Kurtosis:   1.606

---

### tbodyaccjerkmeanz 'The mean value of the body jerk linear acceleration signal in the Z direction'

The mean value of the body jerk linear acceleration signal in the Z direction, obtained from the body linear acceleration derived in time.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.067
            Max:   0.038
           Mean:  -0.005
       Std.Dev.:   0.013
       Skewness:  -0.835
       Kurtosis:   3.525

---

### tbodyaccjerkstdx 'The standard deviation of the body jerk linear acceleration signal in  the X direction'

The standard deviation of the body jerk linear acceleration signal in the X direction, obtained from the body linear acceleration derived in time.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.995
            Max:   0.544
           Mean:  -0.595
       Std.Dev.:   0.416
       Skewness:   0.424
       Kurtosis:  -1.273

----

### tbodyaccjerkstdy 'The standard deviation of the body jerk linear acceleration signal in the Y direction'

The standard deviation of the body jerk linear acceleration signal in the Y direction, obtained from the body linear acceleration derived in time.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.990
            Max:   0.355
           Mean:  -0.565
       Std.Dev.:   0.432
       Skewness:   0.362
       Kurtosis:  -1.450

---

### tbodyaccjerkstdz 'The standard deviation value of the body jerk linear acceleration signal in the Z direction'

The standard deviationof the body jerk linear acceleration signal in the Z direction, obtained from the body linear acceleration derived in time."

---

   Storage mode: double
   Measurement: interval

            Min:  -0.993
            Max:   0.031
           Mean:  -0.736
       Std.Dev.:   0.276
       Skewness:   0.679
       Kurtosis:  -0.681

---

###  tbodygyromeanx 'Mean Body Angular Velocity in the X direction'

The mean value of the angular velocity signal in the X direction, as derived from the gyroscope 3-axial raw signals tGyro-XYZ.  These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.206
            Max:   0.193
           Mean:  -0.032
       Std.Dev.:   0.054
       Skewness:   0.341
       Kurtosis:   2.391

---

###  tbodygyromeany 'Mean Body Angular Velocity in the Y direction'

The mean value of the angular velocity signal in the Y direction, as derived from the gyroscope 3-axial raw signals tGyro-XYZ.  These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order lowpass Butterworth filter with a corner frequency of 20 Hz to remove noise.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.204
            Max:   0.027
           Mean:  -0.074
       Std.Dev.:   0.035
       Skewness:  -0.286
       Kurtosis:   2.070

---

### tbodygyromeanz 'Mean Body Angular Velocity in the Z direction'

The mean value of the angular velocity signal in the Z direction, as derived from the gyroscope 3-axial raw signals tGyro-XYZ.  These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise."

---

   Storage mode: double
   Measurement: interval

            Min:  -0.072
            Max:   0.179
           Mean:   0.087
       Std.Dev.:   0.036
       Skewness:  -0.781
       Kurtosis:   3.224

---

### tbodygyrostdx 'Standard deviation of Body Angular Velocity in the X direction'

The standard deviation of the body angular velocity signal in the X direction.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.994
            Max:   0.268
           Mean:  -0.692
       Std.Dev.:   0.290
       Skewness:   0.391
       Kurtosis:  -1.073

---

### tbodygyrostdy 'Standard deviation of Body Angular Velocity in the Y direction'

The standard deviation of the body angular velocity signal in the Y direction.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.994
            Max:   0.477
           Mean:  -0.653
       Std.Dev.:   0.351
       Skewness:   0.731
       Kurtosis:  -0.458

---

### tbodygyrostdz 'Standard deviation of Body Angular Velocity in the Z direction'

The standard deviation of the body angular velocity signal in the Z direction.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.986
            Max:   0.565
           Mean:  -0.616
       Std.Dev.:   0.372
       Skewness:   0.531
       Kurtosis:  -0.798

---

### tbodygyrojerkmeanx 'The mean value of the body jerk angular velocity signal in the X direction'

The mean value of the body jerk angular velocity signal in the X direction, obtained from the body angular velocity derived in time.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.157
            Max:  -0.022
           Mean:  -0.096
       Std.Dev.:   0.023
       Skewness:   0.485
       Kurtosis:   1.825

---

###  tbodygyrojerkmeany 'The mean value of the body jerk angular velocity signal in the Y direction'

The mean value of the body jerk angular velocity signal in the Y direction, obtained from the body angular velocity derived in time.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.077
            Max:  -0.013
           Mean:  -0.043
       Std.Dev.:   0.010
       Skewness:  -0.814
       Kurtosis:   2.785

---

### tbodygyrojerkmeanz 'The mean value of the body jerk angular velocity signal in the Z direction'

The mean value of the body jerk angular velocity signal in the Z direction, obtained from the body angular velocity derived in time.

---------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.092
            Max:  -0.007
           Mean:  -0.055
       Std.Dev.:   0.012
       Skewness:   0.258
       Kurtosis:   1.867

---

### tbodygyrojerkstdx 'The standard deviation of the body jerk angular velocity signal in the X direction'

The standard deviation of the body jerk angular velocity signal in the X direction, obtained from the body angular velocity derived in time.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.997
            Max:   0.179
           Mean:  -0.704
       Std.Dev.:   0.300
       Skewness:   0.554
       Kurtosis:  -0.916

---

### tbodygyrojerkstdy 'The standard deviation of the body jerk angular velocity signal in the Y direction'

The standard deviation of the body jerk angular velocity signal in the Y direction, obtained from the body angular velocity derived in time."

---

   Storage mode: double
   Measurement: interval

            Min:  -0.997
            Max:   0.296
           Mean:  -0.764
       Std.Dev.:   0.267
       Skewness:   1.156
       Kurtosis:   1.064

---

### tbodygyrojerkstdz 'The standard deviation value of the body jerk angular velocity jerk signal in the Z direction'

The standard deviation of the body jerk angular velocity signal in the Z direction, obtained from the body angular velocity derived in time.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.995
            Max:   0.193
           Mean:  -0.710
       Std.Dev.:   0.304
       Skewness:   0.649
       Kurtosis:  -0.652

---

### tbodyaccmagmean 'Magntitide of Mean Body Acceleration'

The magnitude of the mean from the three-dimensional body acceleration signals, calculated using the Euclidean norm

---

   Storage mode: double
   Measurement: interval

            Min:  -0.986
            Max:   0.645
           Mean:  -0.497
       Std.Dev.:   0.472
       Skewness:   0.231
       Kurtosis:  -1.587

---

###  tbodyaccmagstd 'Magntitide of Standard Deviation of Body Acceleration'

The magnitude of the standard deviation from the three-dimensional body acceleration signals, calculated using the Euclidean norm.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.986
            Max:   0.428
           Mean:  -0.544
       Std.Dev.:   0.430
       Skewness:   0.464
       Kurtosis:  -1.194

---

### tgravityaccmagmean 'Magntitide of Mean Gravity Acceleration'

The magnitude of the mean from the three-dimensional gravity acceleration signals, calculated using the Euclidean norm

---

   Storage mode: double
   Measurement: interval

            Min:  -0.986
            Max:   0.645
           Mean:  -0.497
       Std.Dev.:   0.472
       Skewness:   0.231
       Kurtosis:  -1.587

---

### tgravityaccmagstd 'Magntitide of Standard Deviation of Gravity Acceleration'

The magnitude of the standard deviation from the three-dimensional gravity acceleration signals, calculated using the Euclidean norm

---

   Storage mode: double
   Measurement: interval

            Min:  -0.986
            Max:   0.428
           Mean:  -0.544
       Std.Dev.:   0.430
       Skewness:   0.464
       Kurtosis:  -1.194

---

### tbodyaccjerkmagmean 'Magntitide of Mean Body Jerk Acceleration'

The magnitude of the mean from the three-dimensional body jerk acceleration signals, calculated using the Euclidean norm

---

   Storage mode: double
   Measurement: interval

            Min:  -0.993
            Max:   0.434
           Mean:  -0.608
       Std.Dev.:   0.395
       Skewness:   0.360
       Kurtosis:  -1.388

---

###  tbodyaccjerkmagstd 'Magntitide of Standard Deviation of Body Jerk Acceleration'

The magnitude of the standard deviation from the three-dimensional body jerk acceleration signals, calculated using the Euclidean norm

---

   Storage mode: double
   Measurement: interval

            Min:  -0.995
            Max:   0.451
           Mean:  -0.584
       Std.Dev.:   0.422
       Skewness:   0.425
       Kurtosis:  -1.319

===

###  tbodygyromagmean 'Magntitide of Mean Body Angular Velocity'

The magnitude of the mean from the three-dimensional body angular velocity signals, calculated using the Euclidean norm

---

   Storage mode: double
   Measurement: interval

            Min:  -0.981
            Max:   0.418
           Mean:  -0.565
       Std.Dev.:   0.397
       Skewness:   0.313
       Kurtosis:  -1.422

---

### tbodygyromagstd 'Magntitide of Standard Deviation of Body Angular Velocity'

The magnitude of the standard deviation from the three-dimensional body angular velocity signals, calculated using the Euclidean norm.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.981
            Max:   0.300
           Mean:  -0.630
       Std.Dev.:   0.336
       Skewness:   0.482
       Kurtosis:  -1.027

---

###  tbodygyroJerkmagmean 'Magntitide of Mean Body Jerrk Angular Velocity'

The magnitude of the mean from the three-dimensional body jerk angular velocity signals, calculated using the Euclidean norm.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.997
            Max:   0.088
           Mean:  -0.736
       Std.Dev.:   0.276
       Skewness:   0.660
       Kurtosis:  -0.646

---

### tbodygyrojerkmagstd 'Magntitide of Standard Deviation of Body Jerk Angular Velocity'

The magnitude of the standard deviation from the three-dimensional body jerk angular velocity signals, calculated using the Euclidean norm.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.998
            Max:   0.250
           Mean:  -0.755
       Std.Dev.:   0.265
       Skewness:   1.016
       Kurtosis:   0.546

---

###  fbodyaccmeanx 'Mean Frequency of Body Acceleration in the X direction'

 The mean frequency of the body acceleration signal in the X direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccmeanx signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.995
            Max:   0.537
           Mean:  -0.576
       Std.Dev.:   0.429
       Skewness:   0.391
       Kurtosis:  -1.328

---

### fbodyaccmeany 'Mean Frequency of Body Acceleration in the Y direction'

The mean frequency of the body acceleration signal in the Y direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccmeany signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.989
            Max:   0.524
           Mean:  -0.489
       Std.Dev.:   0.479
       Skewness:   0.259
       Kurtosis:  -1.567

---

### fbodyaccmeanz 'Mean Frequency of Body Acceleration in the Z direction'

The mean frequency of the body acceleration signal in the Z direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccmeanz signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.989
            Max:   0.281
           Mean:  -0.630
       Std.Dev.:   0.355
       Skewness:   0.470
       Kurtosis:  -1.073

---

### fbodyaccstdx 'Standard Deviation Frequency of Body Acceleration in the X direction'

The standard deviation frequency of the body acceleration signal in the X direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccmeanx signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.997
            Max:   0.659
           Mean:  -0.552
       Std.Dev.:   0.459
       Skewness:   0.469
       Kurtosis:  -1.145

---

###  fbodyaccstdy 'Standard Deviation Frequency of Body Acceleration in the Y direction'

The standard deviation of the frequency of the body acceleration signal in the Y direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccmeany signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.991
            Max:   0.560
           Mean:  -0.481
       Std.Dev.:   0.473
       Skewness:   0.244
       Kurtosis:  -1.566

---

### fbodyaccstdz 'Standard Deviation Frequency of Body Acceleration in the Z direction'

The standard deviation of the frequency of the body acceleration signal in the Z direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccmeanz signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.987
            Max:   0.687
           Mean:  -0.582
       Std.Dev.:   0.387
       Skewness:   0.518
       Kurtosis:  -0.808

---

### fbodyaccjerkmeanx 'Mean Frequency of Body Jerk Acceleration in the X direction'

The mean frequency of the body jerk acceleration signal in the X direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccjerkmeanx signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.995
            Max:   0.474
           Mean:  -0.614
       Std.Dev.:   0.397
       Skewness:   0.444
       Kurtosis:  -1.222

---

### fbodyaccjerkmeany 'Mean Frequency of Body Jerk Acceleration in the Y direction'

The mean frequency of the body jerk acceleration signal in the Y direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccjerkmeany signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.989
            Max:   0.277
           Mean:  -0.588
       Std.Dev.:   0.407
       Skewness:   0.347
       Kurtosis:  -1.478

---

### fbodyaccjerkmeanz 'Mean Frequency of Body Jerk Acceleration in the Z direction'

The mean frequency of the body jerk acceleration signal in the Z direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccjerkmeanz signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.992
            Max:   0.158
           Mean:  -0.714
       Std.Dev.:   0.296
       Skewness:   0.670
       Kurtosis:  -0.677

---

### fbodyaccjerkstdx 'Standard Deviation Frequency of Body Jerk Acceleration in the X direction'

The standard deviation of the frequency of the body jerk acceleration signal in the X direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccjerkmeanx signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.995
            Max:   0.477
           Mean:  -0.612
       Std.Dev.:   0.399
       Skewness:   0.413
       Kurtosis:  -1.306

---

### fbodyaccjerkstdy 'Standard Deviation Frequency of Body Jerk Acceleration in the Y direction'

The standard deviation of the frequency of the body jerk acceleration signal in the Y direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccjerkmeany signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.990
            Max:   0.350
           Mean:  -0.571
       Std.Dev.:   0.431
       Skewness:   0.393
       Kurtosis:  -1.386

---

### fbodyaccjerkstdz 'Standard Deviation Frequency of Body Jerk Acceleration in the Z direction'

The standard deviation of the frequency of the body jerk acceleration signal in the Z direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccjerkmeanz signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.993
            Max:  -0.006
           Mean:  -0.756
       Std.Dev.:   0.256
       Skewness:   0.709
       Kurtosis:  -0.606

---

### fbodygyromeanx 'Mean Frequency of Body Angular Velocity in the X direction'

The mean frequency of the body angular velocity signal in the X direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodygyromeanx signals.

----

   Storage mode: double
   Measurement: interval

            Min:  -0.993
            Max:   0.475
           Mean:  -0.637
       Std.Dev.:   0.346
       Skewness:   0.417
       Kurtosis:  -1.040

---

### fbodygyromeany 'Mean Frequency of Body Angular Velocity in the Y direction'

The mean frequency of the body angular velocity signal in the Y direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodygyromeany signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.994
            Max:   0.329
           Mean:  -0.677
       Std.Dev.:   0.331
       Skewness:   0.738
       Kurtosis:  -0.471

---

### fbodygyromeanz 'Mean Frequency of Body Angular Velocity in the Z direction'

The mean frequency of the body angular velocity signal in the Z direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodygyromeanz signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.986
            Max:   0.492
           Mean:  -0.604
       Std.Dev.:   0.383
       Skewness:   0.445
       Kurtosis:  -1.128

----

### fbodygyrostdx 'Standard Deviation Frequency of Body Angular Velocity in the X direction'

The standard deviation of the frequency of the body angular velocity signal in the X direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodygyrostdx signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.995
            Max:   0.197
           Mean:  -0.711
       Std.Dev.:   0.272
       Skewness:   0.401
       Kurtosis:  -1.052

---

### fbodygyrostdy 'Standard Deviation Frequency of Body Angular Velocity in the Y direction'

The standard deviation of the frequency of the body angular velocity signal in the Y direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodygyrostdy signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.994
            Max:   0.646
           Mean:  -0.645
       Std.Dev.:   0.362
       Skewness:   0.830
       Kurtosis:  -0.090

---

### fbodygyrostdz 'Standard Deviation Frequency of Body Angular Velocity in the Z direction'

The standard deviation of thefrequency of the body angular velocity signal in the Z direction, obtauned by applying a Fast Fourier Transform (FFT) to the tbodygyrostdz signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.987
            Max:   0.522
           Mean:  -0.658
       Std.Dev.:   0.335
       Skewness:   0.631
       Kurtosis:  -0.449

---

### fbodyaccmagmean 'Mean Frequency of Magnitude of Body Acceleration'

The mean frequency of the magnitude of the body acceleration signal, obtained by applying a Fast Fourier Transform (FFT) to the tbodyaccmagmean signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.987
            Max:   0.587
           Mean:  -0.537
       Std.Dev.:   0.450
       Skewness:   0.464
       Kurtosis:  -1.197

---

### fbodyaccmagstd 'Standard Deviation Frequency of Magnitude of Body Acceleration'

The standard deviation of the frequency of the magnitude of the body acceleration signal, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccmagstd signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.988
            Max:   0.179
           Mean:  -0.621
       Std.Dev.:   0.352
       Skewness:   0.493
       Kurtosis:  -1.134

---

### fbodybodyaccjerkmagmean 'Mean Frequency of Magnitude of Body Jerk Acceleration'

The mean frequency of the magnitude of the body jerk acceleration signal, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccjerkmagmean signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.994
            Max:   0.538
           Mean:  -0.576
       Std.Dev.:   0.430
       Skewness:   0.424
       Kurtosis:  -1.293

---

### fbodybodyaccjerkmagstd 'Standard Deviation Frequency of Magnitude of Body Jerk Acceleration'

The standard deviation of the frequency of the magnitude of the body jerk acceleration signal, obtauned by applying a Fast Fourier Transform (FFT) to the tbodyaccjerkmagstd signals."

---

   Storage mode: double
   Measurement: interval

            Min:  -0.994
            Max:   0.316
           Mean:  -0.599
       Std.Dev.:   0.408
       Skewness:   0.453
       Kurtosis:  -1.301

---

### fbodybodygyromagmean 'Mean Frequency of Magnitude of Body Angular Velocity'

The mean frequency of the magnitude of the body angular velocity signal, obtauned by applying a Fast Fourier Transform (FFT) to the tbodygyromagmean signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.987
            Max:   0.204
           Mean:  -0.667
       Std.Dev.:   0.317
       Skewness:   0.582
       Kurtosis:  -0.793

---

### ffodybodygyromagstd 'Standard Deviation Frequency of Magnitude of Body Angular Velocity'

The standard deviation of the frequency of the magnitude of the body angular velocity signal, obtained by applying a Fast Fourier Transform (FFT) to the tbodygyromagstd signals.

----

   Storage mode: double
   Measurement: interval

            Min:  -0.981
            Max:   0.237
           Mean:  -0.672
       Std.Dev.:   0.292
       Skewness:   0.493
       Kurtosis:  -0.955

---

### fbodybodygyrojerkmagmean 'Mean Frequency of Magnitude of Body Jerk Angular Velocity'

The mean frequency of the magnitude of the body jerk angular velocity signal, obtained by applying a Fast Fourier Transform (FFT) to the tbodygyroJerkmagmean signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.998
            Max:   0.147
           Mean:  -0.756
       Std.Dev.:   0.262
       Skewness:   0.957
       Kurtosis:   0.276

---

###   fbodybodygyroJerkmagstd 'Standard Deviation Frequency of Magnitude of Body Jerk Angular Velocity'

The standard deviation of the frequency of the magnitude of the body jerk angular velocity signal, obtained by applying a Fast Fourier Transform (FFT) to the tbodygyroJerkmagstd signals.

---

   Storage mode: double
   Measurement: interval

            Min:  -0.998
            Max:   0.288
           Mean:  -0.772
       Std.Dev.:   0.250
       Skewness:   1.137
       Kurtosis:   1.122