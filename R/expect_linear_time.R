#' Function to test if input algorithm has linear time complexity
#'
#' @title Linear Time Complexity Test function
#'
#' @param f A function which returns a data frame composed of timings and corresponding data sizes, ideally from asymptoticTimings. (can use other functions)
#'
#' @param ... Parameters for passed function 'f'.
#'
#' @return null for expected complexity (linear), else throws error.
#'
#' @export

expect_linear_time = function(f = asymptoticTimings, ...)
{
  timings.df <- f(...)

  stopifnot(asymptoticTimeComplexityClass(timings.df) == "linear")
}
