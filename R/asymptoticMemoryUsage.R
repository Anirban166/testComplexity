#' Function to compute benchmarked memory allocation with different data sizes for an R expression
#'
#' @title Asymptotic Memory Metrics Quantifying function
#'
#' @param e An expression which is in the form of a function operating on the parameter 'data.sizes' given by the user.
#'
#' @param data.sizes Set of data sizes, which should preferably be a sequence of powers of ten, with a multitude of mid-values included.
#' # Example: data.sizes = 10^(1, 5, by = 0.1)
#'
#' @param max.bytes The maximum number of allocated bytes an iteration would be limited upto for the passed expression. (once the limit has been exceeded, further computations on incrementally larger dataset sizes won't be done)
#' # Optional, with default value set to 10^6 bytes. (1 Megabyte/MB)
#'
#' @return A data frame comprising of the memory usage (in megabytes) computed by bench and the corresponding dataset sizes.
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Memory-usage-quantifier/
#'
#' @export
#' @import bench

asymptoticMemoryUsage <- function(e, data.sizes, max.bytes)
{
  if(!all(!is.infinite(data.sizes) & !is.na(data.sizes) & !is.nan(data.sizes)))
  {
    stop("data.sizes must not contain any NA/NaN/Infinite value.")
  }

  if(length(data.sizes) == 0)
  {
    stop("Cannot run on an empty vector for 'data.sizes'.")
  }

  lang.obj <- substitute(e)

  fun.obj  <- function(data.sizes)
  {
    eval(lang.obj)
  }

  memory.size.limit = ifelse(missing(max.bytes), 10^6, max.bytes)

  l <- length(data.sizes)

  memory.metrics.list <- list()

  for(i in 1:l)
  {
    benchmarked.memory.size <- bench_memory(fun.obj(data.sizes[i]))$mem_alloc

    data.size <- data.sizes[i]

    memory.metrics.list[[i]] <- data.frame(c(benchmarked.memory.size), c(data.size))

    ifelse((benchmarked.memory.size > memory.size.limit), break, next)
  }

  resultant.df <- do.call(rbind, memory.metrics.list)

  colnames(resultant.df) <- c("Memory usage", "Data sizes")

  return(resultant.df)
}
