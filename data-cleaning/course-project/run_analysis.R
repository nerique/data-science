#Loads the plyr library for further dependencies (ddply)
library("plyr")

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', dest = "dataset.zip")
unzip("dataset.zip")

#For debugging purpose, limit the amounf of data gathered from files. Set -1 for production
nrow <- -1

#1- Read all the files needed
#Data sets
train_set <- read.table("UCI HAR Dataset/train/X_train.txt", nrows = nrow)
test_set <- read.table("UCI HAR Dataset/test/X_test.txt", nrows = nrow)
#Activity IDs
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt", nrows = nrow)
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt", nrows = nrow)
#Subject IDs
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", nrows = nrow)
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", nrows = nrow)
#Activity labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
#Feature labels
features <- read.table("UCI HAR Dataset/features.txt")

#2- Merges the training and the test sets to create one data set.
merged_set <- rbind(train_set, test_set)
merged_labels <- rbind(train_labels, test_labels)
merged_subject <- rbind(train_subject, test_subject)

#3- Extracts only the measurements on the mean and standard deviation for each measurement.
features_indices <- grepl("-(mean|std)\\(\\)", features[,2])
merged_set <- merged_set[features_indices]

#3- Uses descriptive activity names to name the activities in the data set
merged_labels[,1] <- activities[merged_labels[,1], 2]

#4- Appropriately labels the data set with descriptive variable names.
features_names <- features[features_indices, 2]
names(merged_set) <- features_names
names(merged_labels) <- "activity"
names(merged_subject) <- "subject"

my_merged_dataset <- cbind(merged_subject, merged_labels, merged_set)

#5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
averaged_dataset <- ddply(my_merged_dataset, .(subject, activity), numcolwise(mean))

write.table(averaged_dataset, "averaged_dataset.txt", row.name=FALSE)