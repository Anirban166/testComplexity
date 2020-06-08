library(testthat)

# Tests for asymptoticTimings

test_that("Empty vector/sequence test for data.sizes", {
  expect_error(asymptoticTimings(expression, data.sizes = c()))
  expect_error(asymptoticTimings(expression, data.sizes = c(NULL)))
})

test_that("NA test for data.sizes", {
  expect_error(asymptoticTimings(expression, data.sizes = c(NA)))
})

test_that("NaN test for data.sizes", {
  expect_error(asymptoticTimings(expression, data.sizes = sqrt(-1)))
})

test_that("Inf test for data.sizes", {
  expect_error(asymptoticTimings(expression, data.sizes = Inf))
})

test_that("Return value test for asymptoticTimings", {
  df <- asymptoticTimings(rpois(data.sizes, 10), data.sizes = 10)
  expect_that(df, is_a("data.frame") )
  expect_equal(dim(df), c(100, 2))
  expect_equal(attributes(df)$names, c("Timings", "Data sizes"))
})

# Tests for asymptoticTimeComplexityClass

test_that("model.df parameter tests for asymptoticTimeComplexityClass", {
  expect_error(asymptoticTimeComplexityClass(c(10)))
})

test_that("Return value test for asymptoticTimeComplexityClass", {
  df <- asymptoticTimings(rpois(data.sizes, 10), data.sizes = 10)
  complexity.classes <- c("constant", "linear", "squareroot", "log", "log-linear", "quadratic", "cubic")
  expect_true(asymptoticTimeComplexityClass(df) %in% complexity.classes)
})

# Tests for plotTimings

test_that("data.df parameter tests for plotTimings", {
  expect_error(plotTimings(c(10)))
})

test_that("Return value (ggplot object) test for plotTimings", {
  df <- data.frame(c(1000, 2000, 3000), c(10, 20, 30))
  colnames(df) <- c("Timings", "Data sizes")
  expect_true("ggplot" %in% attributes(plotTimings(df))$class)
})

