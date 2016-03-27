run_analysis <- function(){
  # This function reads in the Samsung Smartphone accelerometer and gyroscopic test and train data sets for the 
  # experiments conducted by 30 different subjects performing each of 6 activities
  # The raw data from both data sets is combined into a single data set, containing just the mean() and std()
  # measurements for each variable. The columns for each feature are provided with a descriptive name using 
  # the descriptions provided in the feaures.txt file
  # The merged data set combines observations across subject and activity. The activity is provided by the 
  # category for that activity index in the activity_labels.txt file. The data set is grouped by subject and 
  # activity, and the average for each variable taken, resulting in one row per observation for a particular
  # subject and activity pairing.
  # The function expects to find the test and train datasets in the current working directory
  if(!file.exists("./test/X_test.txt") || !file.exists("./train/X_train.txt") )
     stop("Please ensure that the Samsung test and train data is in your working directory!")
    
  invisible(library(plyr))
  invisible(library(dplyr))
  # Read in test data set 
  message("Reading test data...")
  test_df <- read.table("./test/X_test.txt")
  # Set temporary column names 
  names(test_df) <- sprintf("col%d",1:ncol(test_df))
  # Read in test activity references
  test_labels <- read.table("./test/y_test.txt", col.names = c("activityid"))
  # Read in test subject references
  test_subject <- read.table("./test/subject_test.txt", col.names = c("subjectid"))
  # Append subjectid and activityid to end of dataset
  test_df$subjectid<-test_subject$subjectid
  test_df$activity<-test_labels$activityid
  # Read in training data set
  message("Reading training data...")
  train_df <- read.table("./train/X_train.txt")
  # Set temporary column names 
  names(train_df) <- sprintf("col%d",1:ncol(train_df))
  # Read in train activity references
  train_labels <- read.table("./train/y_train.txt", col.names = c("activityid"))
  # Read in train subject references
  train_subject <- read.table("./train/subject_train.txt", col.names = c("subjectid"))
  # Append subjectid and activityid to end of dataset
  train_df$subjectid<-train_subject$subjectid
  train_df$activity<-train_labels$activityid
  # Merge test and train data frames on subjectid and activity
  message("Merging data sets...")
  merged_df <- join(test_df, train_df, by=c("subjectid","activity"),type="full")
  # Read in features details
  features <- read.table("./features.txt", col.names = c("featureid", "feature"))
  # Filter out only the mean() and std() features
  required_features <- filter(features,grepl("mean\\(\\)|std\\(\\)",feature))
  # Read in activity descriptions
  activity_labels <- read.table("./activity_labels.txt", 
                              col.names = c("activityid", "activity"))
  # Extract only the measurements on the mean and standard deviation for 
  # each measurement.
  # Use descriptive activity names to name the activities in the data set
  message("Cleaning and tidying...")
  merged_df <- merged_df %>% 
      select(c(required_features$featureid,c(subjectid,activity))) %>% 
      mutate(activity = activity_labels$activity[match(activity,activity_labels$activityid)])
  # Appropriately label the data set with descriptive variable names.
  colnames <- gsub("\\-","", required_features$feature)
  colnames <- gsub("\\(\\)","", colnames)
  colnames <- gsub("\\(","", colnames)
  colnames <- gsub("\\)","", colnames)
  colnames <- tolower(colnames)
  colnames <-make.names(names=colnames,unique=TRUE, allow_=TRUE)
  names(merged_df)[-(ncol(merged_df)-c(1,0))] <- colnames
  # Create a second, independent tidy data set with the average of each variable for 
  # each activity and each subject.
  merged_df %>% group_by(subjectid,activity) %>% summarise_each(funs(mean(.)))
}