
<!-- README.md is generated from README.Rmd. Please edit that file -->

# eaziReda

<!-- badges: start -->

[![R-CMD-check](https://github.com/UBC-MDS/eaziReda/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/eaziReda/actions)[![codecov](https://codecov.io/gh/UBC-MDS/eaziReda/branch/master/graph/badge.svg)](https://codecov.io/gh/UBC-MDS/eaziReda)
<!-- badges: end -->

Almost every data analysis project involves the process of doing some
exploratory data analysis(EDA) and data preprocessing. Usually they
serve as a very crucial and inevitable step in a data analysis workflow.
There are some very common tasks in EDA, which can include:

-   checking for missing values
-   detecting outliers
-   plotting correlation plots between features
-   plotting histograms/bar plots for each individual features

Typically these steps are followed by some preprocessing like imputation
and dealing with outliers. All of those steps together may require lots
of coding effort and can be repeated for several projects. To solve this
issue, we designed the R package eaziReda that wraps all of those lines
of code into four convenient functions that will allow you to quickly
and easily carry out EDA along with some simple preprocessing using just
a few lines of code!

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("https://github.com/UBC-MDS/eaziReda.git")

## Documentation & Usage

Documentation and usage examples for `eaziReda` can be found
[here](https://ubc-mds.github.io/eaziReda/).

## Features

1.  `missing_impute`: This function will take in a dataframe and
    generate a table listing the number of missing values and the
    percentage of missing values for each column. It also gives the user
    an option of doing some simple imputations on the entire dataframe
    in place. The imputation methods can also be customized by the user.
2.  `outliers_detect` : This function will take in a vector and will
    return a boolean vector with outliers marked given by certain method
    that the users can customize. It also gives the user an option to
    remove all the outliers in place.
3.  `corr_plot`: This function will take in a dataframe and a list of
    feature names to generate a correlation plot for the given list of
    features.
4.  `histograms`: This function will take in a dataframe and a list of
    feature names to generates histograms for numeric features and bar
    plots for categorical features
5.  `remove_outliers`: This function will remove the outliers from the
    given vector based on a second vector that has the outliers’ indices
    marked

## Similar Work

While there aren’t a ton of packages in R that do *only* EDA, quite a
few of them include it as a secondary functionality. Here are a few
packages that we found that do something similar:

-   [SmartEDA](https://cran.r-project.org/web/packages/SmartEDA/vignettes/SmartEDA.html)
    -   SmartEDA includes multiple custom functions to perform initial
        exploratory analysis on any input data describing the structure
        and the relationships present in the data.
-   [dlookr](https://cran.r-project.org/web/packages/dlookr/index.html)
    -   A collection of tools that support data diagnosis, exploration,
        and transformation. Data diagnostics provides information and
        visualization of missing values and outliers and unique and
        negative values to help you understand the distribution and
        quality of your data.
-   [DataExplorer](https://www.rdocumentation.org/packages/DataExplorer/versions/0.8.1)
    -   Automated data exploration process for analytic tasks and
        predictive modeling, so that users could focus on understanding
        data and extracting insights.

## Code of Conduct

Please note that the eaziReda project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## Contributors

We welcome and recognize all contributions.

| Core contributor          | Github.com username |
|---------------------------|---------------------|
| Vignesh Lakshmi Rajakumar | @vigneshrajakumar   |
| Dustin Andrews            | @dbandrews          |
| Arash Shamseddini         | @arashshams         |
| Yuyan Guo                 | @yuyanguo           |
