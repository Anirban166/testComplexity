
#if(require(opart)) {
#  test_that("opart::opart_gaussian function test", {
#    # Test for opart::opart_gaussian, a quadratic time optimal partitioning algorithm
#    expect_quadratic_time(opart_gaussian(rnorm(data.sizes), 1), data.sizes = 10^seq(1, 4, by = 0.5), max.seconds = 0.1)
#  })
#}

if(require(fpop)) {
  test_that("fpop::Fpop function test", {
    # Test for fpop::Fpop, a loglinear time segmentation algorithm that uses optimal partitioning
    expect_loglinear_time(Fpop(rnorm(data.sizes), 1), data.sizes = 10^seq(1, 5, by = 0.5))
  })
}

#if(require(gfpop)) {
#  test_that("gfpop::gfpop function test", {
#    # Test for gfpop::gfpop, a loglinear time functional pruning algorithm using optimal partitioning
#    expect_loglinear_time(gfpop(data = dataGenerator(as.integer(data.sizes), c(0.1, 0.2, 0.3, 0.4, 0.6, 0.8, 1), c(0, 0.5, 1, 1.5, 2, 2.5, 3), sigma = 1), mygraph = graph(penalty = 2*log(as.integer(data.sizes)), type = "isotonic"), type = "mean"), data.sizes = 10^seq(1, 4, by = 0.5))
#  })
#}
