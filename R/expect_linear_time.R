#' Function to test if input algorithm has linear time complexity
#'
#' @title Linear Time Complexity Test function
#'
#' @param ... Parameters for the expression to be tested, which is a function of data.sizes, as in asymptoticTimings
#'
#' @return null for expected complexity (linear), else throws error.
#'
#' @export

expect_linear_time = function(...)
{
  expect_time_complexity("linear", ...)
}

