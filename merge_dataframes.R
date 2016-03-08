# Add columns "Activity" and "Subject" to x_train and x_test data frames
x_train$activity <- y_train$V1
x_train$subject <- subject_train$V1
x_test$activity <- y_test$V1
x_test$subject <- subject_test$V1

# Merge x_train and x_test into one data frame
x <- rbind(x_train, x_test)