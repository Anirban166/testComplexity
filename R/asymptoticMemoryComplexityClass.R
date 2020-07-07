#' Function to classify the memory complexity of the expression passed onto asymptoticMemoryUsage (which outputs a data frame to be used here)
#'
#' @title Asymptotic Memory Complexity Classifying function
#'
#' @param model.df A data frame composed of columns 'Memory usage' and 'Data sizes', which can be obtained by asymptoticMemoryUsage()
#'
#' @return A string specifying the resultant complexity class. (Eg: 'Linear', 'Log-linear', 'Quadratic')
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Memory-complexity-classifier/
#'
#' @export
#' @importFrom stats glm
#' @importFrom boot cv.glm
#' @importFrom stats fitted

asymptoticMemoryComplexityClass = function(model.df)
{
  if(class(model.df) == "data.frame" & "Memory usage" %in% colnames(model.df) & "Data sizes" %in% colnames(model.df))
  {
    constant   <- glm(`Memory usage`~1,                               data = model.df); model.df['constant'] = fitted(constant)
    linear     <- glm(`Memory usage`~`Data sizes`,                    data = model.df); model.df['linear'] = fitted(linear)
    log        <- glm(`Memory usage`~log(`Data sizes`),               data = model.df); model.df['log'] = fitted(log)
    loglinear  <- glm(`Memory usage`~`Data sizes`*log(`Data sizes`),  data = model.df); model.df['loglinear'] = fitted(loglinear)
    quadratic  <- glm(`Memory usage`~I(`Data sizes`^2),               data = model.df); model.df['quadratic'] = fitted(quadratic)

    model.list <- list()

    for(complexity.class in c('constant', 'log', 'linear', 'loglinear', 'quadratic'))
    {
      model.list[[complexity.class]] = eval(as.name(complexity.class))
    }

    cross.validated.errors <- lapply(model.list, function(x) cv.glm(model.df, x)$delta[2])
    best.model <- names(which.min(cross.validated.errors))
    print(best.model)
  }
  else stop("Input parameter must be a data frame with columns 'Memory usage' and 'Data sizes'")
}
