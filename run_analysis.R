activity_labels <- read.table("UCI HAR Dataset\\activity_labels.txt", col.names=c("activity_id","activity_label"))

activities1 <- read.table('UCI HAR Dataset\\train\\y_train.txt', col.names="activity_id")
activities2 <- read.table('UCI HAR Dataset\\test\\y_test.txt', col.names="activity_id")
activities <- rbind(activities1, activities2)
rm('activities1','activities2')
fActivities <- factor(activities$activity_id, labels=activity_labels[,2])

subjects1 <- read.table('UCI HAR Dataset\\train\\subject_train.txt', col.names=c('person_id'))
subjects2 <- read.table('UCI HAR Dataset\\test\\subject_test.txt', col.names=c('person_id'))
subjects <- rbind(subjects1, subjects2)
rm('subjects1','subjects2')

features <- read.table('UCI HAR Dataset\\features.txt', colClasses=c('numeric','character'), nrows=561, col.names=c("feature_id","feature_name"))

set1 <- read.table('UCI HAR Dataset\\train\\X_train.txt', colClasses=rep('numeric',561) )
set2 <- read.table('UCI HAR Dataset\\test\\X_test.txt', colClasses=rep('numeric',561) )
Set <- rbind(set1, set2)
names(Set) <- features$feature_name
rm('set1','set2')

extract_indices <- rbind( grep("min",names(Set)), grep("std",names(Set) ) )
extract_indices <- sort(as.vector( extract_indices ))

Set <- Set[,extract_indices]
Set <- cbind(subjects, fActivities, Set)
names(Set)[2] <- "activity"

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
SetMelt <- melt(Set, id=c("person_id","activity"), measure.vars = names(Set)[3:length(names(Set))])
averageSet <- dcast(SetMelt, ...~variable,mean)
for(i in 3:length(names(averageSet))) {
    names(averageSet)[i] <- paste("mean(",names(averageSet)[i],")", sep="")
}
# Write to file for upload.
write.table(averageSet, file = "averageSet.txt", row.name=FALSE)