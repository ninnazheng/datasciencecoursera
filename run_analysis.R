##read the train_set,test_set
train_set <- read.table(file.choose())
test_set <- read.table(file.choose())
##merge the train_set and the test_set
data_set <- rbind(train_set,test_set)
##read the features'data
features <- read.table(file.choose())
colnames(data_set) <- features[,2]
##extracts the string "mean()" and "std()" variable
x <- features[,2]
mean_measurement <- x[grepl('mean()',x)] 
mean_measurement <- mean_measurement[c(-grep('meanFreq()',mean_measurement))]
std_measurement <- x[grepl('std()',x)] 
mean_std <- c(as.character(mean_measurement),as.character(std_measurement))
##extracts only the measurements on the mean and standard deviation for each measurement
data_set_clean <- data_set[,colnames(data_set) %in% mean_std]
##read the activity_labels,train_label,test_label
activity_labels <- read.table(file.choose()) 
train_label <- read.table(file.choose())
test_label <- read.table(file.choose())
#appropriately labels the data set with descriptive activity names
train_activity <- merge(train_label,activity_labels,by.x = "V1",by.y = "V1",all = TRUE)
test_activity <- merge(test_label,activity_labels,by.x = "V1",by.y = "V1",all = TRUE)
data_activity <- rbind(train_activity,test_activity)
data_set_clean <- as.matrix(data_set_clean)
rownames(data_set_clean) <- data_activity[,2]
write.table(data_set_clean, file = "data_set_clean.txt")
#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
data_set_walking <- data_set_clean[rownames(data_set_clean) == "WALKING",]
data_set_walking_upstairs <- data_set_clean[rownames(data_set_clean) == "WALKING_UPSTAIRS",]
data_set_walking_downstairs <- data_set_clean[rownames(data_set_clean) == "WALKING_DOWNSTAIRS",]
data_set_sitting <- data_set_clean[rownames(data_set_clean) == "SITTING",]
data_set_standing <- data_set_clean[rownames(data_set_clean) == "STANDING",]
data_set_laying <- data_set_clean[rownames(data_set_clean) == "LAYING",]
data_set_clean2 <- rbind(apply(data_set_walking,2,mean),apply(data_set_walking_upstairs,2,mean),
                         apply(data_set_walking_downstairs,2,mean),
                         apply(data_set_sitting,2,mean),apply(data_set_standing,2,mean),apply(data_set_laying,2,mean))
rownames(data_set_clean2) <- activity_labels[,2]
write.table(data_set_clean2, file = "data_set_clean2.txt")



