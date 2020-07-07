#' Function to classify the complexity trend between the two parameters as provided by asymptoticComplexityClass
#'
#' @title Asymptotic Complexity Classifier function
#'
#' @param df A data frame returned by asymptoticComplexityClass.
#'
#' @return A string specifying the resultant complexity class. (Eg: 'Linear', 'Log-linear', 'Quadratic')
#'
#' @export
#' @importFrom stats glm
#' @importFrom boot cv.glm
#' @importFrom stats fitted

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
