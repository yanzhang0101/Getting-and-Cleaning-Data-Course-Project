
The submission includes R scripts in the file run_analysis.R, and in order for the scripts to successfully run, you will need to download the Samsung file (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and extract into your working directory.

The script does the following

read in the train and test data files along with the descriptive tables
combine the train and test into one data set
rename the activities with descriptive names
subset only the variables that are "mean" or "std"
reshape the resulting dataset and group by subject and activity
calculates the mean for each group and create a txt file with the results

The produced text data file contains the average value of measurement in the samsung data for each subject and activity
Here are the columns:

#subject 
  - the ID of the corresponding subject participating in the study
  - the value is 1 through 30

#activity_name 
  - descriptive name of the activity
  - There are 6 activities: 
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING

# variable
  - Name of the variable

#mean(value) 
  - the mean value of the measure
  - this is calculated for each subject for each activity
