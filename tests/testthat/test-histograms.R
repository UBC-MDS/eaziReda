test_that("Exceptions work",{
  expect_error(histograms(as.list(mtcars), features=c('cyl')))
  expect_error(histograms(mtcars, features=c("wrong_name")))
  expect_error(histograms(mtcars, features=c("cyl"), num_cols=2.5))
})

