#' Function to test if input algorithm has log-linear time complexity
#'
#' @title Log-Linear Time Complexity Test function
#'
#' @param f A function which returns a data frame composed of timings and corresponding data sizes, ideally from asymptoticTimings. (can use other functions)
#'
#' @param ... Parameters for passed function 'f'.
#'
#' @return null, throws error if complexity is not log-linear. (i.e. O(NlogN) for size N, in Big-O notation)
#'
#' @export

expect_loglinear_time = function(f = asymptoticTimings, ...)
{
  timings.df <- f(...)

  stopifnot(asymptoticTimeComplexityClass(timings.df) == "loglinear")
}
