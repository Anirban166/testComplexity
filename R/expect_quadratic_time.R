#' Function to test if input algorithm has quadratic time complexity
#'
#' @title Quadratic Time Complexity Test function
#'
#' @param ... Parameters for the expression to be tested, which is a function of data.sizes, as in asymptoticTimings
#'
#' @return null for expected complexity (quadratic), else throws error.
#'
#' @export

expect_quadratic_time = function(...)
{
  expect_time_complexity("quadratic", ...)
}
