run_analysis <- function() {
    
    # 1 merge training data with test data (rbind or rbindlist)
    library(data.table)
    
    featureList <- read.csv(file = "features.txt", header = F, sep = " ", stringsAsFactors = F)
    
    trainingData <- fread(input = "train/X_train.txt", header = F, col.names = featureList[,2], data.table = T)
    trainingSubject <- fread(input = "train/subject_train.txt", header = F, col.names = "Subject")
    trainingActivity <- fread(input = "train/y_train.txt", header = F, col.names = "Activity")
    trainingData <- cbind(trainingData, trainingSubject, trainingActivity)
    
    testData <- fread(input = "test/X_test.txt", header = F, col.names = featureList[,2], data.table = T)
    testSubject <- fread(input = "test/subject_test.txt", header = F, col.names = "Subject")
    testActivity <- fread(input = "test/y_test.txt", header = F, col.names = "Activity")
    testData <- cbind(testData, testSubject, testActivity)
    
    trainingAndTestData <- rbind(trainingData, testData)
    
    # 2 Extract columns containing mean oder standard deviation values
    selectIndizes <- grepl("-mean|-std", featureList[,2], ignore.case = F) == 1
    selectIndizes <- c(selectIndizes, T, T)
    trainingAndTestData_MeanStd <- trainingAndTestData[, selectIndizes, with = F]
    
    # 3 rename activity values and convert to factor
    activityLabels <- read.csv(file = "activity_labels.txt", header = F, sep = " ", stringsAsFactors = F)
    trainingAndTestData_MeanStd[,Activity := factor(activityLabels$V2[Activity])]
    
    # 4 label columns with descriptive variable names (remove brackets)
    columnNames <- colnames(trainingAndTestData_MeanStd)
    columnNames <- gsub("\\()", "", columnNames)
    colnames(trainingAndTestData_MeanStd) <- columnNames
    
    # 5 get average of each variable grouped by activity and subject
    meansByActivityAndSubject <- aggregate(trainingAndTestData_MeanStd[,1:79, with = F], list(trainingAndTestData_MeanStd$Subject, trainingAndTestData_MeanStd$Activity), mean)
    colnames(meansByActivityAndSubject)[1] <- "Subject"
    colnames(meansByActivityAndSubject)[2] <- "Activity"
    
    meansByActivityAndSubject
}