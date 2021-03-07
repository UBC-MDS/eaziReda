#' Detect outliers in the given vector
#'
#' @param s vector that contains the data to detect outliers in
#' @param method method to detect outliers. One of 'zscore', 'iqr', 'iforest'
#'
#' @return boolean vecotr with indices makerd true for the outliers
#' @export
#'
#' @examples
#' outliers_detect(c(1,2,1,2,100))
outliers_detect <- function(s, method='zscore') {

}


#' Remove outliers
#'
#' @param s vecotr with the data to delete outliers from
#' @param outliers boolean vector with outliers marked true
#'
#' @return vector with outliers deleted
#' @export
#'
#' @examples
#' remove_outliers(c(1,2,100), c(F,F,T))
remove_outliers <- function(s, outliers) {

}
