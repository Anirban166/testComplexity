#' Function to test if object returning/printing a string matches with a specified string
#'
#' @title Expected Complexity Class test function
#'
#' @param object The argument which returns a string to be tested against the expected string
#'
#' @param complexity.class A string denoting the expected complexity class
#'
#' @return null for expected complexity, else throws error.
#'
#' @export
#' @import testthat

expect_complexity_class <- function(object, complexity.class)
{
  actual.obj <- quasi_label(enquo(object), arg = "object")

  expect(
    actual.obj$val %in% complexity.class,
    sprintf("Complexity mismatch: Expected %s complexity, instead of the predicted %s complexity from %s.", complexity.class, actual.obj$val, actual.obj$lab)
  )

  invisible(actual.obj$val)
}
