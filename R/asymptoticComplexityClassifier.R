#' Function to classify the complexity trend between two selected parameters from the data frame provided as input here
#'
#' @title Asymptotic Complexity Classifier function
#'
#' @param model.df A data frame returned by asymptoticComplexityClass.
#'
#' @return A string specifying the resultant complexity class. (Eg: 'Linear', 'Log-linear', 'Quadratic')
#'
#' @export
#' @importFrom boot cv.glm
#' @importFrom stats fitted

asymptoticComplexityClassifier = function(df)
{
  if(class(df) == "data.frame" & 'output' %in% colnames(df) & 'size' %in% colnames(df))
  {
    constant   <- glm(output~1,                 data = df); df['constant'] = fitted(constant)
    linear     <- glm(output~size,              data = df); df['linear'] = fitted(linear)
    squareroot <- glm(output~sqrt(size),        data = df); df['squareroot'] = fitted(squareroot)
    log        <- glm(output~log(size),         data = df); df['log'] = fitted(log)
    log.linear <- glm(output~size*log(size),    data = df); df['log-linear'] = fitted(log.linear)
    quadratic  <- glm(output~I(size^2),         data = df); df['quadratic'] = fitted(quadratic)
    cubic      <- glm(output~I(size^3),         data = df); df['cubic'] = fitted(cubic)

    model.list <- list('constant'   = constant,
                       'linear'     = linear,
                       'squareroot' = squareroot,
                       'log'        = log,
                       'log-linear' = log.linear,
                       'quadratic'  = quadratic,
                       'cubic'      = cubic)

    cross.validated.errors <- lapply(model.list, function(x) cv.glm(df, x)$delta[2])
    best.model <- names(which.min(cross.validated.errors))
    print(best.model)
  }
  else stop("Input parameter must be a data frame containing the two specified columns passed as parameters")
}
