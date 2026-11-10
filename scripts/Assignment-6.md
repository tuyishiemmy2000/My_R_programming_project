Assignment 6
================
TUYISHIME Emmanuel
2026-11-10

1.Multiple linear regression and interpretation

We will use the built-in mtcars dataset in R. It is suitable because it
contains several numerical variables describing cars.

1.1. Understanding the Dataset

``` r
data(mtcars)

# View the dataset
View(mtcars)

# Display the first six rows
head(mtcars)
```

    ##                    mpg cyl disp  hp drat    wt  qsec
    ## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46
    ## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02
    ## Datsun 710        22.8   4  108  93 3.85 2.320 18.61
    ## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44
    ## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02
    ## Valiant           18.1   6  225 105 2.76 3.460 20.22
    ##                   vs am gear carb
    ## Mazda RX4          0  1    4    4
    ## Mazda RX4 Wag      0  1    4    4
    ## Datsun 710         1  1    4    1
    ## Hornet 4 Drive     1  0    3    1
    ## Hornet Sportabout  0  0    3    2
    ## Valiant            1  0    3    1

``` r
# Check the structure
str(mtcars)
```

    ## 'data.frame':    32 obs. of  11 variables:
    ##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
    ##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
    ##  $ disp: num  160 160 108 258 360 ...
    ##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
    ##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
    ##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
    ##  $ qsec: num  16.5 17 18.6 19.4 17 ...
    ##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
    ##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
    ##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
    ##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...

``` r
# Summary statistics
summary(mtcars)
```

    ##       mpg             cyl             disp      
    ##  Min.   :10.40   Min.   :4.000   Min.   : 71.1  
    ##  1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8  
    ##  Median :19.20   Median :6.000   Median :196.3  
    ##  Mean   :20.09   Mean   :6.188   Mean   :230.7  
    ##  3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0  
    ##  Max.   :33.90   Max.   :8.000   Max.   :472.0  
    ##        hp             drat             wt       
    ##  Min.   : 52.0   Min.   :2.760   Min.   :1.513  
    ##  1st Qu.: 96.5   1st Qu.:3.080   1st Qu.:2.581  
    ##  Median :123.0   Median :3.695   Median :3.325  
    ##  Mean   :146.7   Mean   :3.597   Mean   :3.217  
    ##  3rd Qu.:180.0   3rd Qu.:3.920   3rd Qu.:3.610  
    ##  Max.   :335.0   Max.   :4.930   Max.   :5.424  
    ##       qsec             vs               am        
    ##  Min.   :14.50   Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:16.89   1st Qu.:0.0000   1st Qu.:0.0000  
    ##  Median :17.71   Median :0.0000   Median :0.0000  
    ##  Mean   :17.85   Mean   :0.4375   Mean   :0.4062  
    ##  3rd Qu.:18.90   3rd Qu.:1.0000   3rd Qu.:1.0000  
    ##  Max.   :22.90   Max.   :1.0000   Max.   :1.0000  
    ##       gear            carb      
    ##  Min.   :3.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.000  
    ##  Median :4.000   Median :2.000  
    ##  Mean   :3.688   Mean   :2.812  
    ##  3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :8.000

Variable Meaning Role mpg Miles per gallon Dependent variable wt Car
weight Independent variable hp Horsepower Independent variable qsec
Quarter-mile time Independent variable

1.2.The objective is to predict fuel efficiency (mpg) using car weight,
horsepower and quarter-mile time.

