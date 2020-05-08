
library(testthat)

test_that("same function", {
  expect_equal(loglinearvsquadraticClassifier(f1,f1),"both the functions cannot be same!")
})
