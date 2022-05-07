#' Function to compute benchmarked timings with different data sizes for an R expression
#'
#' @title Asymptotic Timings Quantifying function
#'
#' @param e An expression which is in the form of a function operating on 'N' (as the data size for the algorithm to be tested against for a run), which takes values from the used-supplied parameter data.sizes.
#'
#' @param data.sizes A vector/set of data sizes, which should preferably be a sequence in powers of ten, with mid-values included.
#' Example: data.sizes = 10^seq(1, 4, by = 0.5)
#'
#' @param max.seconds The maximum number of seconds an iteration would be limited upto. (once the limit has been exceeded, further computations on incrementally larger dataset sizes won't be done)
#' Optional, with the default value set to 1 second.
#'
#' @return A data frame comprising of the timings computed by microbenchmark and the corresponding dataset sizes.
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Timings-function/
#'
#' @export
#' @import microbenchmark
#'
#' @examples
#' \dontrun{
#' # Quantifying the runtimes for the quick sort algorithm (with sampling performed)
#' # against a set of increasing input data sizes:
#' input.sizes = 10^seq(1, 3, by = 0.5)
#' asymptoticTimings(sort(sample(1:100, data.sizes, replace = TRUE), method = "quick"), input.sizes)
#' }

asymptoticTimings <- function(e, data.sizes, max.seconds)
{
  if(!all(!is.infinite(data.sizes) & !is.na(data.sizes) & !is.nan(data.sizes)))
    stop("data.sizes must not contain any NA/NaN/Infinite value.")

  lang.obj <- substitute(e)

  N <- data.sizes

  fun.obj  <- function(N)
  {
    eval(lang.obj)
  }

  time.limit <- if(missing(max.seconds)) 10^9 else max.seconds*10^9

  timings.list <- list()

  i <- 1

  continue <- TRUE

  while(i <= length(data.sizes) & continue)
  {
    benchmarked.timings <- as.data.frame(microbenchmark(fun.obj(data.sizes[i])))

    benchmarked.timings$data.size <- data.sizes[i]

    timings.list[[i]] <- data.frame(benchmarked.timings$time, benchmarked.timings$data.size)

    if(mean(benchmarked.timings$time) > time.limit) continue <<- FALSE

    i <- i + 1
  }

  resultant.df <- do.call(rbind, timings.list)

  colnames(resultant.df) <- c("Timings", "Data sizes")

  return(resultant.df)
}
