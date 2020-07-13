#' Function to test if input algorithm has quadratic time complexity
#'
#' @title Quadratic Time Complexity Test function
#'
#' @param f A function which returns a data frame composed of timings and corresponding data sizes, ideally from asymptoticTimings. (can use other functions)
#'
#' @param ... Parameters for passed function 'f'.
#'
#' @return null for expected complexity (quadratic), else throws error.
#'
#' @export

expect_quadratic_time = function(f = asymptoticTimings, ...)
{
  timings.df <- f(...)

  stopifnot(asymptoticTimeComplexityClass(timings.df) == "quadratic")
}
