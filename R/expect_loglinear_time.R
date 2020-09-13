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
#'
#' @examples
#' \donttest{ # Avoiding for CRAN since computation time exceeds 5 seconds
#' # Testing the PeakSegOptimal::PeakSegPDPA() function, expecting log-linear time complexity:
#' expect_loglinear_time({
#'     data.vec <- rpois(N, 1)
#'    PeakSegOptimal::PeakSegPDPA(data.vec, max.segments = 3L)}, data.sizes = 10^seq(1, 4, by = 0.5))
#' # The above code will throw an error if the function does not follow a log-linear trend.
#' }

expect_loglinear_time = function(...)
{
  expect_time_complexity("loglinear", ...)
}
