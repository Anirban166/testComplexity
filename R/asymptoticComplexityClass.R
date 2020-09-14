#' Function to classify the complexity trend between two selected parameters from the data frame provided as input here
#'
#' @title Asymptotic Complexity Classification function
#'
#' @param df A data frame composing for two columns at the least, where one should be the contain the output-parameter sizes and one should contain the data sizes.
#'
#' @param output.size A string specifying the column name in the passed data frame to be used as the output size.
#'
#' @param data.size A string specifying the column name in the passed data frame to be used as the data size.
#'
#' @return A string specifying the resultant complexity class. (Eg: 'Linear', 'Log-linear', 'Quadratic')
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Generalized-complexity/
#'
#' @export
#'
#' @examples
#' # Avoiding for CRAN since computation time might exceed 5 seconds sometimes:
#' \dontrun{
#' # Running the quick sort algorithm with sampling against a set of increasing input data sizes:
#' sizes = 10^seq(1, 3, by = 0.5)
#' df <- asymptoticTimings(sort(sample(1:100, data.sizes, replace = TRUE), method = "quick"), sizes)
#' # Classifying the complexity trend between the data contained in the columns
#' # 'Timings' and 'Data sizes' from the data frame obtained above:
#' asymptoticComplexityClass(df, output.size = "Timings", data.size = "Data sizes")
#' # For quick sort, the log-linear time complexity class is expected.
#' }

asymptoticComplexityClass = function(df, output.size, data.size)
{
  if(class(df) == "data.frame" & output.size %in% colnames(df) & data.size %in% colnames(df))
  {
    d <- data.frame('output' = df[[output.size]], 'size' = df[[data.size]])
    asymptoticComplexityClassifier(d)
  }
  else stop("Input parameter must be a data frame containing the two specified columns passed as parameters")
}

