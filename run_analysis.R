input<-"D:\\Coursera\\Getting and Cleaning Data\\Input\\UCI HAR Dataset\\"
setwd(input)

X_test<-read.table(file=paste0(input, "test\\X_test.txt"))
Y_test<-read.table(file=paste0(input, "test\\Y_test.txt"))
subject_test<-read.table(file=paste0(input, "test\\subject_test.txt"))

X_train<-read.table(file=paste0(input, "train\\X_train.txt"))
Y_train<-read.table(file=paste0(input, "train\\Y_train.txt"))
subject_train<-read.table(file=paste0(input, "train\\subject_train.txt"))

features<-read.table(file=paste0(input, "features.txt"), stringsAsFactors=F)


# 1. Merges the training and the test sets to create one data set.
data.1<-data.frame(rbind(cbind(X_train, Y_train, subject_train), 
                             cbind(X_test,  Y_test,  subject_test)))
names(data.1)<-c(features$V2, "labelsCode", "Subject")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
temp=c(grep("mean()", names(data.1), fixed=T), grep("std()", names(data.1), fixed=T))
temp=temp[order(temp)]

data.2<-cbind(data.1[, temp], data.1[, c("labelsCode", "Subject")])

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels<-read.table(file=paste0(input, "activity_labels.txt"))
names(activity_labels)<-c("labelsCode", "ActivityLabel")
data.3<-merge(data.2, activity_labels, by="labelsCode", all.x=T, all.y=F)

# 4. Appropriately labels the data set with descriptive variable names. 
# Already done in Step 1

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
data.5<-aggregate(data.3[, !(names(data.3) %in% c("labelsCode", "ActivityLabel","Subject"))], 
                  list(Subject=data.3$Subject, ActivityLabel=data.3$ActivityLabel), mean, na.rm=T)
write.table(data.5, file=paste0(input, "TidyData.txt"))


