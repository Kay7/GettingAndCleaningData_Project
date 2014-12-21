
# loading required packages
library(dplyr)

# reading data from working directory which contains the 'UCI HAR Dataset'
# 'colClasses' and 'nrows' arguments added to reduce run time
x_test<-read.table("UCI HAR Dataset/test/X_test.txt", colClasses="numeric", nrows=2947)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt", colClasses="integer", nrows=2947)
sub_test<-read.table("UCI HAR Dataset/test/subject_test.txt", colClasses="integer", nrows=2947)
x_train<-read.table("UCI HAR Dataset/train/X_train.txt", colClasses="numeric", nrows=7352)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt", colClasses="integer", nrows=7352)
sub_train<-read.table("UCI HAR Dataset/train/subject_train.txt", colClasses="integer", nrows=7352)
features<-read.table("UCI HAR Dataset/features.txt", colClasses=c("integer","factor"), nrows=561)
labels<-read.table("UCI HAR Dataset/activity_labels.txt", colClasses=c("integer","factor"), nrows=6)

# combining test and train data sets
test_data<-cbind(sub_test, y_test, x_test)
train_data<-cbind(sub_train, y_train, x_train)
combined_data<-rbind(train_data, test_data)

# extracting the measurements of mean and standard deviation for each observation
var_names<-make.names(features[,2], unique=TRUE)
names(combined_data)<-c("Subject","Activity", var_names)
required_data<-select(combined_data, Subject, Activity, contains('mean'),contains('std'), -contains('meanFreq'), -contains('angle'))

# assigning descriptive names to the activities 
ordered_data<-arrange(required_data, Subject, Activity)
activity_labels<-labels[,2]
ordered_data[,2]<-factor(ordered_data[,2], labels=activity_labels)

# labelling the columns with descriptive variable names
names(ordered_data)<-c("Subject","Activity",
                       "tBodyAcc_X_mean","tBodyAcc_Y_mean","tBodyAcc_Z_mean","tGravityAcc_X_mean","tGravityAcc_Y_mean","tGravityAcc_Z_mean","tBodyAccJerk_X_mean","tBodyAccJerk_Y_mean","tBodyAccJerk_Z_mean","tBodyGyro_X_mean","tBodyGyro_Y_mean","tBodyGyro_Z_mean","tBodyGyroJerk_X_mean","tBodyGyroJerk_Y_mean","tBodyGyroJerk_Z_mean","tBodyAccMag_mean","tGravityAccMag_mean","tBodyAccJerkMag_mean","tBodyGyroMag_mean","tBodyGyroJerkMag_mean","fBodyAcc_X_mean","fBodyAcc_Y_mean","fBodyAcc_Z_mean","fBodyAccJerk_X_mean","fBodyAccJerk_Y_mean","fBodyAccJerk_Z_mean","fBodyGyro_X_mean","fBodyGyro_Y_mean","fBodyGyro_Z_mean","fBodyAccMag_mean","fBodyAccJerkMag_mean","fBodyGyroMag_mean","fBodyGyroJerkMag_mean",
                       "tBodyAcc_X_std" ,"tBodyAcc_Y_std" ,"tBodyAcc_Z_std" ,"tGravityAcc_X_std" ,"tGravityAcc_Y_std" ,"tGravityAcc_Z_std" ,"tBodyAccJerk_X_std" ,"tBodyAccJerk_Y_std" ,"tBodyAccJerk_Z_std" ,"tBodyGyro_X_std" ,"tBodyGyro_Y_std" ,"tBodyGyro_Z_std" ,"tBodyGyroJerk_X_std" ,"tBodyGyroJerk_Y_std" ,"tBodyGyroJerk_Z_std" ,"tBodyAccMag_std" ,"tGravityAccMag_std" ,"tBodyAccJerkMag_std" ,"tBodyGyroMag_std" ,"tBodyGyroJerkMag_std" ,"fBodyAcc_X_std" ,"fBodyAcc_Y_std" ,"fBodyAcc_Z_std" ,"fBodyAccJerk_X_std" ,"fBodyAccJerk_Y_std" ,"fBodyAccJerk_Z_std" ,"fBodyGyro_X_std" ,"fBodyGyro_Y_std" ,"fBodyGyro_Z_std" ,"fBodyAccMag_std" ,"fBodyAccJerkMag_std" ,"fBodyGyroMag_std" ,"fBodyGyroJerkMag_std")

# tidying the data and calculating the average of each variable column for each activity and each subject
final_data<-summarise_each(group_by(ordered_data, Subject, Activity), funs(mean))

# writing the tidy final data to a .txt file
write.table(final_data, "tidy_data.txt", row.name=FALSE)

