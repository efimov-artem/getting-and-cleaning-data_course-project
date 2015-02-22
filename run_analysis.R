# 1. Read labels of activitis.
activity_labels <- read.table("UCI HAR Dataset\\activity_labels.txt", col.names=c("activity_id","activity_label"))

# 2. Read activities from 'train' and 'test' sets.
activities1 <- read.table('UCI HAR Dataset\\train\\y_train.txt', col.names="activity_id")
activities2 <- read.table('UCI HAR Dataset\\test\\y_test.txt', col.names="activity_id")

# 3. Bind activities into the single data frame, transform activities from data frame to factor
# so the activites would have descriptive names.
activities <- rbind(activities1, activities2)
fActivities <- factor(activities$activity_id, labels=activity_labels[,2])
rm('activities1','activities2')

# 4. Read subjects from 'train' and 'test' sets.
subjects1 <- read.table('UCI HAR Dataset\\train\\subject_train.txt', col.names=c('person_id'))
subjects2 <- read.table('UCI HAR Dataset\\test\\subject_test.txt', col.names=c('person_id'))

# 5. Bind subjects into the single data frame.
subjects <- rbind(subjects1, subjects2)
rm('subjects1','subjects2')

# 6. Read features.
features <- read.table('UCI HAR Dataset\\features.txt', colClasses=c('numeric','character'), nrows=561, col.names=c("feature_id","feature_name"))

# 7. Read measured values of features from 'train' and 'test' sets.
set1 <- read.table('UCI HAR Dataset\\train\\X_train.txt', colClasses=rep('numeric',561) )
set2 <- read.table('UCI HAR Dataset\\test\\X_test.txt', colClasses=rep('numeric',561) )

# 8. Bind sets into the single data frame, assign names of variables from features names.
Set <- rbind(set1, set2)
names(Set) <- features$feature_name
rm('set1','set2')

# 9. Extracts indices of the measurements on the mean and standard deviation for each measurement.
extract_indices <- rbind( grep("min",names(Set)), grep("std",names(Set) ) )
extract_indices <- sort(as.vector( extract_indices ))

# 10. Extracts the measurements on the mean and standard deviation for each measurement.
Set <- Set[,extract_indices]

# 11. Add to Set data frame columns with ids of subjects and activities.
Set <- cbind(subjects, fActivities, Set)
names(Set)[2] <- "activity"

# 12. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

SetMelt <- melt(Set, id=c("person_id","activity"), measure.vars = names(Set)[3:length(names(Set))])
averageSet <- dcast(SetMelt, ...~variable,mean)

# 13. Rename the columns with variables in the second data set to descript that they are average values.
for(i in 3:length(names(averageSet))) {
    names(averageSet)[i] <- paste("mean(",names(averageSet)[i],")", sep="")
}

# 14. Write tidy data set to file.
write.table(averageSet, file = "averageSet.txt", row.name=FALSE)