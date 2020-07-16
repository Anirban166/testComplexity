#' Function to test if input algorithm has the specified time complexity
#'
#' @title Expected Time Complexity Test function
#'
#' @param complexity.class A string denoting the expected complexity class
#'
#' @param ... Parameters for passed function 'f'.
#'
#' @param f A function which returns a data frame composed of timings and corresponding data sizes, ideally from asymptoticTimings. (can use other functions)
#'
#' @return null for expected complexity, else throws error.
#'
#' @export

expect_time_complexity = function(complexity.class, ..., f)
{
  f <- if(missing(f)) asymptoticTimings else f

  timings.df <- f(...)

  if(asymptoticTimeComplexityClass(timings.df) != complexity.class)
    stop("Complexity mismatch: Expected ", expected.complexity.class, " complexity, in place of the predicted ", predicted.complexity.class, " complexity")
}
