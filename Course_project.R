#Getting & Cleaning Data
#Course project

###download & prepare data
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
              destfile = './project_data.zip', method = 'curl', quiet = T)
unzip(zipfile = 'project_data.zip')

#data labels
activity <- read.table('./UCI HAR Dataset/activity_labels.txt', col.names 
                       = c('activityLabels', 'activityName'), quote = "")

features <- read.table('./UCI HAR Dataset/features.txt', col.names 
                                   = c('featureLabels', 'featureName'), quote = "")

#train data 
Y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
SubjTrain <- read.table('./UCI HAR Dataset/train/subject_train.txt', col.names = c('subjectId'))

colnames(X_train) <- features$featureName
colnames(Y_train) <- c('activityLabels')

train_data <- cbind(SubjTrain, X_train, Y_train)

#test data
Y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
SubjTest <- read.table('./UCI HAR Dataset/test/subject_test.txt', col.names = c('subjectId'))

colnames(X_test) <- features$featureName
colnames(Y_test) <- c('activityLabels')

test_data <- cbind(SubjTest, X_test, Y_test)

### Part I: Merge the training and the test sets to create one data set.
p1_data <- rbind(train_data, test_data)

### Part II: Extract only the measurements on the mean and standard deviation for each measurement. 
p2_data <- p1_data[, c(1, grep(pattern = 'mean\\(\\)|std\\(\\)', 
                            x = names(p1_data)), 563)]

### Part III: Use descriptive activity names to name the activities  
p2_data$subjectId <- as.factor(p2_data$subjectId)
p2_data$activity <- factor(p2_data$activityLabels,
                           levels = activity$activityLabels,
                           labels = activity$activityName)

#remove activity code var
p3_data <- p2_data[,-68]

###Part IV: Appropriatel labels the data set with descriptive variable names. 
#reorder activity to 2nd col
p4_data <- p3_data[,c(1, 68, 2:67)]

#remove () from colnames
colnames(p4_data) <- gsub(pattern = '\\(\\)', replacement = "", x = names(p4_data))

###Part V: Creates a second, independent tidy data set with the average of
#          each variable for each activity and each subject.

#create data table
p5_data <- data.table(p4_data)

#create mean across subjID and activity 
p5_data  <- p5_data[, lapply(.SD, mean), by = 'subjectId,activity']

#write table
library(dplyr)
write.table(p5_data, file = 'CourseProjectData.txt', row.names = F, quote = F, sep = "\t")

#clean up global enviroment
rm(list = ls()[!ls() %in% c("p1_data", "p2_data", "p3_data", "p4_data", "p5_data")])

#clean console
cat("\014")

#print TY
print("Variables for each part of the assignment can be found in the global environment") 
print("Thank you for reviewing my work!")
 