``` r
# Fit multiple linear regression
model <- lm(
  mpg ~ wt + hp + qsec,
  data = mtcars
)

# Display model results
summary(model)
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt + hp + qsec, data = mtcars)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -3.8591 -1.6418 -0.4636  1.1940  5.6092 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 27.61053    8.41993   3.279  0.00278 ** 
    ## wt          -4.35880    0.75270  -5.791 3.22e-06 ***
    ## hp          -0.01782    0.01498  -1.190  0.24418    
    ## qsec         0.51083    0.43922   1.163  0.25463    
    ## ---
    ## Signif. codes:  
    ## 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2.578 on 28 degrees of freedom
    ## Multiple R-squared:  0.8348, Adjusted R-squared:  0.8171 
    ## F-statistic: 47.15 on 3 and 28 DF,  p-value: 4.506e-11

### Interpretation of Multiple Linear Regression Results

A multiple linear regression model was developed to examine the
relationship between vehicle fuel efficiency (MPG) and three explanatory
variables: vehicle weight (wt), horsepower (hp), and quarter-mile time
(qsec).

The regression results show that vehicle weight has a negative and
statistically significant coefficient of -4.35880 (p = 3.22e-06). This
indicates that, holding horsepower and quarter-mile time constant, an
increase of 1,000 pounds in vehicle weight is associated with an average
decrease of approximately 4.36 MPG.

Horsepower also has a negative coefficient of -0.01782, suggesting that
an additional horsepower is associated with a decrease of approximately
0.018 MPG, when the other variables are held constant. However, this
relationship is not statistically significant (p = 0.24418).

Quarter-mile time has a positive coefficient of 0.51083, indicating that
an additional second is associated with an increase of approximately
0.51 MPG, holding the other predictors constant. Nevertheless, this
relationship is also not statistically significant (p = 0.25463).

The model has an R-squared value of 0.8348, indicating that
approximately 83.48% of the variation in fuel efficiency is explained by
the three predictors. The adjusted R-squared is 0.8171, showing that the
model maintains a high explanatory power after accounting for the number
of predictors.

Furthermore, the overall regression model is statistically significant
(F = 47.15, p = 4.506e-11). This indicates that the predictors jointly
provide significant explanatory power for fuel efficiency.

In conclusion, vehicle weight is the only statistically significant
individual predictor among the three variables at the 5% significance
level. Heavier vehicles tend to have lower fuel efficiency, while the
independent effects of horsepower and quarter-mile time are not
statistically significant in this model. 1.3.Test the significance of
the predictors

``` r
# Extract coefficients
coef(model)
```

    ## (Intercept)          wt          hp        qsec 
    ## 27.61052686 -4.35879720 -0.01782227  0.51083369

``` r
# Extract p-values
summary(model)$coefficients
```

    ##                Estimate Std. Error   t value
    ## (Intercept) 27.61052686 8.41992848  3.279188
    ## wt          -4.35879720 0.75270039 -5.790879
    ## hp          -0.01782227 0.01498117 -1.189645
    ## qsec         0.51083369 0.43922153  1.163043
    ##                 Pr(>|t|)
    ## (Intercept) 2.784556e-03
    ## wt          3.217222e-06
    ## hp          2.441762e-01
    ## qsec        2.546284e-01

``` r
# Extract R-squared
summary(model)$r.squared
```

    ## [1] 0.8347678

``` r
# Extract adjusted R-squared
summary(model)$adj.r.squared
```

    ## [1] 0.8170643

1.4. Make Predictions

``` r
# Predict using the fitted model
predictions <- predict(model)

# Compare actual and predicted values
comparison <- data.frame(
  Actual = mtcars$mpg,
  Predicted = predictions
)

head(comparison)
```

    ##                   Actual Predicted
    ## Mazda RX4           21.0  22.63835
    ## Mazda RX4 Wag       21.0  21.81292
    ## Datsun 710          22.8  25.34726
    ## Hornet 4 Drive      21.4  21.56715
    ## Hornet Sportabout   18.7  18.19176
    ## Valiant             18.1  20.98681

Prediction for new car:

``` r
new_car <- data.frame(
  wt = 3.0,
  hp = 110,
  qsec = 17.5
)

predict(model, newdata = new_car)
```

    ##        1 
    ## 21.51328

1.5.Visualize actual and predicted values

``` r
# Reduce plot margins
par(mar = c(4, 4, 3, 1))

# Plot actual versus predicted MPG
plot(
  mtcars$mpg,
  predictions,
  xlab = "Actual MPG",
  ylab = "Predicted MPG",
  main = "Actual vs Predicted Fuel Efficiency",
  pch = 19
)

# Add a reference line
abline(a = 0, b = 1, col = "red", lwd = 2)
```

![](Assignment-6_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->
