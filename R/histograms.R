#' Plot exploratory visual of histograms/boxplot by feature
#'
#' @description Will plot histograms for numerical features, box plots for categorical.
#'
#' @param data Data to plot
#' @param features Which features from `data` to plot as a character vector
#' @param plot_width Width of the plot produced in pixels
#' @param plot_height Height of the plot produced in pixels
#'
#' @return ggplot2 object
#' @export
#'
#' @examples
#' histograms(mtcars, features=c("mpg","cyl"), plot_width=600, plot_height=400)
histograms <- function(data, features, plot_width=600, plot_height=400){

}
