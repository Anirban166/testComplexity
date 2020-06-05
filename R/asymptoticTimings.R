asymptoticTimings <- function(e, data.sizes, max.seconds)
{
  lang.obj <- substitute(e)

  fun.obj  <- function(data.sizes)
  {
    eval(lang.obj)
  }

  time.limit = ifelse(missing(max.seconds), 10^8, max.seconds*10^9)

  l <- length(data.sizes)

  timings.list <- list()

  for(i in 1:l)
  {
    benchmarked.timings <- as.data.frame(microbenchmark(fun.obj(data.sizes[i])))

    benchmarked.timings$data.size <- data.sizes[i]

    timings.list[[i]] <- data.frame(benchmarked.timings$time, benchmarked.timings$data.size)

    if(mean(benchmarked.timings$time) > time.limit) break
  }

  resultant.df <- do.call(rbind, timings.list)

  colnames(resultant.df) <- c("Timings", "Data sizes")

  return(resultant.df)
}
