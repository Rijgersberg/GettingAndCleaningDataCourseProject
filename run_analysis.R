library(utils) # for the unzip() function
library(plyr) # for advanced merging and ordering features

# Create the data directory if it does not exist
if (!file.exists("data")) {
    dir.create("data")
}

# Download and unzip the data file if it the data does not exist
datapath <- "./data/UCI HAR Dataset"
if (!file.exists(datapath)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zippath <- "./data/data.zip"
    download.file(fileUrl, destfile = zippath, method = "curl")
    dateDownloaded <- date()
    unzip(zippath, exdir="./data")
}

# Extract the variable names from the info file
features <- read.table("./data/UCI HAR Dataset/features.txt")
variable_names <- features[,2]

# Extract the activity labels
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activity_names <- activity_labels[,2]

# Process the test and train dataset into a single dataframe each
path_prefix <- "./data/UCI HAR Dataset/"
sections <- c("test","train")
dfs <- list()
for (section in sections) {
    # Load the three files from disk
    X <- read.table(paste(path_prefix, section, "/X_", section, ".txt", sep="") )
    y <- read.table(paste(path_prefix, section, "/y_", section, ".txt", sep="") )
    subject <- read.table(paste(path_prefix, section, "/subject_", section, ".txt", sep="") )
    
    # Appliance sensible column names
    colnames(X) <- variable_names
    colnames(y) <- "Activity"
    colnames(subject) <- "Subject"
    
    # Transform activity into factors
    y$Activity <- factor(y$Activity, labels = activity_names)
    
    # Merge into a single dataframe (per section)
    dfs[[length(dfs)+1]] <- cbind(subject, y, X)
}

# Merge the test and train datasets
dataset <- do.call("rbind", dfs)

# Extract only the measurements of mean and standard deviations
labelindices <- c(1,2)
meanindices <- grep("mean()", colnames(dataset))
stdindices <- grep("std()", colnames(dataset))
indices <- sort(c(labelindices,meanindices,stdindices))
dataset <- dataset[,indices]

# Order the dataframe by Subject and Activity
dataset <- arrange(dataset,Subject,Activity)

# Calculate the average of each variable (by actiity and subject)
agg_dataset <- ddply(dataset, c("Subject","Activity"), numcolwise(mean))

# Write the tidy dataset to a file
filepath <- "./data/UCI_HAR_tidy.txt"
write.table(agg_dataset, filepath, row.names = FALSE)
