#' Function to compute benchmarked timings with different data sizes for an R expression
#'
#' @title Asymptotic Timings Quantifying function
#'
#' @param e An expression which is in the form of a function operating on the parameter 'data.sizes' given by the user.
#'
#' @param data.sizes Set of data sizes, which should preferably be a sequence of powers of ten, with mid-values included.
#' # Example: data.sizes = 10^(1, 5, by = 0.5)
#'
#' @param max.seconds The maximum number of seconds an iteration would be limited upto. (once the limit has been exceeded, further computations on incrementally larger dataset sizes won't be done)
#' # Optional, with the default value set to 1 second.
#'
#' @return A data frame comprising of the timings computed by microbenchmark and the corresponding dataset sizes.
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Timings-function/
#'
#' @export
#' @import microbenchmark

asymptoticTimings <- function(e, data.sizes, max.seconds)
{
  ifelse(!all(!is.infinite(data.sizes) & !is.na(data.sizes) & !is.nan(data.sizes)), stop("data.sizes must not contain any NA/NaN/Infinite value."), return)

  lang.obj <- substitute(e)

  fun.obj  <- function(data.sizes)
  {
    eval(lang.obj)
  }

  if(missing(max.seconds))
    time.limit = 10^8
  else
    time.limit = max.seconds*10^9

  timings.list <- list()

  for(i in seq(along = data.sizes))
  {
    benchmarked.timings <- as.data.frame(microbenchmark(fun.obj(data.sizes[i])))

    benchmarked.timings$data.size <- data.sizes[i]

    timings.list[[i]] <- data.frame(benchmarked.timings$time, benchmarked.timings$data.size)

    if(mean(benchmarked.timings$time) > time.limit)
      break
    else
      next
  }

  resultant.df <- do.call(rbind, timings.list)

  colnames(resultant.df) <- c("Timings", "Data sizes")

  return(resultant.df)
}
