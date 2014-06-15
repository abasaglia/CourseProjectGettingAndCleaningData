# Create directory, load the zip file and unzip it
dirHAR = "./HARDataSet"
if(!file.exists(dirHAR)) {dir.create(dirHAR)}
zipFileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile = paste(dirHAR, "HARdata.zip", sep="/")
download.file(zipFileUrl, destfile=destFile, method="curl")
unzip(destFile, exdir=dirHAR)

# Read Festures index and name
features<-read.table(file=paste(dirHAR,"UCI HAR Dataset/features.txt",sep="/"),header=F,col.names=c("feature_idx", "feature_name"))

# Read Activity Name
activity<-read.table(file=paste(dirHAR,"UCI HAR Dataset/activity_labels.txt",sep="/"),header=F,col.names=c("activity_idx", "activity_label"))

# Read test data
Xtest<-read.table(file=paste(dirHAR,"UCI HAR Dataset/test/X_test.txt",sep="/"),header=F)
colnames(Xtest)=features$feature_name
ytest<-read.table(file=paste(dirHAR,"UCI HAR Dataset/test/y_test.txt",sep="/"),header=F,col.names="activity")
subject_test<-read.table(file=paste(dirHAR,"UCI HAR Dataset/test/subject_test.txt",sep="/"),header=F,col.names="subject")

# Read train data
Xtrain<-read.table(file=paste(dirHAR,"UCI HAR Dataset/train/X_train.txt",sep="/"),header=F)
colnames(Xtrain)=features$feature_name
ytrain<-read.table(file=paste(dirHAR,"UCI HAR Dataset/train/y_train.txt",sep="/"),header=F,col.names="activity")
subject_train<-read.table(file=paste(dirHAR,"UCI HAR Dataset/train/subject_train.txt",sep="/"),header=F,col.names="subject")

# Merge data
X<-rbind(Xtest,Xtrain)
y<-rbind(ytest,ytrain)
subject<-rbind(subject_test,subject_train)

# replace activity index with activity label
y_label<-(activity[y$activity,])$activity_label

# Subsetting with column names containing mean or std 
X_mean_std<-X[,grepl("mean\\(\\)|std\\(\\)",ignore.case=T,colnames(X))]

# Replacing in colum names
# "(" and ")" with "" 
# "," and "-" with "_"
new_colum_names<-gsub("\\(|\\)","",colnames(X_mean_std))
new_colum_names<-gsub("\\-|,","_", new_colum_names)
colnames(X_mean_std)=new_colum_names

# Add activity label e subject
ActivityType<-y_label
dataset_all_meanstd<-cbind(X_mean_std,ActivityType,subject)

#create a data set with the average of each variable for each activity and each subject
dataset_all_average <- aggregate(dataset_all_meanstd[,1:66], by=list(dataset_all_meanstd$ActivityType,dataset_all_meanstd$subject), FUN="mean")
#Change the colum names adding "MeanOf_" prefix
cn<-function(colname) {
    res<-paste ("MeanOf_",colname,sep="")
}
colnames(dataset_all_average)=lapply (colnames(dataset_all_average),cn)
colnames(dataset_all_average)[1] = "ActivityType"
colnames(dataset_all_average)[2] = "Subject"

# Write to the disk as CSV files
file = paste(".", "dataset_all_meanstd.txt", sep="/")
write.csv(dataset_all_meanstd, file, row.names=FALSE)
file = paste(".", "dataset_all_average.txt", sep="/")
write.csv(dataset_all_average, file, row.names=FALSE)

