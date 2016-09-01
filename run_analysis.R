
# we will use the melt function in the reshape2 library to create tidy data and also use the
# dplyr to group data by subject and activity, then calculate the average for each group
library(reshape2)
library(dplyr)

# read activity lables into the variable activity_labels and rename the columns 
activity_labels <- read.table("activity_labels.txt", header = FALSE)
names(activity_labels) = c("activity_code", "activity_name")

#read the features into the features variable and rename the columns
features <- read.table("features.txt", header = FALSE, sep = " ")
names(features) = c("feature_code", "feature_name")

# use teh grep funciton to extract the features with thet name containing eith "mean" or "std"
mean_std_variables <- grep("mean|std", features$feature_name)

# read all the data files
x_test <- read.table(file = "./test/X_test.txt", header = FALSE)
y_test <- read.table(file = "./test/Y_test.txt", header = FALSE)
subject_test <- read.table("./test/subject_test.txt", header = FALSE)

x_train <- read.table(file = "./train/X_train.txt", header = FALSE)
y_train <- read.table(file = "./train/Y_train.txt", header = FALSE)
subject_train <- read.table("./train/subject_train.txt", header = FALSE)

# merge teh train and test datasets using rbind and rename the columns with the descriptive feature names
hacData <- rbind(x_train, x_test)
colnames(hacData) <- features$feature_name

# subset the data to include only the mean and std variables, and store the result in myData
myData <- hacData[,mean_std_variables]

# merge in activity data and subject data
myData$activity <- rbind(y_train, y_test)[,1]
myData$subject <- rbind(subject_train, subject_test)[,1]

# join with activity_labels to bring in the descriptive activity name
myData2 <- merge(myData, activity_labels, by.x="activity", by.y="activity_code")

# remove activity code column since we only need the activity name
myData3 <- select(tbl_df(myData2), -1)

# reshape the data using subject and activity_name as the id
myData4 <- melt(myData3, id.vars = c("subject", "activity_name"))

# group the data by subject and activity name
myData5 <- group_by(myData4, subject, activity_name)

# calculate mean value for each group
myData6 <- summarize(myData5, mean(value))

# create the txt file using the write.table function
write.table(myData6, file = "avg_mean_std.txt", row.name = FALSE)
