
<!-- README.md is generated from README.Rmd. Please edit that file -->

# eaziReda

<!-- badges: start -->
<!-- badges: end -->

Almost every data analysis project involves the process of doing some
exploratory data analysis(EDA) and data preprocessing. Usually they
serve as a very crucial and inevitable step in a data analysis workflow.
There are some very common tasks in EDA, which can include:

-   checking missing values
-   detecting outliers
-   ploting correlation plots between features
-   ploting histograms/bar plots for each individual features

Typically these steps are followed by some preprocesing like imputation
and dealing with outliers. All of those steps together may require lots
of coding effort and can be repeated for several projects. To solve this
issue, we designed the R package `eaziReda` that wraps all of those
lines of code into four convenient functions that will allow you to
quickly and easily carry out EDA along with some simple preprocessing
using just four lines of code!


## Installation

You can install the development version from
[GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("dbandrews/eaziReda")

## Features


1.  `missing_impute`: This function will take in a dataframe and
    generate a table listing the number of missing values and the
    percentage of missing values for each column. It also gives the user
    an option of doing some simple imputations on the entire dataframe
    in place. The imputation methods can also be customized by the user.
2.  `outliers_detect` : This function will take in a pandas series and
    will return a series containing all outliers given by certain method
    that the users can customize. It also gives the user an option to
    remove all the outliers in place.
3.  `corr_plot`: This function will take in a dataframe and a list of
    feature names to generate a correlation plot for the given list of
    features.
4.  `histograms`: This function will take in a dataframe and a list of
    feature names to generates histograms for numeric features and bar
    plots for categorical features

## Dependencies

## Code of Conduct

Please note that the eaziReda project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## Features

1.  `missing_detect`: This function will take in a dataframe and generate a table listing the number of missing values and the percentage of missing values for each column. 
2.  `missing_impute`: This function will take in a dataframe and genereate a imputated dataframe based on some simple imputation method. The imputation methods can also be customized by the user.
3.  `outliers_detect` : This function will take in a pandas series and will return a boolean numpy array containing all the indices of outliers as `True`, given by certain method that the users can customize.
4.  `corr_plot`: This function will take in a dataframe and a list of feature names to generate a correlation plot for the given list of features.
5.  `categorical_histograms`: This function will take in a dataframe and a list of feature names to generates histograms for numeric features and bar plots for categorical features
6.  `histograms`: This function will take in a dataframe and a list of feature names to generates histograms for numeric features and bar plots for categorical features

## Dependencies

## Contributors

We welcome and recognize all contributions.

|  	 Core contributor| Github.com username| 
|---------|---|
|  Vignesh Lakshmi Rajakumar |  @vigneshrajakumar| 
|   Dustin Andrews|  @dbandrews| 
|  Arash Shamseddini | @arashshams| 
|  Yuyan Guo | @yuyanguo| 
