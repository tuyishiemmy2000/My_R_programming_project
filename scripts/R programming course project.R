#Assignment 1: install packages and import data from different data sources and show the libraries can help on those datasets.


#1.Import data from CSV TO Rstudio

# Install readr package
install.packages("readr")

# Install tidyverse package (includes readr and dplyr)
install.packages("tidyverse")

# Load libraries
library(readr)
library(tidyverse)


penguins <- read_csv(
  "C:/Users/user/Downloads/penguins.csv"
)

View(penguins)

head(penguins)
str(penguins)
summary(penguins)
dim(penguins)
names(penguins)
colSums(is.na(penguins))

write.csv(penguins,
          "penguins.csv",
          row.names = FALSE)


#Download summary table for penguin
summary_table <- data.frame(
  Variable = names(penguins),
  Summary = sapply(penguins, function(x) {
    paste(capture.output(summary(x)), collapse = "; ")
  })
)


write.csv(
  summary_table,
  "C:/Users/user/Downloads/My_R_programming_project/My_R_programming_project/outputs/summary_statistics.csv",
  row.names = FALSE
)



#2. import Excel's Data to R programming
install.packages("readxl")
library(readxl)

exam_marks<-read_excel("C:/Users/user/Downloads/exam_marks.xlsx")
View(exam_marks)

write.csv(exam_marks,
          "exam_marks.xlsx",
          row.names = FALSE)

# Display first six records
head(exam_marks)
names(exam_marks)

# Display last six records
tail(exam_marks)

# Check dataset structure
str(exam_marks)

# Summary statistics
summary(exam_marks)

# Number of rows and columns
dim(exam_marks)

# Display column names
names(exam_marks)

# Check missing values
colSums(is.na(exam_marks))

#Download summary table for penguin
summary_table <- data.frame(
  Variable = names(exam_marks),
  Summary = sapply(exam_marks, function(x) {
    paste(capture.output(summary(x)), collapse = "; ")
  })
)


write.csv(
  summary_table,
  "C:/Users/user/Downloads/My_R_programming_project/My_R_programming_project/outputs/summary_statistics.csv",
  row.names = FALSE
)




#3. IMPORT DATA FROM DATABASE MANAGEMENT SYSTEM INTO R PROGRAMMING

# Install required packages
install.packages("DBI")
install.packages("RMariaDB")
install.packages("tidyverse")

# Load libraries
library(DBI)
library(RMariaDB)
library(tidyverse)

con <- dbConnect(
  RMariaDB::MariaDB(),
  host = "localhost",
  port = 3306,
  user = "root",
  password = "",
  dbname = "student"
)

student<- dbReadTable(con,"students")
View(student)

write.csv(student,
          "student.csv",
          row.names = FALSE)

head(student)

tail(student)

str(student)

summary(student)

dim(student)

names(student)

colSums(is.na(student))
#4. Import data from an Online API (JSON data) into RStudio
install.packages("jsonlite")
install.packages("tidyverse")

library(jsonlite)
library(tidyverse)

api_url <- "https://jsonplaceholder.typicode.com/users"
api_data <- fromJSON(api_url, flatten = TRUE)
View(api_data)

write.csv(api_data,
          "api_data.csv",
          row.names = FALSE)



head(api_data)

tail(api_data)

str(api_data)

summary(api_data)

dim(api_data)

names(api_data)

colSums(is.na(api_data))

selected_users <- api_data %>%
  select(name, username, email, address.city)

View(selected_users)

#2. assignment2


x <- c(0.5, 0.6)
age<-c(20,35,32,29)
summary(age)
mean(age)

#Logical
x <- c(TRUE,FALSE)
x <- c(T, F)

#Character
x <- c("a", "b", "c" )
class<-c("M","F","F","M")

#Integer

x <- 9:29

#Complex
x <- c(1+0i, 2+4i)


#Generate Matrix with number from 1 to 6

(x <- matrix(1:6, nrow = 2, ncol = 3))

