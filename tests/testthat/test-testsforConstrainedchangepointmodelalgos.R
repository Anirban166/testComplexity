

if(require(PeakSegOptimal)) {
  test_that("PeakSegOptimal::PeakSegPDPA function test", {
    # Test for PeakSegOptimal::PeakSegPDPA, a log-linear time constrained changepoint detection algorithm:
    expect_loglinear_time(asymptoticTimings, PeakSegPDPA(rpois(data.sizes, 1), rep(1, length(rpois(data.sizes, 1))), 3L), data.sizes = 10^seq(1, 4, by = 0.5))
  })
}

if(require(PeakSegDP)) {
  test_that("PeakSegDP::cDPA function test", {
    # Test for PeakSegDP::cDPA, a quadratic time constrained dynamic programming algorithm:
    expect_quadratic_time(asymptoticTimings, PeakSegDP::cDPA(rpois(data.sizes, 1), rep(1, length(rpois(data.sizes, 1))), 3L), data.sizes = 10^seq(1, 4, by = 0.5))
  })
}

