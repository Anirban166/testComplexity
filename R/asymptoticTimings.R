asymptoticTimings <- function(e, N.seq)
{
  lang.obj <- substitute(e)
  fun.obj  <- function(N)
  {
    eval(lang.obj)
  }
  asymptoticTimingsFun(fun.obj, N.seq)
}