(y<-matrix(1:6, nrow = 3, ncol = 2))
#Multiplication of matrices x and y
x%*%y

#Listing
(x <- list(1, "a", TRUE, 1 + 4i))

#Factor
x <- factor(c("yes", "yes", "no", "yes", "no"))

#Check the missing values

is.na(x)

x <- c(1, 2, 4, "NA", 5) 
bad <- is.na(x)  
print(bad)

x[!bad]


x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")  
good <- complete.cases(x, y) 
good
sum(c(TRUE,TRUE,FALSE,FALSE,FALSE))


#create Data

studentID<-c(1,2,3,4,5)
math_score<-c(12,17,10,9,NA)
gender<-c("M","F","M","M","F")
it_score<-c(13,18,11,10,19)
scoredata<-data.frame(studentID,gender,math_score,it_score)
scoredata


#Create data from keyboard

data_class2<-data.frame(height=numeric(0),weight=numeric(0),bmi=numeric(0))
data_class2<-edit(data_class2)
data_class2
View(data_class2)

# Import data from statistical packages

# Create data_class table

data_class <- data.frame(
  HEIGHT = c(
    161, 155, 158, 170, 160, 156, 162, 158, 158, 167,
    160, 155, 154, 155, 157, 157, 160, 158, 160, 160,
    152, 154, 150, 161, 162, 164, 161, 155, 159, 163,
    159, 160, 158, 165, 156, 163, 155, 164, 163, 168,
    157, 164, 154
  ),
  
  WEIGHT = c(
    50, 49, 42, 65, 60, 52, 58, 46, 45, 51,
    60, 42, 53, 48, 48, 48, 53, 52, 51, 53,
    44, 56, 63, 52, 57, 49, 52, 54, 46, 50,
    61, 55, 45, 63, 60, 56, 52, 47, 52, 55,
    48, 58, 55
  )
)

# Display the table
View(data_class)

# Print the table
print(data_class)

write.csv(
  data_class,
  "C:/Users/user/Downloads/data_class.csv",
  row.names = FALSE
)


summary(data_class)

str(data_class)

#calculate the mean to each row
apply(data_class,1,mean)

#calculate the standard deviation to each column
apply(data_class,2,sd)

c(mean(data_class$HEIGHT),sd(data_class$HEIGHT))

c(mean(data_class$WEIGHT),sd(data_class$WEIGHT))

#Import data within Rstudio
data("iris")
head(iris)
mean(iris$Petal.Length)

mean(iris$Petal.Length[iris$Species=="setosa"])

mean(iris$Petal.Length[iris$Species=="versicolor"])

mean(iris$Petal.Length[iris$Species=="virginica"])

#and this method can work

by(iris$Petal.Length,iris$Species,mean)

by(iris$Petal.Length,iris$Species,summary)

# Visualizing iris Dataset using Boxplot

boxplot(iris$Sepal.Length~iris$Species,data=iris, main="Comparison of categorical vs quantitative")


#Relationship between two categorical variables
data("UCBAdmissions")
head(UCBAdmissions)

ucba<-data.frame(UCBAdmissions)
head(ucba)

cross<-xtabs(Freq~Gender+Admit,data=ucba)
(cross<-xtabs(Freq~Gender+Admit,data=ucba))


## Is there gender bias in UCB graduate admission process?
prop.table(cross,1)

#Simpson’s paradox

cross2<-xtabs(Freq~Gender+Admit,data=ucba[ucba$Dept=="F",])
prop.table(cross2,1)

