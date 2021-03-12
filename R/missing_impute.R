#' Return the imputed version of data based on the methods selected
#'
#' @param data Input dataframe to apply imputation
#' @param method_num The method used for imputing numerical missing values
#' @param method_non_num The method used for imputing non-numerical missing values
#'
#' @return dataframe with imputations applied
#' @export
#'
#' @examples
#' missing_impute(mtcars)
missing_impute <- function(data, method_num = "mean", method_non_num = "most_frequent") {
  
  # check the if the input is a dataframe object
  if (!is.data.frame(data)) {
    stop("data must be a data.frame like object")
  }
  # check the if the input method_num is one of the option
  if (!is.element(method_num, c('drop', 'mean', 'median'))) {
    stop("Please enter one the following option: 'drop', 'mean', 'median'")
  }
  
  # check the if the input method_non_num is one of the option
  if (!is.element(method_non_num, c('drop', 'most_frequent'))) {
    stop("Please enter one the following option: 'drop', 'most_frequent'")
  }
  
  # filter out the numeric columns
  num_df <- data %>% 
    dplyr::select_if(is.numeric)
  num_columns <- colnames(num_df)
  # filter out the non-numeric columns
  non_num_df <- data %>% 
    dplyr::select_if(purrr::negate(is.numeric))
  non_num_columns <- colnames(non_num_df)
  
  # create a copy of the dataframe
  data_imp <- data.table::copy(data)
  
  # impute numerical columns
  if (method_num == "drop") {
    data_imp <- tidyr::drop_na(data_imp, tidyselect::all_of(num_columns))
  }
  else if (method_num == "mean") {
    for(col in num_columns) {
      data_imp[col]  <-  lapply(data_imp[col], function(x) { 
        x[is.na(x)] <- mean(x, na.rm = TRUE)
        x})
    }
  }
  else if (method_num == "median") {
    for(col in num_columns) {
      data_imp[col]  <-  lapply(data_imp[col], function(x) { 
        x[is.na(x)] <- median(x, na.rm = TRUE)
        x})
    }
  }
  
  if (method_non_num == "drop") {
    data_imp <- tidyr::drop_na(data_imp, tidyselect::all_of(non_num_columns))
  } else {
    for(col in non_num_columns) {
    most_freq <- tail(names(sort(table(daf[[col]]))), 1)
    data_imp[col]  <-  lapply(data_imp[col], function(x) { 
      x[is.na(x)] <- most_freq
      x})
    }
  }
  data_imp
}
