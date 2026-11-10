Assignment3 R programming project
================
TUYISHIME Emmanuel
2026-11-02

``` r
# Create students' marks
marks <- matrix(
  c(75, 80, 68, 90,
    85, 78, 92, 88,
    60, 70, 65, 72,
    95, 89, 91, 94),
  nrow = 4,
  byrow = TRUE
)

colnames(marks) <- c("Mathematics", "English", "Biology", "Computer")
rownames(marks) <- c("Student1", "Student2", "Student3", "Student4")

marks
```

    ##          Mathematics English Biology Computer
    ## Student1          75      80      68       90
    ## Student2          85      78      92       88
    ## Student3          60      70      65       72
    ## Student4          95      89      91       94

``` r
# Calculate total marks for each student
apply(marks, 1, sum)
```

    ## Student1 Student2 Student3 Student4 
    ##      313      343      267      369

``` r
# Calculate average marks for each student
apply(marks, 1, mean)
```

    ## Student1 Student2 Student3 Student4 
    ##    78.25    85.75    66.75    92.25

``` r
# Calculate highest mark in each subject
apply(marks, 2, max)
```

    ## Mathematics     English     Biology    Computer 
    ##          95          89          92          94

``` r
# Create a list of different datasets
my_data <- list(
  ages = c(18, 20, 22, 25, 30),
  salaries = c(150000, 200000, 250000, 300000),
  temperatures = c(24, 26, 28, 30, 32)
)

# Calculate summary statistics for each dataset
lapply(my_data, summary)
```

    ## $ages
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##      18      20      22      23      25      30 
    ## 
    ## $salaries
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##  150000  187500  225000  225000  262500  300000 
    ## 
    ## $temperatures
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##      24      26      28      28      30      32

``` r
# Calculate standard deviation for each dataset
lapply(my_data, sd)
```

    ## $ages
    ## [1] 4.690416
    ## 
    ## $salaries
    ## [1] 64549.72
    ## 
    ## $temperatures
    ## [1] 3.162278

``` r
# Number of students who passed in different subjects
passed <- c(Math = 45, English = 38, Biology = 42, Computer = 48)

# Total students examined
total_students <- 50

# Calculate percentage pass rate
sapply(passed, function(x) (x / total_students) * 100)
```

    ##     Math  English  Biology Computer 
    ##       90       76       84       96

``` r
# Create employee dataset
employees <- data.frame(
  Department = c("IT", "HR", "IT", "Finance", "HR",
                 "Finance", "IT", "HR"),
  Salary = c(500000, 350000, 600000, 450000,
             400000, 550000, 650000, 380000)
)

# Calculate average salary by department
tapply(employees$Salary, employees$Department, mean)
```

    ##  Finance       HR       IT 
    ## 500000.0 376666.7 583333.3

``` r
# Calculate maximum salary by department
tapply(employees$Salary, employees$Department, max)
```

    ## Finance      HR      IT 
    ##  550000  400000  650000

``` r
# Monthly expenditure on different items
food <- c(50000, 60000, 45000)
transport <- c(20000, 25000, 15000)
rent <- c(100000, 100000, 100000)

# Calculate total monthly expenditure
mapply(
  function(f, t, r) f + t + r,
  food,
  transport,
  rent
)
```

    ## [1] 170000 185000 160000

``` r
# Create a list of examination marks
exam_results <- list(
  Mathematics = c(70, 80, 90),
  Biology = c(65, 75, 85),
  English = c(60, 70, 80)
)

# Calculate mean marks for each subject
vapply(exam_results, mean, numeric(1))
```

    ## Mathematics     Biology     English 
    ##          80          75          70

## Conclusion

The apply family of functions in R simplifies data manipulation and
statistical analysis. Functions such as apply(), lapply(), sapply(),
tapply(), mapply(), and vapply() help perform calculations efficiently
across matrices, lists, vectors, and groups. Their use reduces
repetitive code and improves the efficiency of data analysis.
