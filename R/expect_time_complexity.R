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

expect_time_complexity = function(complexity.class, ..., f)
{
  f <- if(missing(f)) asymptoticTimings else f

  timings.df <- f(...)

  expect_complexity_class(asymptoticTimeComplexityClass(timings.df), complexity.class)
}
