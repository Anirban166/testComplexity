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
#' @details For more information regarding its implementation or functionality/usage, please check https://anirban166.github.io//Testing-functions/
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Running the quick sort algorithm with sampling against a set of increasing input data sizes:
#' ds = 10^seq(1, 3, by = 0.5)
#' # Assigning a complexity class to test against:
#' cc = "loglinear"
#' # Note: short variable names are used to avoid exceeding the character limit in the line below.
#' expect_time_complexity(cc, sort(sample(1:100, data.sizes, replace = TRUE), method = "quick"), ds)
#' # The code above will throw an error if the function does not follow a log-linear trend.
#' }

expect_time_complexity = function(complexity.class, ..., f)
{
  f <- if(missing(f)) asymptoticTimings else f

  timings.df <- f(...)

  expect_complexity_class(asymptoticTimeComplexityClass(timings.df), complexity.class)
}
