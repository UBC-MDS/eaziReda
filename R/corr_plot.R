#' A function that generates a correlation plot for a list of features in a given data frame.
#'
#' @param data The input data frame for plotting.
#' @param features A vector of strings that represents the features names. By default, NULL (returns plot of all numeric features).
#' @param method The correlation method that includes: 'pearson', 'spearman' or 'kendall'. By default 'pearson'.
#' @param plot_width The width of the output plot. By default 500.
#' @param plot_height The height of the output plot. By default 400.
#'
#' @return ggplot object, a correlation plot that illustrates the correlation between numeric features interactively.
#' @export
#'
#' @examples
#' data <- data.frame('Title' = (c("Finding Nemo", "Dunkirk", "Denial")), 'vote_average' = (c(3.86, 4.11, 3.62)), 'vote_count'= (c(33887, 282, 68)), 'vote_std'= (c(0.87, 0.78, 0.82)))
#' numerical_features <- c('vote_average','vote_count','vote_std')
#'
#' corr_plot(data, features = numerical_features, method = 'spearman')
#'
corr_plot <- function(data, features = NULL, method='pearson', plot_width=500, plot_height=400,){

  NULL
}
