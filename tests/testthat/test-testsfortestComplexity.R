library(testthat)

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
})



