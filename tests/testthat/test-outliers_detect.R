context("Outliers Detect")



test_that("zscore outliers work with toy data", {

  s <- outliers_detect_zscore(hi_zscore_series)
  expect_equal(c(F, F, F, F, F, F, F, F, F, F, T), s)

  s <- outliers_detect_zscore(simple_series, 1)
  expect_equal(c(F,F,F,F,T), s)

})

test_that("iqr outliers work with toy data", {
  s <- outliers_detect_iqr(simple_series)
  expect_equal(c(F,F,F,F,T), s)

  s <- outliers_detect_iqr(simple_series, 2)
  expect_equal(c(F,F,F,F,T), s)

  s <- outliers_detect_iqr(multiple_outliers_series)
  expect_equal(c(F,F,F,F,F,F,T,T), s)
})

test_that("iforest outlier work with toy data", {
  s <- outliers_detect_iforest(simple_series)
  expect_equal(c(F,F,F,F,T), s)

  s <- outliers_detect_zscore(hi_zscore_series)
  expect_equal(c(F, F, F, F, F, F, F, F, F, F, T), s)

  s <- outliers_detect_iforest(multiple_outliers_series)
  expect_equal(c(F,F,F,F,F,F,T,T), s)
})


test_that("remove outliers works with toy data", {

  x <- remove_outliers(simple_series, c(F,F,F,F,T))
  expect_equal(c(1000), x)
})


test_that("integration tests for outlier detect", {
  s <- outliers_detect(hi_zscore_series, method = "zscore")
  expect_equal(c(F, F, F, F, F, F, F, F, F, F, T), s)

  s <- outliers_detect(simple_series, method = "iqr")
  expect_equal(c(F,F,F,F,T), s)

  s <- outliers_detect(simple_series, method = "iforest")
  expect_equal(c(F,F,F,F,T), s)
})

test_that("check errors in wrapepr method", {
  expect_error(outliers_detect(c("abs", "asdad", "asda", "12")))
  expect_error(outliers_detect(1))
  expect_error(outliers_detect(simple_series, method="best"))
})

test_that("check errors in remove outliers", {
  expect_error(remove_outliers(c(1,2,3), c(1,2,3)))
  expect_error(remove_outliers(c(1,2,3), c(T,F)))
})
