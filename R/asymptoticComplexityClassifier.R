#' Function to classify the complexity trend between the two parameters as provided by asymptoticComplexityClass
#'
#' @title Asymptotic Complexity Classifier function
#'
#' @param df A data frame returned by asymptoticComplexityClass.
#'
#' @return A string specifying the resultant complexity class. (Eg: 'Linear', 'Log-linear', 'Quadratic')
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Generalized-complexity/
#'
#' @export
#' @importFrom stats glm
#' @importFrom boot cv.glm
#' @importFrom stats fitted
#'
#' @examples
#' # Avoiding for CRAN since computation time might exceed 5 seconds sometimes:
#' \dontrun{
#' # Running the quick sort algorithm with sampling against a set of increasing input data sizes:
#' sizes = 10^seq(1, 3, by = 0.5)
#' df <- asymptoticTimings(sort(sample(1:100, data.sizes, replace = TRUE), method = "quick"), sizes)
#' # Classifying the complexity trend between the data contained in the columns
#' # 'Timings' and 'Data sizes' from the data frame obtained above:
#' resultant.df <- data.frame('output' = df$Timings, 'size' = df$`Data sizes`)
#' asymptoticComplexityClassifier(resultant.df)
#' # For quick sort, the log-linear time complexity class is expected.
#' }

asymptoticComplexityClassifier = function(df)
{
  if(class(df) == "data.frame" & 'output' %in% colnames(df) & 'size' %in% colnames(df))
  {
    constant   <- glm(output~1,                  data = df); df['constant'] = fitted(constant)
    linear     <- glm(output~size,               data = df); df['linear'] = fitted(linear)
    log        <- glm(output~log(size),          data = df); df['log'] = fitted(log)
    loglinear  <- glm(output~size*log(size),     data = df); df['loglinear'] = fitted(loglinear)
    quadratic  <- glm(output~I(size^2),          data = df); df['quadratic'] = fitted(quadratic)

    model.list <- list()

    for(complexity.class in c('constant', 'log', 'linear', 'loglinear', 'quadratic'))
    {
      model.list[[complexity.class]] = eval(as.name(complexity.class))
    }

    cross.validated.errors <- lapply(model.list, function(x) cv.glm(df, x)$delta[2])
    best.model <- names(which.min(cross.validated.errors))
    print(best.model)
  }
  else stop("Input parameter must be a data frame containing the two specified columns passed as parameters")
}
