## Load dplyr for the use of select and mutate funcitons
library(dplyr)
## Set working directory to the root location of HAR data files
setwd("C:/Users/ssharaf/Documents/RWD/UCI HAR Dataset")
## Load list of features to be used as column headers
zip.file <- "getdata-projectfiles-UCI HAR Dataset.zip"
feature.filename <- "UCI HAR Dataset/features.txt"
har.features <- read.table(unz(zip.file, feature.filename), sep='\t')
## Convert the features into a vector to be used for column names in the data table
har.features<-as.vector(har.features$V1)
## Load the test data set
data.filename<- "UCI HAR Dataset/test/X_test.txt"
subject.filename <- "UCI HAR Dataset/test/subject_test.txt"
activity.filename <- "UCI HAR Dataset/test/y_test.txt"
har.data.test <- cbind(read.table(unz(zip.file, activity.filename)), +
                       read.table(unz(zip.file, subject.filename)), +
                       read.table(unz(zip.file, data.filename)))
## Load the training data set
data.filename <- "UCI HAR Dataset/train/X_train.txt"
subject.filename <- "UCI HAR Dataset/train/subject_train.txt"
activity.filename <- "UCI HAR Dataset/train/y_train.txt"
har.data.train <- cbind(read.table(unz(zip.file, activity.filename)), +
                            read.table(unz(zip.file, subject.filename)), +
                            read.table(unz(zip.file, data.filename)))
## Add the two data sets together
har.data <- rbind(har.data.test, har.data.train)
## Load list of features to be used as column headers
feature.filename<-paste(getwd(),"/features.txt", sep='')
har.features <- read.table(feature.filename, sep='\t')
## Convert the features into a vector to be used for column names in the data table
har.features<-as.vector(har.features$V1)
## Update column names
colnames(har.data)<- c("Activity", "Subject", har.features)
## Keep mean and std columns only
har.mean.std<-cbind(select(har.data, contains("Activity")), +
                        select(har.data, contains("subject")), +
                        select(har.data,contains("Mean",ignore.case=TRUE)), +
                        select(har.data,contains("std")))
## Replace activity numbers with meaningful activity names
Activities <- c("Walking", "Walking_Upstairs", "Walking_Downstairs", 
                "Sitting", "Standing", "Laying")
har.mean.std <- mutate(har.mean.std,Activity = Activities[Activity])
## Replace variable names with more meaningful variables names
vnames <- c("Activity", "Subject", "Time_Body_Acc_Mean_X", 
            "Time_Body_Acc_Mean_Y", 
            "Time_Body_Acc_Mean_Z", "Time_Gravity_Acc_Mean_X",
            "Time_Gravity_Acc_Mean_Y", "Time_Gravity_Acc_Mean_Z",
            "Time_Body_Acc_Jerk_Mean_X", "Time_Body_Acc_Jerk_Mean_Y",
            "Time_Body_Acc_Jerk_Mean_Z", "Time_Body_Gyro_Mean_X", 
            "Time_Body_Gyro_Mean_Y", "Time_Body_Gyro_Mean_Z",
            "Time_Body_Gyro_Jerk_Mean_X", "Time_Body_Gyro_Jerk_Mean_Y",
            "Time_Body_Gyro_Jerk_Mean_Z", "Time_Body_Acc_Mean_Mag",
            "Time_Gravity_Acc_Mean_Mag", "Time_Gravity_Acc_Jerk_Mean_Mag",
            "Time_Body_Gyro_Mean_Mag", "Time_Body_Gyro_Jerk_Mean_Mag",
            "Fourier_Body_Acc_Mean_X", "Fourier_Body_Acc_Mean_Y",
            "Fourier_Body_Acc_Mean_Z", "Fourier_Body_Acc_Freq_Mean_X",
            "Fourier_Body_Acc_Freq_Mean_Y", "Fourier_Body_Acc_Freq_Mean_Z",
            "Fourier_Body_Acc_Jerk_Mean_X", "Fourier_Body_Acc_Jerk_Mean_Y",
            "Fourier_Body_Acc_Jerk_Mean_Z", "Fourier_Body_Acc_Jerk_Freq_Mean_X",
            "Fourier_Body_Acc_Jerk_Freq_Mean_Y", 
            "Fourier_Body_Acc_Jerk_Freq_Mean_Z", "Fourier_Body_Gyro_Mean_X",
            "Fourier_Body_Gyro_Mean_Y", "Fourier_Body_Gyro_Mean_Z",
            "Fourier_Body_Gyro_Freq_Mean_X", "Fourier_Body_Gyro_Freq_Mean_Y",
            "Fourier_Body_Gyro_Freq_Mean_Z", "Fourier_Body_Acc_Mean_Mag",
            "Fourier_Body_Acc_Mean_Freq_Mag", "Fourier_Gravity_Acc_Jerk_Mean_Mag",
            "Fourier_Gravity_Acc_Jerk_Freq_Mean_Mag", 
            "Fourier_Body_Gyro_Mean_Mag", "Fourier_Body_Gyro_Mean__FreqMag", 
            "Fourier_Body_Gyro_Jerk_Mean_Mag", 
            "Fourier_Body_Gyro_Jerk_Freq_Mean_Mag", "Time_Body_Acc_Angle_Mean",
            "Time_Gravity_Acc_Jerk_Angle_Mean", "Time_Body_Gyro_Angle_Mean",
            "Time_Body_Gyro_Jerk_Angle_Mean", "Angle_Gravity_Mean_X", 
            "Angle_Gravity_Mean_Y", "Angle_Gravity_Mean_Z",
            "Time_Body_Acc_Std_X", "Time_Body_Acc_Std_Y", "Time_Body_Acc_Std_Z",
            "Time_Gravity_Acc_Std_X", "Time_Gravity_Acc_Std_Y",
            "Time_Gravity_Acc_Std_Z", "Time_Body_Acc_Jerk_Std_X",
            "Time_Body_Acc_Jerk_Std_Y", "Time_Body_Acc_Jerk_Std_Z",
            "Time_Body_Gyro_Std_X", "Time_Body_Gyro_Std_Y",
            "Time_Body_Gyro_Std_Z", "Time_Body_Gyro_Jerk_Std_X", 
            "Time_Body_Gyro_Jerk_Std_Y", "Time_Body_Gyro_Jerk_Std_Z",
            "Time_Body_Acc_Std_Mag", "Time_Gravity_Acc_Std_Mag",
            "Time_Gravity_Acc_Jerk_Std_Mag", "Time_Body_Gyro_Std_Mag",
            "Time_Body_Gyro_Jerk_Std_Mag", "Fourier_Body_Acc_Std_X",
            "Fourier_Body_Acc_Std_Y", "Fourier_Body_Acc_Std_Z",
            "Fourier_Body_Acc_Jerk_Std_X", "Fourier_Body_Acc_Jerk_Std_Y",
            "Fourier_Body_Acc_Jerk_Std_Z", "Fourier_Body_Gyro_Std_X",
            "Fourier_Body_Gyro_Std_Y", "Fourier_Body_Gyro_Std_Z", 
            "Fourier_Body_Acc_Std_Mag", "Fourier_Body_Acc_Jerk_Std_Mag",
            "Fourier_Body_Gyro_Std_Mag", "Fourier_Body_Gyro_Jerk_Std_Mag")
colnames(har.mean.std) <- vnames
## Group mean and std deviation data by activity and subject
har.data.group <- group_by(har.mean.std,Activity, Subject)
## Calculate the mean of all variables
final.data.set <- summarise_each(har.data.group,funs(mean))
write.table(final.data.set,"FinalDataSet.txt")
