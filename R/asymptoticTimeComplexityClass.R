asymptoticTimeComplexityClass = function(model.df)
{
  constant   <- glm(Timings~1,                                      data = model.df); model.df['constant'] = fitted(constant)
  linear     <- glm(Timings~`Data set sizes`,                       data = model.df); model.df['linear'] = fitted(linear)
  squareroot <- glm(Timings~sqrt(`Data set sizes`),                 data = model.df); model.df['squareroot'] = fitted(squareroot)
  log        <- glm(Timings~log(`Data set sizes`),                  data = model.df); model.df['log'] = fitted(log)
  log.linear <- glm(Timings~`Data set sizes`*log(`Data set sizes`), data = model.df); model.df['log-linear'] = fitted(log.linear)
  quadratic  <- glm(Timings~I(`Data set sizes`^2),                  data = model.df); model.df['quadratic'] = fitted(quadratic)
  cubic      <- glm(Timings~I(`Data set sizes`^3),                  data = model.df); model.df['cubic'] = fitted(cubic)

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
