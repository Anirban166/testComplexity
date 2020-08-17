
if(require(PeakSegOptimal)) {
  test_that("PeakSegOptimal::PeakSegPDPA function test", {
    # Test for PeakSegOptimal::PeakSegPDPA, a log-linear time constrained changepoint detection algorithm:
    expect_loglinear_time({
      data.vec <- rpois(N, 1)
      PeakSegOptimal::PeakSegPDPA(data.vec, max.segments = 3L)}, data.sizes = 10^seq(1, 4, by = 0.5))
  })
}

if(require(PeakSegDP)) {
  test_that("PeakSegDP::cDPA function test", {
    # Test for PeakSegDP::cDPA, a quadratic time constrained dynamic programming algorithm:
    expect_quadratic_time({
      data.vec <- rpois(N, 1)
      PeakSegDP::cDPA(data.vec, maxSegments = 3L)}, data.sizes = 10^seq(1, 4, by = 0.5))
  })
}
