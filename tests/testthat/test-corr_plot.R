# Creating test inputs for the test function
data_test1 <- data.frame('Title' =
                           (c("Finding Nemo", "Dunkirk", "Denial")),
                         'vote_average' = (c(3.86, 4.11, 3.62)),
                         'vote_count'= (c(33887, 282, 68)), 'vote_std'= (c(0.87, 0.78, 0.82)))

data_test2 <- as.character(data_test1)

data_test3 <- data.frame('Title' =
                           (c("Finding Nemo", "Dunkirk", "Denial")))


features_test1 <- c('vote_average','vote_count','vote_std')

features_test2 <- c('Title')

features_test3 <- c('Title','vote_count','vote_std')

features_test4 <- 'vote_average'

features_test5 <- c('vote_averag')

plot_test <- corr_plot(data_test1, features = NULL, method='pearson')


# Testing the inputs

# Tests whether input data is of type data.frame
test_that("The input 'data' must be of type data.frame", {
  expect_error(corr_plot(data_test2))
})

# Tests whether input features is a vector
test_that("The input 'features' must be a vector", {
  expect_error(corr_plot(data_test1, c(1,2,3)))
})

# Tests whether input data has at least two numeric features
test_that("The input 'data' must have at least two numeric features", {
  expect_error(corr_plot(data_test3, features_test5))
})

# Tests whether all columns in features exist in the data
test_that("The given column names must be in the input 'data'", {
  expect_error(corr_plot(data_test1, c('vote')))
})

# Tests whether input method is of class character
test_that("The input 'method' must be a character", {
  expect_error(corr_plot(data_test1, features_test1, method = c(5)))
})

# Tests whether input method is one of the 3 available options
test_that("The input 'method' must be either 'pearson', 'spearman' or 'kendall'", {
  expect_error(corr_plot(data_test1, features_test1,'laplace'))
})


# Testing the outputs

# Tests whether output plot is a ggplot object
test_that("The output plot must be of 'ggplot' type",{
  expect_true(ggplot2::is.ggplot(plot_test))
})

# Tests whether output plot is geom_tile
test_that("The output plot must have 'geom_tile' mark", {
  expect_equal(class(corr_plot(data_test1)$layers[[1]]$geom)[1], "GeomTile")
})

# Tests whether output plot correlation is in the range (-1, 1)
test_that("The output plot correlation values must be in the range (-1, 1)", {
  expect_equal(corr_plot(data_test1)$scales$scales[[1]]$limits[1], -1)
  expect_equal(corr_plot(data_test1)$scales$scales[[1]]$limits[2], 1)

})
