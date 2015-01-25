# Tidy data summary using UCI HAR dataset
This repo contains a file named run_analysis.R
Before running this script, one would require to download the dataset from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
Extract this dataset and place it in your R working directory.

The script reads the test and training dataset. It then goes on to assign variable names using the features.txt file. It then converts activity numbers to activity names and merges it with the main dataset. It also merges the subject name list with the main dataset. The whole process is repeated twice, once for the test set and once for the training set. The two datasets
