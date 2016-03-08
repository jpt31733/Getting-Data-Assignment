# Extract measurements on mean and standard deviation for each measurement
# Read in the "features" data frame.  It will be used to assign meaningful
# names to the variables in df
features <- read.table("UCI HAR Dataset/features.txt")

# Extract the appropriate names and tidy up the result so that the names list
# looks good
list <- grep('mean\\(|std\\(', features$V2)
names_list <- make.names(features[list,2])
names_list <- gsub("\\.+", "_", gsub("\\.+$", "",names_list))
names_list <- tolower(sub("BodyBody", "Body", names_list))

# Restrict measurements data frame to mean and standard deviation mesurements
list <- c(list, 562, 563) # In order to keep the two new columns
x <- x[, list] # Get rid of variables that are not means or s.d.

# Assign meaningful names to the variables and activity levels
names_list <- c(names_list, "activity", "subject")
names(x) <- names_list # Replace variable names in df
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
x$activity <- factor(x$activity)
levels(x$activity) <- act_labels$V2

# Order the data frame by activity and subject
x <- arrange(x, activity, subject) 
#then group by the same variables to prepare for summarizing
x <- group_by(x, activity, subject)

# Finally create the summary data frame
summary_df <- summarise_each(x, funs(mean))