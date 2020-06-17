#' Function to classify the time complexity of the expression passed onto asymptoticTimings (which outputs a data frame to be used here)
#'
#' @title Asymptotic Time Complexity Classifying function
#'
#' @param model.df A data frame composed of columns 'Timings' and 'Data sizes', which can be obtained by asymptoticTimings()
#'
#' @return A string specifying the resultant complexity class. (Eg: 'Linear', 'Log-linear', 'Quadratic')
#'
#' @details For more information regarding its functionality, please check https://anirban166.github.io//Time-complexity-classifier/
#'
#' @export
#' @importFrom boot cv.glm
#' @importFrom stats fitted

asymptoticTimeComplexityClass = function(model.df)
{
  if(class(model.df) == "data.frame" & "Timings" %in% colnames(model.df) & "Data sizes" %in% colnames(model.df))
  {
    constant   <- glm(Timings~1,                              data = model.df); model.df['constant'] = fitted(constant)
    linear     <- glm(Timings~`Data sizes`,                   data = model.df); model.df['linear'] = fitted(linear)
    squareroot <- glm(Timings~sqrt(`Data sizes`),             data = model.df); model.df['squareroot'] = fitted(squareroot)
    log        <- glm(Timings~log(`Data sizes`),              data = model.df); model.df['log'] = fitted(log)
    log.linear <- glm(Timings~`Data sizes`*log(`Data sizes`), data = model.df); model.df['log-linear'] = fitted(log.linear)
    quadratic  <- glm(Timings~I(`Data sizes`^2),              data = model.df); model.df['quadratic'] = fitted(quadratic)
    cubic      <- glm(Timings~I(`Data sizes`^3),              data = model.df); model.df['cubic'] = fitted(cubic)

    model.list <- list('constant'   = constant,
                       'linear'     = linear,
                       'squareroot' = squareroot,
                       'log'        = log,
                       'log-linear' = log.linear,
                       'quadratic'  = quadratic,
                       'cubic'      = cubic
                      )

    cross.validated.errors <- lapply(model.list, function(x) cv.glm(model.df, x)$delta[2])
    best.model <- names(which.min(cross.validated.errors))
    print(best.model)
  }
  else stop("Input parameter must be a data frame with columns 'Timings' and 'Data sizes'")
}
