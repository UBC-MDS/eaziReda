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
missing_impute <- function(data, method_num="mean", method_non_num="most_frequent"){

}
