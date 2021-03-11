#' Plot exploratory visual of histograms/bar chart by feature
#'
#' @description Will plot histograms for numerical features, bar charts for categorical.
#'
#' @param data data.frame like object to plot histograms/bar charts
#' @param features Which features from `data` to plot as a character vector
#' @param num_cols Number of columns in facetted chart produced
#'
#' @return ggplot2 object
#' @export
#'
#' @examples
#' histograms(mtcars, features=c("mpg","cyl"))
histograms <-
  function(data,
           features,
           num_cols = 2) {

    if (!is.data.frame(data)) {
      stop("data must be a data.frame like object")
    }
    else if (sum(features %in% names(data)) != length(features)) {
      stop("all features must be in data")
    }
    else if (num_cols %% 1 != 0) {
      stop("num_cols must be round number")
    }

    numeric <- data %>%
      dplyr::select(where(is.numeric)) %>%
      dplyr::select(dplyr::any_of(features))

    categorical <- data %>%
      dplyr::select(!where(is.numeric)) %>%
      dplyr::select(dplyr::any_of(features))

    # Check if no numeric or categorical features to worry about.
    # Return empty plot object if none identified and scale other chart to use full area.
    if (length(numeric) == 0) {
      numeric_plot <- ggplot2::ggplot()
      numeric_height <- 0
    } else {
      numeric_plot <- numeric %>%
        tidyr::pivot_longer(dplyr::everything()) %>%
        ggplot2::ggplot(ggplot2::aes(x = value)) +
        ggplot2::geom_histogram(fill='darkblue') +
        ggplot2::facet_wrap( ~ name, ncol=num_cols, scales='free') +
        ggplot2::labs(title = "Histograms of Feature Values for Numerical Features")
      numeric_height <- 1
    }

    if (length(categorical) == 0) {
      categorical_plot <- ggplot2::ggplot()
      categorical_height <- 0
    } else {
      categorical_plot <- categorical %>%
        tidyr::pivot_longer(dplyr::everything()) %>%
        ggplot2::ggplot(ggplot2::aes(x = value)) +
        ggplot2::geom_bar(fill='darkblue') +
        ggplot2::facet_wrap( ~ name, ncol=num_cols,scales='free') +
        ggplot2::labs(title = "Counts of Feature Values for Categorical Features")
      categorical_height <- 1
    }

    cowplot::plot_grid(
      numeric_plot,
      categorical_plot,
      rel_heights = c(numeric_height, categorical_height),
      nrow = 2
    )

  }


# test_plot <- mtcars_tib %>%
#   # dplyr::mutate(cyl = as.factor(cyl)) %>%
#   tidyr::pivot_longer(everything()) %>%
#   ggplot2::ggplot(ggplot2::aes(x = value, fill = name)) +
#   ggplot2::geom_histogram() +
#   ggplot2::facet_wrap( ~ name, scales = 'free')
