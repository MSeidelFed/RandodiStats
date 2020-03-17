plotting_distributions <- function(Distribution_test_mat = test,
                                   Regression_Family = gamma,
                                   n_random_distributions = 100,
                                   colour = "red",
                                   random_distributions_plot = F) {
  
  if(!require(fitdistrplus)){install.packages("fitdistrplus"); require(fitdistrplus)}
  library(fitdistrplus)
  
### funtion to Transform a list into a data frame (https://www.rdocumentation.org/packages/qdapTools/versions/1.3.3/topics/list2df)
  
list2df <- function(x) 
{ 
  MAX.LEN <- max(sapply(x, length), na.rm = TRUE) 
  DF <- data.frame(lapply(x, function(x) c(x, rep(NA, MAX.LEN - length(x))))) 
  colnames(DF) <- paste("V", seq(ncol(DF)), sep = "")   
  DF 
} 

SKEW <- vector(mode = "list", length = dim(Distribution_test_mat)[1])

KURT <- vector(mode = "list", length = dim(Distribution_test_mat)[1])

for (i in 1:dim(Distribution_test_mat)[2]) {
  
  SKEW[[i]]  <- descdist(as.numeric(Distribution_test_mat[,i]), graph = F)$skewness
  
  KURT[[i]]  <- descdist(as.numeric(Distribution_test_mat[,i]), graph = F)$kurtosis
  
}

average_distribution_plot <- t(rbind("square of skewness" = list2df(SKEW)^2, kurtosis = list2df(KURT)))

## choosing a distribution

if (Regression_Family == "gamma") {

### vectors of gamma distribution to estimate intercept and slope

      test <- matrix(data = NA, nrow = dim(Distribution_test_mat)[1], ncol = n_random_distributions)

      for (i in 1:n_random_distributions) {
  
      x <- round(rgamma(n = dim(Distribution_test_mat)[1],shape = 2,rate = 0.2),1)
  
      test[,i] <- x
  
}} else if (Regression_Family == "logis") {
  
### vectors of logis distribution to estimate intercept and slope
  
                test <- matrix(data = NA, nrow = dim(Distribution_test_mat)[1], ncol = n_random_distributions)
  
                for (i in 1:n_random_distributions) {
    
                x <- round(rlogis(n = dim(Distribution_test_mat)[1],location = 2,scale = 0.2),1)
    
                test[,i] <- x
  
}} else if (Regression_Family == "Beta") {
                  
### vectors of beta distribution to estimate intercept and slope
                  
                        test <- matrix(data = NA, nrow = dim(Distribution_test_mat)[1], ncol = n_random_distributions)
                  
                        for (i in 1:n_random_distributions) {
                    
                        x <- round(rbeta(n = dim(Distribution_test_mat)[1],shape1 = 2,shape2 = 1, ncp = 5),1)
                    
                        test[,i] <- x
                    
}} else if (Regression_Family == "Normal") {
                          
### vectors of normal distribution to estimate intercept and slope
                          
                              test <- matrix(data = NA, nrow = dim(Distribution_test_mat)[1], ncol = n_random_distributions)
                          
                              for (i in 1:n_random_distributions) {
                            
                              x <- round(rnorm(n = dim(Distribution_test_mat)[1],mean = 0, sd = 1),1)
                            
                              test[,i] <- x
                            
}}else { NA }

## estimating kurtosis and square of skewness of the random distribution vectors

SKEW <- vector(mode = "list", length = dim(test)[2])
KURT <- vector(mode = "list", length = dim(test)[2])

for (i in 1:dim(test)[2]) {
  SKEW[[i]]  <- descdist(as.numeric(test[,i]), graph = F)$skewness
  KURT[[i]]  <- descdist(as.numeric(test[,i]), graph = F)$kurtosis
}
test_distribution_plot <- t(rbind("square of skewness" = list2df(SKEW)^2, kurtosis = list2df(KURT)))


## fitting a linear model to the two parameters in order to get the slope and intercept for the graph

model<- lm(formula = test_distribution_plot[,2]~ test_distribution_plot[,1])

model_intercept <- model$coefficients[1]

model_slope <- model$coefficients[2]


## plot of your variables´ distributions plus a line featuring a selected distribution

plot(average_distribution_plot, ylim = c(10,0), xlim = c(0,5))

abline(a = model_slope, b = model_intercept, col = colour)

if (random_distributions_plot == F) {

NA
  
} else { 
  
  plot(test_distribution_plot, ylim = c(10,0), xlim = c(0,5))
  
}

return(average_distribution_plot)

}
