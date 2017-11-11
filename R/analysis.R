#==============================================================================#
#                              Analysis Functions                              #
#==============================================================================#

#------------------------------------------------------------------------------#
#                   Get Summary Stats for Quantitative Variable                #
#------------------------------------------------------------------------------#
#' getSummaryStats
#'
#' \code{getSummaryStats} Provides summary stats for quantitative variable
#'
#' @param data Data frame or vector containing a single quantitative variable
#' @param xLab Character string containing the name of the variable or categorical level
#'
#' @returns Data frame containing summary statistics
#' @author John James, \email{jjames@@datasciencesalon.org}
#' @family analysis functions
#' @export
getSummaryStats <- function(data, xLab = NULL) {

  df <- data.frame(Min = round(min(data[[1]]), 1),
                   Q1 = round(quantile(data[[1]], 0.25), 1),
                   Median = round(median(data[[1]]), 1),
                   Mean = round(mean(data[[1]]), 1),
                   Q3 = round(quantile(data[[1]], 0.75), 1),
                   Max = round(max(data[[1]]), 1),
                   `NA's` = sum(is.na(data[[1]])),
                   SD = round(sd(data[[1]]), 2),
                   IQR = round(quantile(data[[1]], 0.75) - quantile(data[[1]], 0.25) , 1),
                   Kurtosis = e1071::kurtosis(data[[1]]),
                   Skewness = e1071::skewness(data[[1]]),
                   row.names = NULL)

  # If x is present, add to data frame as first column
  if (!is.null(xLab)) {
    g <- data.frame(Group = xLab)
    df <- cbind(g, df)
  }

  return(df)

}