library(testthat)

# Tests for linear time complexity algorithms/functions

test_that("substring function test", {
  expect_linear_time(asymptoticTimings, substring(paste(rep("A", data.sizes), collapse = ""), 1:data.sizes, 1:data.sizes), data.sizes = 10^seq(1, 5, by = 0.5), max.seconds = 1)
})

test_that("gregexpr function test", {
  expect_linear_time(asymptoticTimings, gregexpr("a", paste(collapse = "", rep("ab", data.sizes)), perl = TRUE), data.sizes = 10^seq(1, 5, by = 0.5), max.seconds = 1)
})