dat <- read.table(text ="ProdA ProdB ProdC ProdD
1 110 50 60 70 
2 120 50 80 65", header= TRUE)

barplot(as.matrix(dat),beside=TRUE,col=c("Red","green"))

#barplot(as.matrix(dat),beside=TRUE,col=c("gold3","red"))

dat <- read.table(text = "A   B   C   D   E   F    G
1 10 80 30 90 70 60  90
2 20 50 70 50 40 10  40
3 60 80 80 60  60 30 160
4 20 40 70 80 20 10  70", header = TRUE)

barplot(as.matrix(dat))


#Scatter Plot
plot(WEIGHT~HEIGHT,data=data_class)

#Plot
plot(data_class$HEIGHT,data_class$WEIGHT)


plot(data_class[,1],data_class[,2],main = "Graph")

#Correlation
cor(data_class$HEIGHT,data_class$WEIGHT)

#Linear Models
plot(WEIGHT~HEIGHT,data=data_class)
abline(lm(WEIGHT~HEIGHT,data=data_class)$coefficient)

#Summary
data_lm<-lm(HEIGHT~WEIGHT,data=data_class)
summary(data_lm)


plot(data_lm)


hist(data_class$HEIGHT)


hist(data_class$WEIGHT,col = "blue")


#Linear with other line
plot(WEIGHT~HEIGHT,data=data_class)
abline(lm(WEIGHT~HEIGHT,data=data_class)$coefficient)
lines(lowess(data_class$HEIGHT,data_class$WEIGHT),col="blue")


cor(data_class$HEIGHT,data_class$WEIGHT)
lm(WEIGHT~HEIGHT,data=data_class)

#Data management
#Create another Variable
attach(data_class)
(BMI<-WEIGHT/(HEIGHT/100)^2)

(BMI<-round(WEIGHT/(HEIGHT/100)^2,digit=2))

head(cbind(data_class,BMI),n=5)

new_data_class<-cbind(data_class,BMI)
tail(cbind(data_class,BMI),n=10)

#Summary of BMI
summary(BMI)

stem(BMI,scale=2)

#Date
today <- Sys.Date()
format(today, format="%B %d %Y")

format(today, format="%A")

today <- Sys.Date()
dob <- as.Date("2000-01-01")
today<-as.Date("2026-10-31")
difftime(today, dob, units="days")

## Time difference of 16330 days
startdate <- as.Date("2000-01-01")
enddate <- as.Date("2026-10-31")
days <- enddate - startdate
days

#Subsetting

manager <- c(1,2,3,4,5)
country<- c("US","US","UK","UK","UK")
gender<-c("M","F","F","M","F")
age<-c(32,45,25,39,99)
q1<-c(5,3,3,3,2)
q2<-c(4,5,5,3,2)
q3<-c(5,2,5,4,1)
q4<-c(5,5,5,NA,2)
q5<-c(5,5,2,NA,1)
leadership<-data.frame(manager,country, gender, age, q1,q2,q3,q4,q5, stringsAsFactors = TRUE)
leadership<-data.frame(manager,country, gender, age, q1,q2,q3,q4,q5)
str(leadership)

names(leadership)

#Missing value
leadership$age[leadership$age==99]<-NA
View(leadership)

leadership$agecat[leadership$age >75]<-"Elder"
leadership$agecat[leadership$age>=35 & leadership$age<=75]<-"Middle Aged"
leadership$agecat[leadership$age <35]<- "Young"

#One way to handle missing value
is.na(leadership[,5:9])

newdata<-na.omit(leadership)
newdata

#Sorting data
order(leadership$age)

#Subset (selecting variables,dropping variables,selecting observation )
newdata3<-leadership[,c(5:9)]
myvars<-c("q1","q2","q3","q4","q5")
(newdata3<-leadership[myvars])

newdata4<-leadership[,c(-1,-2)]
(newdata4<-leadership[,-(1:5)])

newdata5<-leadership[,c(-1,-7)]
leadership[[4]]

leadership$age

newdata6<-leadership[c(-1,-3),]
newdata6<-leadership[c(2,4,5),]
newdata7<-subset(leadership,age>=35|age<24,select=c(q1,q2,q3,q4,q5))

attach(leadership)

#newdata7<-leadership[gender="M" & age>30,]
(newdata7<-leadership[gender=="M" & age>30,])


# ==========================================
# SAVE ALL ASSIGNMENT OUTPUTS
# ==========================================

# Define project folders
project_path <- "C:/Users/user/Downloads/My_R_programming_project/My_R_programming_project"

# Define project output folder
output_path <- "C:/Users/user/Downloads/My_R_programming_project/My_R_programming_project/outputs"



# Output file
# Define the output text file
output_file <- "C:/Users/user/Downloads/My_R_programming_project/My_R_programming_project/outputs/All_R_Assignment_Outputs.txt"

# Message file
# Define the warnings and messages file
message_file <- "C:/Users/user/Downloads/My_R_programming_project/My_R_programming_project/outputs/R_Warnings_and_Messages.txt"

# Open output connections
out_con <- file(output_file, open = "wt")
msg_con <- file(message_file, open = "wt")

# Record console output
sink(out_con, split = TRUE)

# Record warnings and messages
sink(msg_con, type = "message")

cat("\n====================================\n")
cat("R PROGRAMMING ASSIGNMENTS\n")
cat("ASSIGNMENT 1 AND ASSIGNMENT 2\n")
cat("====================================\n")

# Run your existing R script
# Run your existing R programming script

# Run your existing R programming script

tryCatch(
  source(
    "C:/Users/user/Downloads/My_R_programming_project/My_R_programming_project/scripts/R programming course project.R",
    echo = TRUE,
    print.eval = TRUE
  ),
  error = function(e) {
    cat("\nERROR:", conditionMessage(e), "\n")
  }
)

cat("\n====================================\n")
cat("END OF ASSIGNMENT OUTPUTS\n")
cat("====================================\n")

# Close recording
sink(type = "message")
sink()

close(msg_con)
close(out_con)

cat("All recording processes completed.\n")

# Create output folders
output_path <- "C:/Users/user/Downloads/My_R_programming_project/My_R_programming_project/outputs"



# Function to save summary tables
save_summary <- function(data, filename) {
  
  summary_table <- data.frame(
    Variable = names(data),
    Summary = sapply(data, function(x) {
      paste(capture.output(summary(x)), collapse = "; ")
    })
  )
  
  write.csv(
    summary_table,
    file.path(output_path, "tables", filename),
    row.names = FALSE
  )
}

# Assignment 1 datasets
save_summary(penguins, "penguins_summary.csv")
save_summary(exam_marks, "exam_marks_summary.csv")
save_summary(student, "student_summary.csv")
save_summary(api_data, "api_data_summary.csv")

# Assignment 2 datasets
save_summary(data_class, "data_class_summary.csv")
save_summary(iris, "iris_summary.csv")
save_summary(leadership, "leadership_summary.csv")
save

# Define project folders
project_path <- "C:/Users/user/Downloads/My_R_programming_project/My_R_programming_project"

output_path <- file.path(project_path, "outputs")

# Create output folders if they do not exist
dir.create(output_path, recursive = TRUE, showWarnings = FALSE)
dir.create(file.path(output_path, "tables"),
           recursive = TRUE, showWarnings = FALSE)

# Define file locations
output_file <- file.path(output_path, "All_R_Assignment_Outputs.txt")
message_file <- file.path(output_path, "R_Warnings_and_Messages.txt")

script_path <- file.path(
  project_path,
  "scripts",
  "R programming course project.R"
)

# Record the script output
record_outputs <- function() {
  
  out_con <- file(output_file, open = "wt")
  msg_con <- file(message_file, open = "wt")
  
  sink(out_con, split = TRUE)
  sink(msg_con, type = "message")
  
  on.exit({
    sink(type = "message")
    sink()
    close(msg_con)
    close(out_con)
  })
  
  tryCatch(
    source(
      script_path,
      echo = TRUE,
      print.eval = TRUE
    ),
    error = function(e) {
      cat("\nERROR:", conditionMessage(e), "\n")
    }
  )
}

# Run and record the assignment
record_outputs()

cat("\nAll recording processes completed.\n")
