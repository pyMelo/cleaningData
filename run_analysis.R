
---

#### **run_analysis.R**
```r
# Caricamento delle librerie
library(dplyr)

# Scarica i dati se non presenti
if(!file.exists("./data")) { dir.create("./data") }
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
zipFile <- "./data/dataset.zip"
if(!file.exists(zipFile)) {
  download.file(url, zipFile, method = "curl")
  unzip(zipFile, exdir = "./data")
}

# Caricamento dataset
features <- read.table("./data/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("ID", "Activity"))

# Caricamento dati di training e test
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")

X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")

# Unione dei dataset
X_total <- rbind(X_train, X_test)
y_total <- rbind(y_train, y_test)
subject_total <- rbind(subject_train, subject_test)

# Assegna nomi alle colonne
colnames(X_total) <- features$V2

# Selezione solo media e deviazione standard
selected_features <- grep("mean\\(\\)|std\\(\\)", features$V2)
X_total <- X_total[, selected_features]

# Unione dati
total_data <- cbind(subject_total, y_total, X_total)

# Assegna nomi descrittivi alle attività
total_data$Activity <- factor(total_data$Activity, levels = activity_labels$ID, labels = activity_labels$Activity)

# Crea dataset finale con la media per ogni soggetto e attività
tidy_dataset <- total_data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

# Salva il dataset pulito
write.table(tidy_dataset, "tidy_dataset.txt", row.name=FALSE)
