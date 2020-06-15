#' Function to classify the complexity trend between two selected parameters from the data frame provided as input here
#'
#' @title Asymptotic Complexity Classification function
#'
#' @param model.df A data frame.
#'
#' @return A string specifying the resultant complexity class. (Eg: 'Linear', 'Log-linear', 'Quadratic')
#'
#' @export

asymptoticComplexityClass = function(df, col1, col2)
{
  d <- data.frame('output' = df[[col1]], 'size' = df[[col2]])
  asymptoticComplexityClassifier(d)
}

