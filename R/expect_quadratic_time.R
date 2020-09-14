#' Function to test if input algorithm has quadratic time complexity
#'
#' @title Quadratic Time Complexity Test function
#'
#' @param ... Parameters for the expression to be tested, which is a function of data.sizes, as in asymptoticTimings
#'
#' @return null for expected complexity (quadratic), else throws error.
#'
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Testing-functions/
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Running the quick sort algorithm with sampling against a set of increasing input data sizes:
#' sizes = 10^seq(1, 3, by = 0.5)
#' expect_quadratic_time(sort(sample(1:100, data.sizes, replace = TRUE), method = "quick"), sizes)
#' # The code above will throw an error if the function does not follow a quadratic trend.
#' }

expect_quadratic_time = function(...)
{
  expect_time_complexity("quadratic", ...)
}
