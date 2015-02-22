## Original dataset
The original dataset includes the following files:
* 'UCI HAR Dataset/README.txt'
* 'UCI HAR Dataset/features_info.txt': Shows information about the variables used on the feature vector.
* 'UCI HAR Dataset/features.txt': List of all features.
* 'UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name.
* 'UCI HAR Dataset/train/X_train.txt': Training set.
* 'UCI HAR Dataset/train/y_train.txt': Training labels.
* 'UCI HAR Dataset/test/X_test.txt': Test set.
* 'UCI HAR Dataset/test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
* 'UCI HAR Dataset/train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Notes: Features are normalized and bounded within [-1,1].

## Resulting dataset
The resulting dataset created by 'run_analysis.R' script is in 'averageSet.txt' file. It includes the following variables:
* 'person_id' - id of subject (person) participating in experiment
* 'activity' - performed activity.
* 'mean(...)' - average values of extracted measurements (there were extracted only the mean and standard deviation for each measurement). Measurement description are in: 'UCI HAR Dataset/features.txt' and 'UCI HAR Dataset/features_info.txt'. Measurements (features) are normalized and bounded within [-1,1], so they have not units.