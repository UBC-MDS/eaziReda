context("Histograms")

test_that("Exceptions work", {
  expect_error(histograms(as.list(mtcars), features = c('cyl')))
  expect_error(histograms(mtcars, features = c("wrong_name")))
  expect_error(histograms(mtcars, features = c("cyl"), num_cols = 2.5))
})

test_that("Proper object type returned", {
  expect_true(any(class(histograms(
    mtcars, features = c("cyl", 'mpg')
  )) == 'ggplot'))
})

test_that("Plots with mtcars match previous versions", {
  p1 <- histograms(mtcars, features = c("cyl"))
  vdiffr::expect_doppelganger("Single numeric", p1)

  p2 <- histograms(mtcars, features = c("cyl", "mpg"))
  vdiffr::expect_doppelganger("Double numeric", p2)

  p3 <-
    histograms(mtcars %>% dplyr::mutate(cyl = as.factor(cyl)) ,
               features = c("cyl", "mpg"))
  vdiffr::expect_doppelganger("Single numeric single categorical", p3)

  p4 <-
    histograms(
      mtcars %>% dplyr::mutate(cyl = as.factor(cyl), gear = as.factor(gear)) ,
      features = c("cyl", "mpg", "gear")
    )
  vdiffr::expect_doppelganger("Single numeric two categorical", p4)

  p5 <-
    histograms(
      mtcars %>% dplyr::mutate(cyl = as.factor(cyl), gear = as.factor(gear)) ,
      features = c("cyl","gear")
    )
  vdiffr::expect_doppelganger("Two categorical", p4)

})

