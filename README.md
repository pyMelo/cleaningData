Introduction
This project focuses on cleaning the "Human Activity Recognition Using Smartphones" dataset. The script run_analysis.R performs the following tasks:

Merges the training and test datasets to create one comprehensive dataset.
Extracts measurements on the mean and standard deviation for each measurement.
Renames activities in the dataset with descriptive names.
Labels the dataset with clear and descriptive variable names.
Creates a final tidy dataset with the average of each variable for each activity and each subject.
Dataset Information
The dataset used in this project originates from experiments conducted with a group of 30 volunteers. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) while wearing a smartphone (Samsung Galaxy S II) on their waist. The smartphone's embedded accelerometer and gyroscope captured various measurements of the participants' movements.

Files in the Repository
CodeBook.md: Provides detailed information about the variables, data, and transformations performed to clean up the data.
README.md: This file, offering an overview of the project and guidance on running the analysis.
run_analysis.R: The R script that executes the data cleaning and transformation processes.
tidy_dataset.txt: The resulting tidy dataset after processing.
Steps to Execute the Analysis
Clone the Repository: Begin by cloning this repository to your local machine using the following command:

bash
Copia
Modifica
git clone https://github.com/pyMelo/cleaningData.git
Set Working Directory: Ensure that your R working directory is set to the location where the repository was cloned. You can set the working directory in R using:

R
Copia
Modifica
setwd("path/to/cleaningData")
Run the Script: Source the run_analysis.R script in R to perform the data cleaning and transformation:

R
Copia
Modifica
source("run_analysis.R")
This script will generate the tidy_dataset.txt file in your working directory.

Load the Tidy Dataset: After running the script, you can load and view the tidy dataset using:

R
Copia
Modifica
tidy_data <- read.table("tidy_dataset.txt", header = TRUE)
View(tidy_data)
Detailed Description of the run_analysis.R Script
The run_analysis.R script carries out the following operations:

Load Required Libraries: The script begins by loading necessary R libraries such as dplyr for data manipulation.

Download and Unzip Dataset: If the dataset is not already present in the working directory, the script downloads and unzips it.

Read Data Files: The script reads various data files including training and test datasets, activity labels, and feature names.

Merge Datasets: Combines the training and test datasets to form a single dataset.

Extract Measurements: Selects only the measurements on the mean and standard deviation for each measurement.

Descriptive Activity Names: Replaces activity codes with descriptive activity names.

Label Dataset: Appropriately labels the dataset with descriptive variable names.

Create Tidy Dataset: From the dataset in step 7, creates a second, independent tidy dataset with the average of each variable for each activity and each subject, and writes it to tidy_dataset.txt.

Dependencies
Ensure that the following R packages are installed and loaded:

dplyr: For data manipulation.
You can install the dplyr package using:

R
Copia
Modifica
install.packages("dplyr")
Notes
The tidy_dataset.txt file is generated in the working directory after running the run_analysis.R script.
For a comprehensive understanding of the variables and the transformations applied, refer to the CodeBook.md file.
References
Original dataset: UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set
This project is part of the Coursera "Getting and Cleaning Data" course, aiming to demonstrate the ability to collect, work with, and clean a dataset to prepare tidy data that can be used for subsequent analysis.


