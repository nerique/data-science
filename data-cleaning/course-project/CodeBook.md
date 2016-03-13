## Code Book

To achieve the goal of the course, the script performs the steps required. This document describes the code contained in `run_analysis.R` file.

* We first load the dependencies: plyr package. (line 2)
* Download and unzip the dataset (line 4:5)
* About the usage of `nrow` variable, see section [Debug](#debug) below (line 8)
* We read and load into variables all the files we will use further (line 10:23)
* We merge into `merged_set` the train and test measurement values (line 26)
* We merge into `merged_labels` the train and test activity ids (line 27)
* We merge into `merged_subject` the train and test subject ids (line 28)
* From the features.txt, we get only the measurements on the mean and standard deviation for each measurement. (line 31)
* We limit `merged_set` columns to mean and standard deviations (line 32)
* We replace in merged_labels the activity ids by the activity labels (line 35)
* We rename appropriately all the columns of the merged_set, merged_labels and merged_subject variables (line 38:41)
* We cbind the three merged_ variables to merge everything into only one data frame (line 43)
* Variable `my_merged_dataset`now contains a tidy dataset
* We create a second, independent tidy data set `averaged_dataset` with the average of each variable for each activity and each subject. (line 46)
* Finally, we write this `averaged_dataset` to a file named `averaged_dataset.txt` (line 48)

## <a name="debug">Debug</a>

For debugging purpose, you can change the number of rows gathered from each file.  For example, nrow <- 10 will only retrieve the 10 first lines of the data sets. Don't forget to reset it to -1 when done.


