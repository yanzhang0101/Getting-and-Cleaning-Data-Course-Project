# Getting-and-Cleaning-Data-Course-Project
This is the project submission for the Coursera course Getting and Cleaning Data

The submission includes R scripts in the file run_analysis.R, and in order for the scripts to successfully run, you will need
to download the Samsung file (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and extract
into your working directory. 

The script does the following 

  - read in the train and test data files along with the descriptive tables 
  - combine the train and test into one data set
  - rename the activities with descriptive names
  - subset only the variables that are "mean" or "std"
  - reshape the resulting dataset and group by subject and activity
  - calculates the mean for each group and create a txt file with the results
