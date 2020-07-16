
# Test for substring() (retrieve/replace substring in a string)
# Expected linear time complexity (but was previously found quadratic as described in this case: https://stat.ethz.ch/pipermail/r-devel/2019-February/077318.html)
#test_that("substring function test", {
#  expect_linear_time(asymptoticTimings, substring(paste(rep("A", data.sizes), collapse = ""), 1:data.sizes, 1:data.sizes), data.sizes = 10^seq(1, 5, by = 0.5), max.seconds = 1)
#})

# Test for gregexpr() (global regexpr, giving all matches in a string)
# Expected linear time complexity (but similar to substring it was found quadratic as described in this case https://stat.ethz.ch/pipermail/r-devel/2017-January/073577.html)
#test_that("gregexpr function test", {
#  expect_linear_time(asymptoticTimings, gregexpr("a", paste(collapse = "", rep("ab", data.sizes)), perl = TRUE), data.sizes = 10^seq(1, 5, by = 0.5), max.seconds = 1)
#})
