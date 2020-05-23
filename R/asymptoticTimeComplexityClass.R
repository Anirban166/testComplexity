asymptoticTimeComplexityClass = function(to.model)
{
  constant   <- glm(Timings~1,                                      data = to.model); to.model['constant'] = fitted(constant)
  linear     <- glm(Timings~`Data set sizes`,                       data = to.model); to.model['linear'] = fitted(linear)
  squareroot <- glm(Timings~sqrt(`Data set sizes`),                 data = to.model); to.model['squareroot'] = fitted(squareroot)
  log        <- glm(Timings~log(`Data set sizes`),                  data = to.model); to.model['log'] = fitted(log)
  log.linear <- glm(Timings~`Data set sizes`*log(`Data set sizes`), data = to.model); to.model['log-linear'] = fitted(log.linear)
  quadratic  <- glm(Timings~I(`Data set sizes`^2),                  data = to.model); to.model['quadratic'] = fitted(quadratic)
  cubic      <- glm(Timings~I(`Data set sizes`^3),                  data = to.model); to.model['cubic'] = fitted(cubic)

  model.list <- list('constant'   = constant,
                     'linear'     = linear,
                     'squareroot' = squareroot,
                     'log'        = log,
                     'log-linear' = log.linear,
                     'quadratic'  = quadratic,
                     'cubic'      = cubic
                    )

  cross.validated.errors <- lapply(model.list, function(x) cv.glm(to.model, x)$delta[2])
  best.model <- names(which.min(cross.validated.errors))
  print(best.model)
}
