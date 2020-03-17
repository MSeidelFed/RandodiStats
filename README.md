# RandodiStats
Random distributions with specific shapes and related statistics

The function plotting_distributions allows plotting the distribution of multiple variables of interest by estimating their shape through the kurtosis and square of skewness parameters. These parameters are a dependency of the "fitdistrplus" R package.

The function requires one mandatory parameter and four optional ones, e.g.

```
logis <- plotting_distributions(Distribution_test_mat = Distribution_test_mat, Regression_Family = "logis", n_random_distributions = 1000, colour = "black", random_distributions_plot = T, vector_colors = vector_colors)

Normal <- plotting_distributions(Distribution_test_mat = Distribution_test_mat, Regression_Family = "Normal", n_random_distributions = 1000, colour = "blue", random_distributions_plot = T, vector_colors = vector_colors)

Beta <- plotting_distributions(Distribution_test_mat = Distribution_test_mat, Regression_Family = "Beta", n_random_distributions = 1000, colour = "red", random_distributions_plot = T, vector_colors = vector_colors)

gamma <- plotting_distributions(Distribution_test_mat = Distribution_test_mat, Regression_Family = "gamma", n_random_distributions = 1000, colour = "green", random_distributions_plot = T, vector_colors = vector_colors)

```

Distribution_test_mat is a matrix R object featuring response variables in each column and their measured values across treatments in rows. 

In order to produce a exemplary matrix to be run into the main function, I have posted the function "distribution_test_mat" that requires two optional arguments to be used. e.g.

```

Distribution_test_mat <- distribution_test_mat()

Distribution_test_mat[1:5,1:5]

     [,1] [,2] [,3] [,4] [,5]
[1,]  6.5  8.5 22.7  6.9 23.0
[2,] 12.5  7.2  3.9 12.1 14.1
[3,] 16.0  9.7 13.6 10.8 15.6
[4,] 25.4  4.9  4.5 14.0  9.4
[5,] 18.1 24.7  3.5  7.7  4.3

```

The resulting default matrix will include 1000 "logis", "Normal", "Beta", "gamma" distributed randomly generated response variables. These are the distributions shapes included in the test and they must be stated in the main function "plotting_distributions".

n_random_distributions represents the amount of independent distributions with the specific shape that the function will use to construct the kurtosis and square of skewness graph.

colour defines the color of the distribution line in the graph.

If TRUE random_distributions_plot generates a plot of your random distribution aiming at observing the local concentration in individual points, distributions are not a linear trend as outlined in the resulting graph but rather complex concentrations that can be observed with this plot.

Finally, vector_colors enables you to input a charachter vector specifying the colour in which independent response variables should be plotted. This feature is useful if you want to color differently potentially correlated variables which would show similar distribuions.

The function returns a matrix with the kurtosis and square of skewness values for the inputed response variables. Secondly, it returns a plot with the distribution of your variables as compared to the simplified-linear version of the shape distribution chosen by you.

```
![Distributions](RandodiStats/000036.png)
```
