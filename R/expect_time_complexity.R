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
#' \donttest{ # Avoiding for CRAN since computation time exceeds 5 seconds
#' # Testing the PeakSegOptimal::PeakSegPDPA() function, expecting log-linear time complexity:
#' func <- PeakSegOptimal::PeakSegPDPA(rpois(N, 1), max.segments = 3L)
#' input.sizes <- 10^seq(1, 4, by = 0.5)
#' expect_time_complexity("loglinear", func, input.sizes)
#' # The above code will throw an error if the function does not follow a log-linear trend.
#' }

expect_time_complexity = function(complexity.class, ..., f)
{
  f <- if(missing(f)) asymptoticTimings else f

  timings.df <- f(...)

  expect_complexity_class(asymptoticTimeComplexityClass(timings.df), complexity.class)
}
