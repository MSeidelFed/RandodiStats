distribution_test_mat <- function(nrow_x = 1000, n_random_distributions = 1000) {

#### vectors of gamma distribution to estimate intercept and slope
test1 <- matrix(data = NA, nrow = nrow_x, ncol = n_random_distributions)

for (i in 1:n_random_distributions) {
  
           x <- round(rgamma(n = nrow_x,shape = 2,rate = 0.2),1)
  
           test1[,i] <- x
  
}
  
### vectors of logis distribution to estimate intercept and slope
test2 <- matrix(data = NA, nrow = nrow_x, ncol = n_random_distributions)

for (i in 1:n_random_distributions) {
    
            x <- round(rlogis(n = nrow_x, location = 2,scale = 0.2),1)
    
            test2[,i] <- x
  
}
                  
### vectors of beta distribution to estimate intercept and slope
test3 <- matrix(data = NA, nrow = nrow_x, ncol = n_random_distributions)

for (i in 1:n_random_distributions) {
                    
            x <- round(rbeta(n = nrow_x, shape1 = 2, shape2 = 1, ncp = 5),1)
                    
            test3[,i] <- x
                    
}
                          
### vectors of normal distribution to estimate intercept and slope
test4 <- matrix(data = NA, nrow = nrow_x, ncol = n_random_distributions)

for (i in 1:n_random_distributions) {
                            
            x <- round(rnorm(n = nrow_x, mean = 0, sd = 1),1)
                            
            test4[,i] <- x
                            
}


return(cbind(test1, test2, test3, test4))

}
