context("Missing Detect")

# Creating test inputs for the test function

test_df <- data.frame(a =c(1, NA, 2, 3), b= c('x', 'y', NA, 'y'))

expect_output <- tibble::tibble(column = c('a', 'b'), n_missing = c(1, 1), percent =c(0.25, 0.25))

test_that('missing_detect should return a tibble', {
  expect_s3_class(missing_detect(test_df), "data.frame")
})


test_that("missing_detect work with toy data", {
  
  expect_equal(missing_detect(test_df), expect_output,ignore_attr = TRUE)
})

test_that("missing_detect should throw an error if the input is not a dataframe", {
  expect_error(missing_detect("a"))
  expect_error(missing_detect(1))
  expect_error(missing_detect(list(1)))
})


