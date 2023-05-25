# Poultry-Biosecurity R Code Description
## The latent class analysis (LCA) in R relies in the "poLCA" package. 
## Use code install.packages("poLCA") to install the package.
## To activate the package use the code library(poLCA). 
## Usage: poLCA(formula, data, nclass = 2, maxiter = 1000, graphs = FALSE, tol = 1e-10, na.rm = TRUE, probs.start = NULL, nrep = 1, verbose = TRUE, calc.se = TRUE)
### 	     formula: A formula expression of the form response ~ predictors. 
###        data:    A dataframe containing variables in formula.
###        nclass:  The number of classes for the model being estimated
###        tol: A tolerance value for judging when convergence has been reached. When the one-iteration change in the estimated log-likelihood is less than tol, the estimation algorithm stops updating and considers the maximum log-likelihood to have been found.
###        probs.start: A list of matrices of class-conditional response probabilities to be used as the starting values for the estimation algorithm. Each matrix in the list corresponds to one manifest variable, with one row for each latent class, and one column for each outcome. The default is NULL, producing random starting values.
###        nrep: Number of times to estimate the model, using different values of probs.start. The default is one. Setting nrep>1 automates the search for the global—rather than just a local—maximum of the log-likelihood function. poLCA returns the parameter estimates corresponding to the model with the greatest log-likelihood.
###        verbose: Logical, indicating whether poLCA should output to the screen the results of the model. If FALSE, no output is produced. The default is TRUE.
###        calc.se: Logical, indicating whether poLCA should calculate the standard errors of the estimated class-conditional response probabilities and mixing proportions. The default is TRUE; can only be set to FALSE if estimating a basic model with no concomitant variables specified in formula.

## pred.prob: Generates the posterior probabilities
## pred.class: Assigns individuals to classes based on the predicted probabilities
## post.stat: column binds the data, the posterior probabilities, and the assigned classes.


# Stata Do File Description
