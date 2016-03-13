#Getting and Cleaning Data Course Project

In this repository, you will find my work related to the [Coursera Data Science's track course](https://www.coursera.org/learn/data-cleaning).
The relative dataset can be found here: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Prerequisites
* We assume the data set is available and downloadable using the link: [URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* We assume nothing has changed in this dataset and has been renamed since March 12, 2016, submission date of this work

## Description of produced work

* The file `CodeBook.md` contains a code book that modifies and updates the originally available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
* The file `run_analysis.R` contains all the code to merge the original datasets, and clean the data to produce a tidy data set and independent tidy data set with the average of each variable for each activity and each subject.

## Output 
The code produces a file called `averages_data.txt`.

## Execution
To launch the script, all you have to do is source the `run_analysis.R` file