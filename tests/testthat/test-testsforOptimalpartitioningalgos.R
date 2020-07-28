
if(require(opart)) {
  test_that("opart::opart_gaussian function test", {
    # Test for opart::opart_gaussian, a quadratic time optimal partitioning algorithm
    expect_quadratic_time(opart_gaussian(rnorm(data.sizes), 1), data.sizes = 10^seq(1, 4, by = 0.5), max.seconds = 0.1)
  })
}
