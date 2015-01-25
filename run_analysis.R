# Read the feature names from the features.txt file. Clean the feature names and make them unique for use as column labels
features <- read.table("UCI HAR Dataset/features.txt", header = F)
features$V2 <- gsub("-|,",".",features$V2)
features$V2 <- gsub("\\()","_",features$V2)
features$V2 <- gsub("_.","_",features$V2)
features$V2 <- make.names(features$V2, unique =T)

# Read the activity names from the activity_labels.txt file
act_labels <- read.table("uci har dataset/activity_labels.txt")

# Read the test dataset
x_test <- read.table("UCI HAR Dataset/test/x_test.txt") # Main dataset
y_test <- read.table("UCI HAR Dataset/test/y_test.txt") # Row wise activity label
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = F) # Row wise subject name for the dataset

# Use the features table to label the columns of the test dataset
names(x_test) <- c(as.vector(features$V2))

# Using the activity labels table, add a second column to the activity table to represent the activity name instead of the activity number
y_test$labels <- act_labels$V2[match(y_test$V1, act_labels$V1)]

# Combine the subject names, activity labels and main dataset into one
x_test <- cbind.data.frame(subject = subject_test$V1, activity = y_test$labels, x_test)

# Repeat all the above steps for the training dataset 
x_train <- read.table("UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = F)

names(x_train) <- c(as.vector(features$V2))

y_train$labels <- act_labels$V2[match(y_train$V1, act_labels$V1)]
x_train <- cbind.data.frame(subject = subject_train$V1, activity = y_train$labels, x_train)

# Combine the final test and training dataset into one single dataset
alldata <- rbind(x_test, x_train)

# The following part will require the user to load the dplyr package. Use install.packages("dplyr") to install the package if it is not already installed. Then load the package.
library(dplyr)

# Convert the single dataset into a dplyr table dataframe object.
my_df <- tbl_df(alldata)

# Using the chaining operator, summarize the dataset
# In the first step, select only those columns which contain mean or std in the column name. Also select the subject and activity name columns
# Then group the dataset by subject as well as activity
# Then summarize the dataset using the mean function and assign it to a new variable
# This will yield one row for each subject and activity combination, i.e. a total of 180 rows.
my_df %>% 
     select(subject, activity, contains("mean"),contains("std")) %>%
     group_by(subject, activity) %>% 
     summarise_each(funs(mean)) -> dat_sum
     
# Write the final output into a file named tidy_data.csv
write.table(dat_sum, "tidy_data.txt", row.names = F, quote = F, sep = ",")


##---------------------------------------------------------------------------

# In case the dplyr package is not available or cannot be loaded for any reason, use the following code to summarize the dataset     

subjects <- 1:30 #create the subject vector
activities <- as.vector(act_labels$V2) #create a vector with activity names
col_in <- grepl("mean|std", names(alldata), ignore.case=T) #Create a logical vector of column numbers containing the terms mean and std
col_in[1:2] <- TRUE #make the first two values TRUE so that subject and activity column can be subsetted
alldata2 <- alldata[,col_in] #Select only the columns where col_in is true

# Create a data frame that will hold the final summarised data
# This data frame's first column contains the subject names. Since each subject will appear 6 times, 1:30 has been repeated six times. To keep the same subject together, the vector has been sorted in ascending order.
# The second column contains the 6 activity names repeated 30 times 
final_data <- data.frame(subject = sort(rep(1:30, 6)), activity = rep(activities, 30))

# The following for loop works in three levels
# At the first level, one column is selected from the dataset
# At the second level, one subject is selected
# At the third level, one activity is selected, then the summary value is calculated
# Once all the activities for a particular subject is exhausted, the loop exits the third level and at the second level, moves to the next subject
# Once all subjects are exhausted at the second level, the loop exits the second level and at the first level, the next column is selected
# At this point, row number is reset back to 1 so that the summary for the next column starts from the first row
for (i in seq_along(alldata2[3:88])){
     row_num <- 1
     for (j in seq_along(subjects)){ 
          for (k in seq_along(activities)){
               final_data[row_num,i+2] <- mean(alldata2[alldata2$subject == j & 
                                                        alldata2$activity == activities[k],i+2])
               k <- k+1
               row_num <- row_num+1
          }
          j <- j+1
     }
     names(final_data)[i+2] <- names(alldata2[i+2])
}

# Write the final output into a file named tidy_data.csv
write.table(final_data, "tidy_data.txt", row.names = F, quote = F, sep = ",")
