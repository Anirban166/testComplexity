#' Function to test if input algorithm has log-linear time complexity
#'
#' @title Log-Linear Time Complexity Test function
#'
#' @param ... Parameters for the expression to be tested, which is a function of data.sizes, as in asymptoticTimings
#'
#' @return null, throws error if complexity is not log-linear. (i.e. O(NlogN) for size N, in Big-O notation)
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Testing-functions/
#'
#' @export

expect_loglinear_time = function(...)
{
  expect_time_complexity("loglinear", ...)
}
