# Tidy data summary using UCI HAR dataset
This repo contains a file named run_analysis.R
Before running this script, one would require to download the dataset from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
Extract this dataset and place it in your R working directory.

The dataset contains data related to human activities recorded using a smartphone that the subjects carried tied to their waists. The dataset is divided into two parts, test and training sets. The structure of both the datasets are similar. The x_ file contains the main data, y_ file carries the names of the activities and the subject_ file carries the name of the subject to whom the particular row pertains.

The script reads all the files in the test and training dataset. It then uses the relevant files to assign relevant variable names using the features.txt file. The activity numbers are converted to activity names. The activity name and subject ID are then merged with the main dataset. 

In the next step, the test and the training datasets are merged to create one single dataset. Then as per the requirement, using this dataset, only the relevant columns containing measurements on mean and standard deviation are extracted.

The data is then summarised, taking the mean of all the values for each subject and each activity. The output thus contains 180 rows, one for each subject and activity combination.
