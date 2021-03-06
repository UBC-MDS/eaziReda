#' A function that generates a correlation plot for a list of features in a given data frame.
#'
#' @param data The input data frame for plotting.
#' @param features A vector of characters that represents the features names. By default, NULL (returns plot of all numeric features).
#' @param method The correlation method that includes: 'pearson', 'spearman' or 'kendall'. By default 'pearson'.
#'
#' @return ggplot object, a correlation plot that illustrates the correlation between numeric features interactively.
#' @export
#
#' @importFrom stats cor median quantile
#' @importFrom utils tail
#' @importFrom rlang .data
#'
#' @examples
#' data <- data.frame('Title' =
#' (c("Finding Nemo", "Dunkirk", "Denial")),
#'  'vote_average' = (c(3.86, 4.11, 3.62)),
#'   'vote_count'= (c(33887, 282, 68)), 'vote_std'= (c(0.87, 0.78, 0.82)))
#' numerical_features <- c('vote_average','vote_count','vote_std')
#'
#' corr_plot(data, features = numerical_features, method = 'spearman')
#'
corr_plot <- function(data, features = NULL, method='pearson'){

  # Tests whether input data is of data.frame type
  if (!is.data.frame(data)) {
    stop("Please pass in a data.frame for 'data'")
  }

  # Tests whether input features is a vector
  if((!is.vector(features) | !is.character(features)) & (!is.null(features))){
    stop("Please pass in a vector for 'features'")
  }

  # Tests whether input data has at least two numeric features
  if (dplyr::select_if(data, is.numeric) %>% ncol() < 2) {
    stop("'data' needs at least two numeric features")
  }

  # Tests whether all columns in features exist in the data
  for (c in features){
    if (!(c %in% colnames(data))){
      stop("Please pass in features with column names in the data")
    }
  }

  # Tests whether input method is of class character
  if(!is.character(method)){
    stop("Please pass in a character for 'method'")
  }

  # Tests whether input method is one of the 3 available options
  if(!(method %in% c("pearson", "spearman", "kendall"))){
    stop("Please pick a correlation method: 'pearson', 'spearman' or 'kendall'")
  }

  #Subsetting the dataframe
  numeric_df <- dplyr::select_if(data, is.numeric)
  if (length(features) > 0) {
    numeric_df <- numeric_df %>% dplyr::select(dplyr::all_of(features))
  }

  # Creating corr_df dataframe
  corr_df <- as.data.frame(cor(numeric_df, method = "pearson", use = "complete.obs"))
  corr_df <- corr_df %>%
    dplyr::mutate("x" = (corr_df %>% rownames())) %>%
    tidyr::pivot_longer(names_to = "y", values_to = "corr_value", cols = tidyselect::vars_select_helpers$where(is.numeric))

  
  # Correlation plot
  corr_plot <- (ggplot2::ggplot(data = corr_df,
                                ggplot2::aes(x = .data$x, y = .data$y, fill = .data$corr_value)) +
                  ggplot2::geom_tile(alpha=0.5) +
                  ggplot2::labs(x = "Numerical Features",
                                y = "Numerical Features",
                                fill = "Correlation",
                                title = "Correlations Plot for Numerical Features") +
                  ggplot2::scale_fill_distiller(limits = c(-1,1),
                                                direction = 1,) +
                  ggplot2::geom_text(ggplot2::aes(label = round(.data$corr_value, 3)), size = 4) +
                  ggplot2::theme(panel.grid.major = ggplot2::element_blank(),
                                 panel.grid.minor = ggplot2::element_blank(),
                                 plot.title = ggplot2::element_text(size=20,
                                                           margin = ggplot2::margin(10, 0, 10, 0)),
                                 text =  ggplot2::element_text(size = 16))

  )

  corr_plot
}
