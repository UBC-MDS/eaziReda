context("Missing Impute")

# Creating test inputs for the test function

test_df <- data.frame(a =c(1, NA, 2, 3), b= c('x', 'y', NA, 'y'))

expect_output_default <- tibble::tibble(a = c(1, 2, 2, 3), b = c('x', 'y', 'y', 'y'))

expect_output_drop_2 <- tibble::tibble(a = c(1, 3), b = c('x', 'y'))

expect_output_drop_1 <- tibble::tibble(a = c(1, 2, 3), b = c('x', 'x', 'y'))

expect_output_drop_1b <- tibble::tibble(a = c(1, 2, 3), b = c('x', 'y', 'y'))

test_that('missing_impute should return a tibble', {
  expect_s3_class(missing_impute(test_df), "data.frame")
})

# Tests
test_that("missing_impute work with toy data", {
  
  # test default arguments
  expect_equal(missing_impute(test_df), expect_output_default, ignore_attr = TRUE)
  
  # test arguments method_num = "drop" and method_non_num = "drop"
  expect_equal(missing_impute(test_df, "drop", "drop"), expect_output_drop_2, ignore_attr = TRUE)
  
  # test arguments method_num = "drop" and method_non_num = "most_frequent"
  expect_equal(missing_impute(test_df, "drop"), expect_output_drop_1, ignore_attr = TRUE)
  
  # test arguments method_num = "median" and method_non_num = "most_frequent"
  expect_equal(missing_impute(test_df, "median"), expect_output_default, ignore_attr = TRUE)
  
  # test arguments method_num = "median" and method_non_num = "drop"
  expect_equal(missing_impute(test_df, "median", "drop"), expect_output_drop_1b, ignore_attr = TRUE)
  
  # test arguments method_num = "mean" and method_non_num = "drop"
  expect_equal(missing_impute(test_df, "mean", "drop"), expect_output_drop_1b, ignore_attr = TRUE)
  
})

test_that("missing_detect should throw an error if the input data is not a dataframe", {
  expect_error(missing_impute("a"))
  expect_error(missing_impute(1))
  expect_error(missing_impute(list(1)))
})

test_that("missing_detect should throw an error if the input method is not an option", {
  expect_error(missing_impute(test_df, method_num ="a"))
  expect_error(missing_impute(test_df, method_num = 1))
  expect_error(missing_impute(test_df, method_num = "mean", method_non_num = "most"))
  expect_error(missing_impute(test_df, method_num = "mean", method_non_num = 2))
})


