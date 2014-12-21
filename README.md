# Getting and Cleaning Data
#### Johns Hopkins University


## Course Project



##### **Description :-**
The course project for the **Getting and Cleaning Data** course, under the **Data Science Specialization Track**, requires us to demonstrate our ability to collect a data set, clean it, work with it to extract the required fields and prepare a tidy data set that can be easily used for further analysis of the data.

The data set used for this project was collected from the following site :-
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

The data set used, represents a *_Human Activity Recognition_* dataset, based on the recordings of 30 subjects, each performing 6 basic daily activities (namely, Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying), while carrying a waist-mounted 'Samsung Galaxy S II' smartphone with embedded inertial sensors. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the *'training'* data and 30% the *'test'* data.

The data set used in the project :- [UCI Human Activity Recognition](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##### **Contents :-**
- *'README.md'*      - A markdown document explaining the functioning of the code script used for the project
- *'CodeBook.md'*    - A markdown document describing the original experiment, data set, and  the variables and features
- *'run_analysis.R'* - Code script performing the required analysis for the project
- *'tidy_data.txt'*  - Tidy data, in the wide format, which is the output for the project code script


##### **Code Script :-**

###### Name - *"run_analysis.R"*

###### Description -
>  - Reads the data sets from the  working directory.
   - Combines the training and the test data sets to create one data set.
   - Extracts the measurements of the mean and standard deviation for each observation.
   - Assigns descriptive names to the activities in the data set.
   - Labels the data with descriptive variable names.
   - Creates an independent tidy data set with the average of each variable for each activity and each subject.
  
###### Details -
>  1. Reading the following data sets into R, using 'read.table()'-
    - X_train.txt (Training data)
    - y_train.txt (Corresponding activity for training data set measurements)
    - subject_train.txt (Corresponding subject for training data set measurements)
    - X_test.txt (Test data)
    - y_test.txt (Corresponding activity for test data set measurements)
    - subject_test.txt (Corresponding subject for test data set measurements)
    - features.txt (Variable names, as specified in original experiment)
    - activity_labels.txt (Names of activities performed, in order)
> 2. Combining training and test data sets -
    - For the test data, the subject, y and x data sets are combined using 'cbind()' in the order as stated
    - For the training data, the subject, y and x data sets are combined using 'cbind()' in the order as stated
    - The test and training data sets are then stacked together into a single data set, using 'rbind()'
> 3. Extracting the measurements of mean and standard deviation for each observation -
    - The variable names are made syntactically valid, using 'make.names()', to avoid complications due to duplicated variable names in the data
    - Using 'names()', first 2 columns are named "Subject" and "Activity" respectively, and the rest of the columns are assigned the syntactically
      valid names obtained by using 'make.names()'
    - Using 'select()', from the 'dplyr' package, and 'contains()', the measurements of only the *mean* and *standard deviation*, for each of the
      observations, are selected into a new data set, along with corresponding subject and activity
>  4.  Assigning descriptive names to the activities -
    - Using 'arrange()' from the 'dplyr' package, the new data set is arranged in increasing order, firstly according to the Subject IDs, and then
      according to the activity number
    - The activity names are extracted from the data set containg the activity labels
    - The descriptive activity names are assigned to the 'Activity' coulmn in the data set, according to their activity numbers, using the 'factor()'
      function
>  5.  Labelling the columns with descriptive variable names -
    - Desriptive variable names are assigned to the coulumns of the data set, as the originally extracted variable names are erroneous, using 
      'names()'
>  6.  Calculating the average of each variable column for each activity and each subject -
    - Using 'summarise()' and 'group_by()' functions from the 'dplyr' package, the average of the values for each activity performed by each subject,
      is calculated, and collected into a new, independent tidy data set
>  7.  The tidy data set obtained is written to a .txt file, using 'write.table()', with row.name=FALSE, as required in the project
                 

###### Characteristics -
>  * Wide format of the tidy data is chosen, and written to a text file, using 'write.table()'
>  * Columns -
    - Column 1 - Identifiers of the subjects who volunteered for the experiment
    - Column 2 - Activity labels for the activities performed by the subjects
    - Column 3-35  - Average values for the measurement of *mean* for each feature variable
    - Column 36-68 - Average values for the measurement of *standard deviation* for each feature variable
>  * Rows - 180 observations, where each subject performed each of the 6 activities (30X6)



##### Acknowledgements :- 

* Hadley Wickham, Tidy Data, _The Journal of Statistical Software_ 

* 'Getting and Cleaning Data' - Course Project [Discussion Forums](https://class.coursera.org/getdata-016/forum/list?forum_id=10009)

* [UCI Machine Learning Repository Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )
  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
  Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted
  Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
            

