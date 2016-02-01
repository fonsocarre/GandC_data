# Load data labels
activityNamesTable = read.table("data/activity_labels.txt", stringsAsFactors = F)
activityNames = activityNamesTable$V2
rm(activityNamesTable)

dataNamesTable = read.table("data/features.txt", stringsAsFactors = F)
dataNames = dataNamesTable$V2
rm(dataNamesTable)

# Read train
trainTable = read.table("data/train/X_train.txt", col.names=dataNames)
trainData = trainTable
# activity labels
trainTable = read.table("data/train/y_train.txt", col.names=c("activity"))
trainData = cbind(trainTable,trainData)
# individuals
trainTable = read.table("data/train/subject_train.txt", 
                        col.names = c("individual"))
trainData = cbind(trainTable, trainData)
rm(trainTable)

# Read test
testTable = read.table("data/test/X_test.txt", col.names=dataNames)
testData = testTable
# activity labels
testTable = read.table("data/test/y_test.txt", col.names=c("activity"))
testData = cbind(testTable,testData)
# individuals
testTable = read.table("data/test/subject_test.txt", 
                       col.names = c("individual"))
testData = cbind(testTable, testData)
rm(testTable)

# All the data together
data = rbind(trainData,testData)
rm(testData, trainData)

# Reduced data
indexes2reduce = grep("mean|std", names(data))
indexes2reduce = c(1,2,indexes2reduce)
reducedData = data[,indexes2reduce]
names(reducedData) = lapply(names(reducedData), 
                            function(x) tolower(gsub("\\.","",x)))
reducedData$activity = sapply(reducedData$activity, function(x) activityNames[x])
rm(data)

# Data summary
library(dplyr)
group = group_by(reducedData, individual, activity)
summ = summarise_each(group, funs(mean, sd))
# add activity names
summ$activity = lapply(summ$activity, function(x) activityNames[x])

# Clean up
rm(group)
rm(activityNames)
rm(dataNames)
rm(indexes2reduce)