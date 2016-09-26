setwd('/home/marta/Documents/Data_Science/3. Getting and Clearing Data/UCI HAR Dataset/')

## reading data from the files into the variables
actTrain <- read.table('train/y_train.txt', header = FALSE)
feaTrain <- read.table('train/X_train.txt', header = FALSE)
subTrain <- read.table('train/subject_train.txt', header = FALSE)
actTest <- read.table('test/y_test.txt', header = FALSE)
feaTest <- read.table('test/X_test.txt', header = FALSE)
subTest <- read.table('test/subject_test.txt', header = FALSE)

## merging the train and the test sets to one data set.
actData <- rbind(actTrain, actTest)
feaData <- rbind(feaTrain, feaTest)
subData <- rbind(subTrain, subTest)

names(actData) <- c('activity')
feaNames <- read.table('features.txt', header = FALSE)
names(feaData) <- feaNames$V2
names(subData) <- c('subject')

data <- cbind(subData, actData)
finalData <- cbind(feaData, data)

## extracting only the measurements on the mean and standard deviation for each measurement
subsetMeasNames <- feaNames$V2[grep('mean\\(\\)|std\\(\\)', feaNames$V2)] 
MeasurementsData <- subset(finalData, select = c(as.character(subsetMeasNames), "subject", "activity" ))
str(MeasurementsData)

## using descriptive activity names to name the activities in the data set
labelsData <- read.table('activity_labels.txt', header = FALSE)

## labeling the data set with descriptive variable names
names(finalData) <- gsub('^t', 'time', names(finalData))
names(finalData) <- gsub('^f', 'features', names(finalData))
names(finalData) <- gsub('Acc', 'Accelerometer', names(finalData))
names(finalData) <- gsub('Gyro', 'Gyroscope', names(finalData))
names(finalData) <- gsub('Mag', 'Magnitude', names(finalData))
names(finalData) <- gsub('BodyBody', 'Body', names(finalData))

## creating independent tidy data set with the average of each variable for each activity and each subject
library(plyr)
library(reshape2)
data2 <- ddply(melt(finalData, id.vars=c("subject", "activity")), .(subject, activity), summarise, MeanSamples=mean(value))
write.table(data2, file = "tidydata.txt", row.name=FALSE)

library(knitr)
knit2html("codebook.Rmd")
