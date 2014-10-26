HAR-Data
========

Final project of the third class of the data science track

The run_analysis R script performs the following steps:
-Loads the dplyr library for the use of select and mutate functions
-Sets the working directory to a path specific to the project
-Downloads the zipped up source file into the working directory
-From the zip file, reads the list of features (561) that will be used as column names for the data
-Opens test activity, subject and data files to build a data frame
-Opens training activity, subject and data files to build a second data frame
-Binds the training and test data sets together
-Uses the features list previously loaded to create column names for the above data frame
-Selects only the columns that have "mean" or "std" in their names
-Replaces activity codes with meaningful names
-Replaces variable names with more readable versions
-Groups the data by activity and subject
-Calculates the mean for each variable for each of the groups
-Writes the resulting data inot a text file.
