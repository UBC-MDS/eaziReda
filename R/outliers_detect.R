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

  if(!is.numeric(s)) {
    stop("s has to be a numeric vector")
  }

  if(length(s) < 2) {
    stop("s must have a length of atleast 2")
  }

  outliers <- NA

  if (method == "zscore") {
    outliers <- outliers_detect_zscore(s)
  } else if (method == "iqr") {
    outliers <- outliers_detect_iqr(s)
  } else if (method == "iforest") {
    outliers <- outliers_detect_iforest(s)
  } else {
    stop("Invalid method. Should be ascore, iqr or iforest")
  }

  outliers
}


#' Detects outliers in a data.frame/tibble using isolation forests
#'
#' @param s numeric vector for which the outliers need to be found
#' @param threshold threshold for considering an outlier
#'
#' @return boolean vector with indices makerd true for the outliers
#' @export
#'
#' @examples
#' outliers_detect_iforest(c(1,1,1,1,1,1,1,1,1,1,1e14))
outliers_detect_iforest <- function(s, threshold = 0.5) {
  mdl <- isotree::isolation.forest(as.data.frame(s), output_score = T)

  mdl$scores > threshold
}


#' Detects outliers in a data.frame/tibble using inter-quantile ranges
#'
#' @param s numeric vector for which the outliers need to be found
#' @param threshold iqr factor used for outliers
#'
#' @return boolean vector with indices makerd true for the outliers
#' @export
#'
#' @examples
#' outliers_detect_iqr(c(1,1,1,1,1,1,1,1,1,1,1e14))
outliers_detect_iqr <- function(s, threshold=1.5) {
  q1 <- unname(quantile(s, 0.25))
  q3 <- unname(quantile(s, 0.75))

  iqr <- q3 - q1

  (s < (q1 - threshold*iqr)) | (s > (q3 + threshold*iqr))
}

#' Detects outliers in a data.frame/tibble using zscores
#'
#' @param s numeric vector for which the outliers need to be found
#' @param threshold zscore threshold used for outliers
#'
#' @return boolean vector with indices makerd true for the outliers
#' @export
#'
#' @examples
#' outliers_detect_zscore(c(1,1,1,1,1,1,1,1,1,1,1e14))
outliers_detect_zscore <- function(s, threshold=3) {
  z <- scale(s)[,1]
  z > threshold
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

  if(!is.logical(outliers)) {
    stop("outliers should be a logical vector")
  }

  if(length(outliers) != length(s)) {
    stop("outliers and s should have the same length")
  }

  s[outliers]
}
