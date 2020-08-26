
# Tests for asymptoticTimings()

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
  df <- asymptoticTimings(rpois(N, 10), data.sizes = 10)
  expect_that(df, is_a("data.frame") )
  expect_equal(dim(df), c(100, 2))
  expect_equal(attributes(df)$names, c("Timings", "Data sizes"))
})

# Tests for asymptoticTimeComplexityClass()

test_that("model.df parameter test for asymptoticTimeComplexityClass", {
  expect_error(asymptoticTimeComplexityClass(c(10)))
})

test_that("Return value test for asymptoticTimeComplexityClass", {
  df <- asymptoticTimings(rpois(N, 10), data.sizes = 10)
  complexity.classes <- c("constant", "log", "linear", "loglinear", "quadratic")
  expect_true(asymptoticTimeComplexityClass(df) %in% complexity.classes)
})

# Tests for plotTimings()

test_that("data.df parameter test for plotTimings", {
  expect_error(plotTimings(c(10)))
})

test_that("Return value (ggplot object) test for plotTimings", {
  df <- data.frame(c(1000, 2000, 3000), c(10, 20, 30))
  colnames(df) <- c("Timings", "Data sizes")
  expect_true("ggplot" %in% attributes(plotTimings(df))$class)
})

# Tests for asymptoticMemoryUsage()

test_that("Empty vector/sequence test for data.sizes", {
  expect_error(asymptoticMemoryUsage(expression, data.sizes = c()))
  expect_error(asymptoticMemoryUsage(expression, data.sizes = c(NULL)))
})

test_that("NA test for data.sizes", {
  expect_error(asymptoticMemoryUsage(expression, data.sizes = c(NA)))
})

test_that("NaN test for data.sizes", {
  expect_error(asymptoticMemoryUsage(expression, data.sizes = sqrt(-1)))
})

test_that("Inf test for data.sizes", {
  expect_error(asymptoticMemoryUsage(expression, data.sizes = Inf))
})

test_that("Return value test for asymptoticMemoryUsage", {
  df <- asymptoticMemoryUsage(rpois(N, 10), data.sizes = 10)
  expect_that(df, is_a("data.frame") )
  expect_equal(dim(df), c(1, 2))
  expect_equal(attributes(df)$names, c("Memory usage", "Data sizes"))
})

# Tests for asymptoticMemoryComplexityClass()

test_that("model.df parameter test for asymptoticMemoryComplexityClass", {
  expect_error(asymptoticMemoryComplexityClass(c(10)))
})

test_that("Return value test for asymptoticMemoryComplexityClass", {
  df <- asymptoticMemoryUsage(rpois(N, 10), data.sizes = 10^seq(1, 4, by = 0.1))
  complexity.classes <- c("constant", "log", "linear", "loglinear", "quadratic")
  expect_true(asymptoticMemoryComplexityClass(df) %in% complexity.classes)
})

# Tests for plotMemoryUsage()

test_that("data.df parameter test for plotMemoryUsage", {
  expect_error(plotMemoryUsage(c(10)))
})

test_that("Return value (ggplot object) test for plotMemoryUsage", {
  df <- data.frame(c(1000, 2000, 3000), c(10, 20, 30))
  colnames(df) <- c("Memory usage", "Data sizes")
  expect_true("ggplot" %in% attributes(plotMemoryUsage(df))$class)
})

# Tests for asymptoticComplexityClass()

test_that("data.df parameter test for asymptoticComplexityClass", {
  expect_error(asymptoticComplexityClass(c(10)))
  df <- data.frame(c(1000, 2000), c(10, 20))
  colnames(df) <- c("X", "Y")
  expect_error(asymptoticComplexityClass(df, "Y", "Z"))
})

test_that("Return value test for asymptoticComplexityClass", {
  df <- asymptoticTimings(substring(paste(rep("A", N), collapse = ""), 1:N, 1:N), data.sizes = 10^seq(1, 3, by = 0.5))
  complexity.classes <- c("constant", "log", "linear", "loglinear", "quadratic")
  expect_true(asymptoticComplexityClass(df, output.size = "Timings", data.size = "Data sizes") %in% complexity.classes)
})

# Tests for asymptoticComplexityClassifier()

test_that("data.df parameter test for asymptoticComplexityClassifier", {
  expect_error(asymptoticComplexityClassifier(c(10)))
})

test_that("Return value test for asymptoticComplexityClassifier", {
  df <- asymptoticTimings(substring(paste(rep("A", N), collapse = ""), 1:N, 1:N), data.sizes = 10^seq(1, 3, by = 0.5))
  f <- function(df, col1, col2)
  {
    d <- data.frame('output' = df[[col1]], 'size' = df[[col2]])
    return(d)
  }
  x <- f(df, "Timings", "Data sizes")
  complexity.classes <- c("constant", "log", "linear", "loglinear", "quadratic")
  expect_true(asymptoticComplexityClassifier(x) %in% complexity.classes)
})

# test_that("Misprediction test", {
#   expect_error(expect_linear_time(N, data.sizes = 10^seq(1, 3, by = 0.5)))
# })
