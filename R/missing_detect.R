#' Check missing values in dataframe
#'
#' @description Return the number/percentage of missing values for each column in the dataframe
#'
#' @param data Input dataframe to checked with missing values
#'
#' @return dataframe containing two columns: the number of missing values and
#' the percentage of missing values for each column
#' @export
#'
#' @examples
#' missing_detect(mtcars)
missing_detect <- function(data){
  
  # check the if the input is a dataframe object
  if (!is.data.frame(data)) {
    stop("data must be a data.frame like object")
  }
  missing_count <- sapply(data, function(x) sum(is.na(x)))
  missing_percent <- missing_count / nrow(data)
  missing_df <- tibble::tibble(column = names(missing_count), n_missing = missing_count, percent = missing_percent)
  missing_df
}
