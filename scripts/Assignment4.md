------------------------------------------------------------------------

title: “Assignment4” author: “TUYISHIME Emmanuel” date: “2026-11-08”
output: github_document

\#1.1.Create a function for summary statistics

Create a function

``` r
summary_statistics <- function(x) {

  result <- list(
    Mean = mean(x, na.rm = TRUE),
    Median = median(x, na.rm = TRUE),
    Standard_Deviation = sd(x, na.rm = TRUE),
    Variance = var(x, na.rm = TRUE),
    Minimum = min(x, na.rm = TRUE),
    Maximum = max(x, na.rm = TRUE),
    Range = range(x, na.rm = TRUE),
    IQR = IQR(x, na.rm = TRUE)
  )

  return(result)
}
```

\#1.2.Apply the function to a variable We will use the iris dataset.

``` r
data("iris")
View(iris)

data(iris)

summary_statistics(iris$Sepal.Length)
```

    ## $Mean
    ## [1] 5.843333
    ## 
    ## $Median
    ## [1] 5.8
    ## 
    ## $Standard_Deviation
    ## [1] 0.8280661
    ## 
    ## $Variance
    ## [1] 0.6856935
    ## 
    ## $Minimum
    ## [1] 4.3
    ## 
    ## $Maximum
    ## [1] 7.9
    ## 
    ## $Range
    ## [1] 4.3 7.9
    ## 
    ## $IQR
    ## [1] 1.3

``` r
summary_statistics(iris$Petal.Length)
```

    ## $Mean
    ## [1] 3.758
    ## 
    ## $Median
    ## [1] 4.35
    ## 
    ## $Standard_Deviation
    ## [1] 1.765298
    ## 
    ## $Variance
    ## [1] 3.116278
    ## 
    ## $Minimum
    ## [1] 1
    ## 
    ## $Maximum
    ## [1] 6.9
    ## 
    ## $Range
    ## [1] 1.0 6.9
    ## 
    ## $IQR
    ## [1] 3.5

Expected interpretation - The mean tells us the average sepal length. -
The median identifies the middle sepal length. - The standard deviation
tells us how dispersed the values are. - The variance measures
variability in squared units. - The minimum and maximum identify the
smallest and largest observations. - The IQR measures the spread of the
middle 50% of observations. Conclusion: The function can be reused for
different numerical variables without writing all the statistical
calculations repeatedly.

2.Create a function for a two-sample t-test

2.1.What is a two-sample t-test? A two-sample t-test compares the means
of two independent groups to determine whether there is a statistically
significant difference between them.

2.2.Create a Function

``` r
two_sample_test <- function(x, y) {

  result <- t.test(
    x,
    y,
    alternative = "two.sided",
    var.equal = FALSE
  )

  return(result)
}
```

2.3. Apply the function to iris dataset

``` r
data(iris)

# Extract the first group
group1 <- iris$Sepal.Length[
  iris$Species == "setosa"
]

# Extract the second group
group2 <- iris$Sepal.Length[
  iris$Species == "versicolor"
]

# Apply our function
two_sample_test(group1, group2)
```

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  x and y
    ## t = -10.521, df = 86.538, p-value < 2.2e-16
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -1.1057074 -0.7542926
    ## sample estimates:
    ## mean of x mean of y 
    ##     5.006     5.936

2.3. Extract individual results

``` r
test_result <- two_sample_test(group1, group2)

# Display t-statistic
test_result$statistic
```

    ##         t 
    ## -10.52099

``` r
# Display p-value
test_result$p.value
```

    ## [1] 3.746743e-17

``` r
# Display confidence interval
test_result$conf.int
```

    ## [1] -1.1057074 -0.7542926
    ## attr(,"conf.level")
    ## [1] 0.95

``` r
# Display group means
mean(group1)
```

    ## [1] 5.006

``` r
mean(group2)
```

    ## [1] 5.936

Conclusion:

Two-Sample t-test was conducted to determine whether there is a
significant difference in mean sepal length between Setosa and
Versicolor species in the Iris dataset. The results showed a
statistically significant difference between the two groups (t =
-10.521, df = 86.538, p \< 0.001). The mean sepal length for Setosa was
5.006 cm, while that of Versicolor was 5.936 cm. The estimated mean
difference was -0.930 cm, with a 95% confidence interval ranging from
-1.106 to -0.754 cm. Therefore, the null hypothesis was rejected,
indicating that Versicolor flowers have significantly longer sepals on
average than Setosa flowers.
