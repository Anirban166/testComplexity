#' Function to classify the time complexity of the expression passed onto asymptoticTimings (which outputs a data frame to be used here)
#'
#' @title Asymptotic Time Complexity Classifying function
#'
#' @param model.df A data frame composed of columns 'Timings' and 'Data sizes', which can be obtained by asymptoticTimings()
#'
#' @return A string specifying the resultant complexity class. (Eg: 'Linear', 'Log-linear', 'Quadratic')
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Complexity-classifiers/
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
#' # Classifying the time complexity trend based on the benchmarked data obtained above:
#' asymptoticTimeComplexityClass(df)
#' # For quick sort, the log-linear time complexity class is expected.
#' }

asymptoticTimeComplexityClass = function(model.df)
{
  if(class(model.df) == "data.frame" & "Timings" %in% colnames(model.df) & "Data sizes" %in% colnames(model.df))
  {
    constant   <- glm(Timings~1,                              data = model.df); model.df['constant'] = fitted(constant)
    linear     <- glm(Timings~`Data sizes`,                   data = model.df); model.df['linear'] = fitted(linear)
    log        <- glm(Timings~log(`Data sizes`),              data = model.df); model.df['log'] = fitted(log)
    loglinear  <- glm(Timings~`Data sizes`*log(`Data sizes`), data = model.df); model.df['loglinear'] = fitted(loglinear)
    quadratic  <- glm(Timings~I(`Data sizes`^2),              data = model.df); model.df['quadratic'] = fitted(quadratic)

    model.list <- list()

    for(complexity.class in c('constant', 'log', 'linear', 'loglinear', 'quadratic'))
    {
      model.list[[complexity.class]] = eval(as.name(complexity.class))
    }

    cross.validated.errors <- lapply(model.list, function(x) cv.glm(model.df, x)$delta[2])
    best.model <- names(which.min(cross.validated.errors))
    print(best.model)
  }
  else stop("Input parameter must be a data frame with columns 'Timings' and 'Data sizes'")
}
