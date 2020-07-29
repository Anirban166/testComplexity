
if(require(opart)) {
  test_that("opart::opart_gaussian function test", {
    # Test for opart::opart_gaussian, a quadratic time optimal partitioning algorithm
    expect_quadratic_time(opart_gaussian(rnorm(data.sizes), 1), data.sizes = 10^seq(1, 4, by = 0.5), max.seconds = 0.1)
  })
}

if(require(fpop)) {
  test_that("fpop::Fpop function test", {
    # Test for fpop::Fpop, a loglinear time segmentation algorithm that uses optimal partitioning
    expect_loglinear_time(Fpop(rnorm(data.sizes), 1), data.sizes = 10^seq(1, 5, by = 0.5))
  })
}
