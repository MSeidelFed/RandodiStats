# RandodiStats
Random distributions with specific shapes and related statistics

The function plotting_distributions allows to plot the distribution of multiple variable of interest by estimating its shape thorugh the kurtosis and square of skewness parameters. These parameters are a dependency of the "fitdistrplus" R package.

The function requires four parameters, e.g:

```
logis <- plotting_distributions(Distribution_test_mat = Distribution_test_mat, Regression_Family = "logis", n_random_distributions = 1000, colour = "grey")

Normal <- plotting_distributions(Distribution_test_mat = Distribution_test_mat, Regression_Family = "Normal", n_random_distributions = 1000, colour = "blue")

Beta <- plotting_distributions(Distribution_test_mat = Distribution_test_mat, Regression_Family = "Beta", n_random_distributions = 1000, colour = "red")

gamma <- plotting_distributions(Distribution_test_mat = Distribution_test_mat, Regression_Family = "gamma", n_random_distributions = 1000, colour = "green")

```

Distribution_test_mat is a matrix R object of the featuring response variables in each columns and their measured values across treatments in rows. e.g: 

```

head(Distribution_test_mat)



        [,1]      [,2]      [,3]     [,4]
V1    11.159738  3.635386  2.329438 4.596254
V2     5.094825  3.155419  3.620623 2.478477
V3     4.500933  5.671115  4.308878 3.138498
V4     2.784206  3.697263  3.280250 2.826188
V5     7.138177  5.465630  3.498047 3.498861
V6     3.104237  3.798161  5.084090 2.633325
V7     2.297491  4.258879  5.104113 2.535703
V8     2.801981  4.114735  3.031988 1.973867
V9     4.128301  4.207040  7.094382 2.803939
V10    4.490545  3.970312  3.317899 3.038933

```

The distributions shapes included in the test must be one of the outlined four classes: "logis", "Normal", "Beta", "gamma"

n_random_distributions represents the amount of independent distributions with the specific shape that the function will use to construct the kurtosis and square of skewness graph.

Finally, colour defines the color of the distribution line in the graph.

The funtion returns a matrix with the kurtosis and square of skewness values for the random distributions in order to plot them if you want. Secondly it returns a plot with the distribution of your variables as compared to the positions of the shape distribution chosen by you.


