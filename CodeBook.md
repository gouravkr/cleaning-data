The original data for this analysis comes from Universal Machine Learning repositories. It can be 

downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
For an explanation of the original data and how it was collected and compiles, refer the above link.
 
This tidy dataset includes the measurements pertaining to the mean and standard deviation of various features. Features include measurements taken off the accelerometer and gyroscope. In the feature names, the term “acc” represents measurement taken from the accelerometer and the term “gyro” represents measurements taken from the gyroscope. X, Y & Z represent the axis along which the varialble was measured. The prefix ‘t’ represents time and ‘f’ represents frequency.

The tidy data includes the following 86 columns:

tBodyAcc.mean_X,
tBodyAcc.mean_Y,
tBodyAcc.mean_Z

tGravityAcc.mean_X,
tGravityAcc.mean_Y,
tGravityAcc.mean_Z

tBodyAccJerk.mean_X,
tBodyAccJerk.mean_Y,
tBodyAccJerk.mean_Z

tBodyGyro.mean_X,
tBodyGyro.mean_Y,
tBodyGyro.mean_Z

tBodyGyroJerk.mean_X,
tBodyGyroJerk.mean_Y,
tBodyGyroJerk.mean_Z

tBodyAccMag.mean_,
tGravityAccMag.mean_,
tBodyAccJerkMag.mean_

tBodyGyroMag.mean_,
tBodyGyroJerkMag.mean_

fBodyAcc.mean_X,
fBodyAcc.mean_Y,
fBodyAcc.mean_Z

fBodyAcc.meanFreq_X,
fBodyAcc.meanFreq_Y,
fBodyAcc.meanFreq_Z

fBodyAccJerk.mean_X,
fBodyAccJerk.mean_Y,
fBodyAccJerk.mean_Z

fBodyAccJerk.meanFreq_X,
fBodyAccJerk.meanFreq_Y,
fBodyAccJerk.meanFreq_Z

fBodyGyro.mean_X,
fBodyGyro.mean_Y,
fBodyGyro.mean_Z

fBodyGyro.meanFreq_X,
fBodyGyro.meanFreq_Y,
fBodyGyro.meanFreq_Z

fBodyAccMag.mean_,
fBodyAccMag.meanFreq_

fBodyBodyAccJerkMag.mean_,
fBodyBodyAccJerkMag.meanFreq_

fBodyBodyGyroMag.mean_,
fBodyBodyGyroMag.meanFreq_

fBodyBodyGyroJerkMag.mean_,
fBodyBodyGyroJerkMag.meanFreq_

angle.tBodyAccMean.gravity.,
angle.tBodyAccJerkMean..gravityMean.

angle.tBodyGyroMean.gravityMean.,
angle.tBodyGyroJerkMean.gravityMean.

angle.X.gravityMean.,
angle.Y.gravityMean.,
angle.Z.gravityMean.

tBodyAcc.std_X,
tBodyAcc.std_Y,
tBodyAcc.std_Z

tGravityAcc.std_X,
tGravityAcc.std_Y,
tGravityAcc.std_Z

tBodyAccJerk.std_X,
tBodyAccJerk.std_Y,
tBodyAccJerk.std_Z

tBodyGyro.std_X,
tBodyGyro.std_Y,
tBodyGyro.std_Z

tBodyGyroJerk.std_X,
tBodyGyroJerk.std_Y,
tBodyGyroJerk.std_Z

tBodyAccMag.std_,
tGravityAccMag.std_,
tBodyAccJerkMag.std_

tBodyGyroMag.std_,
tBodyGyroJerkMag.std_

fBodyAcc.std_X,
fBodyAcc.std_Y,
fBodyAcc.std_Z

fBodyAccJerk.std_X,
fBodyAccJerk.std_Y,
fBodyAccJerk.std_Z

fBodyGyro.std_X,
fBodyGyro.std_Y,
fBodyGyro.std_Z

fBodyAccMag.std_,
fBodyBodyAccJerkMag.std_

fBodyBodyGyroMag.std_,
fBodyBodyGyroJerkMag.std_

The original data set is divided into two parts, Test data and Training data. For the purpose of this analysis, both the datasets were combined into one. The features in the features.txt file was used as column header for the dataset. Subject names from subject_test.txt & subject_train.txt as well as activity labels from y_test.txt and y_train.txt were combined with this dataset. The activity numbers were replaced with activity names using the activity_labels.txt file.

The data set was then summarised taking the mean for each subject and each activity. There were 30 subjects and 6 activities. Hence there are 180 rows, each row representing one activity for one subject.
