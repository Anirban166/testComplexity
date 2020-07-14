#' Function to test if input algorithm has log-linear time complexity
#'
#' @title Log-Linear Time Complexity Test function
#'
#' @param ... Parameters for the expression to be tested, which is a function of data.sizes, as in asymptoticTimings
#'
#' @return null, throws error if complexity is not log-linear. (i.e. O(NlogN) for size N, in Big-O notation)
#'
#' @export

expect_loglinear_time = function(...)
{
  expect_time_complexity("loglinear", ...)
}
