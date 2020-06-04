asymptoticTimings <- function(e, N, max.seconds)
{
  lang.obj <- substitute(e)

  fun.obj  <- function(N)
  {
    eval(lang.obj)
  }

  time.limit = ifelse(missing(max.seconds), 10^8, max.seconds*10^9)

  power.of.ten = log(N, 10)

  data.set.sizes <- 10^seq(1, power.of.ten, by = 0.5)

  # total obs. = (N + (N-1))x100. For eg: N=2 -> 300 obs., N=3 -> 500 obs., N=4 -> 700 obs. and so on.

  l <- length(data.set.sizes)

  timings.list <- list()

  for(i in 1:l)
  {
    benchmarked.timings <- as.data.frame(microbenchmark(fun.obj(data.set.sizes[i])))

    benchmarked.timings$data.set.size <- data.set.sizes[i] # collecting data set sizes at each iteration

    timings.list[[i]] <- data.frame(benchmarked.timings$time, benchmarked.timings$data.set.size)

    if(mean(benchmarked.timings$time) > time.limit) break
  }

  resultant.df <- do.call(rbind, timings.list)

  colnames(resultant.df) <- c("Timings", "Data set sizes")

  return(resultant.df)
}
