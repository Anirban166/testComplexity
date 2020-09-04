#' Function to compute benchmarked memory allocation with different data sizes for an R expression
#'
#' @title Asymptotic Memory Metrics Quantifying function
#'
#' @param e An expression which is in the form of a function operating on 'N' (as the data size for the algorithm to be tested against for a run), which takes values from the used-supplied parameter data.sizes.
#'
#' @param data.sizes A vector/set of data sizes, which should preferably be a sequence in powers of ten, with mid-values included.
#' Example: data.sizes = 10^seq(1, 4, by = 0.1)
#'
#' @param max.bytes The maximum number of allocated bytes an iteration would be limited upto for the passed expression. (once the limit has been exceeded, further computations on incrementally larger dataset sizes won't be done)
#' Optional, with default value set to 10^6 bytes. (1 Megabyte/MB)
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
    stop("data.sizes must not contain any NA/NaN/Infinite value.")

  lang.obj <- substitute(e)

  N <- data.sizes

  fun.obj <- function(N)
  {
    eval(lang.obj)
  }

  memory.size.limit <- if(missing(max.bytes)) 10^6 else max.bytes

  memory.metrics.list <- list()

  break.bool <- TRUE

  memory.metrics.list <- lapply(seq(along = data.sizes), function(i)
  {
    if(break.bool)
    {
      benchmarked.memory.size <- bench_memory(fun.obj(data.sizes[i]))$mem_alloc

      if(benchmarked.memory.size > memory.size.limit) break.bool <<- FALSE else TRUE

      data.size <- data.sizes[i]

      return(data.frame(c(benchmarked.memory.size), c(data.size)))
    }
  })

  resultant.df <- do.call(rbind, memory.metrics.list)

  colnames(resultant.df) <- c("Memory usage", "Data sizes")

  return(resultant.df)
}
