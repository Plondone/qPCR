#' Set minimum and maximum CT value
#'
#' Changes out of range CT values to minimum or maximum number
#' @param df Dataframe with raw CT values and column specifiying housekeeping genes
#' @param min Minimum CT value
#' @param max Maximum CT value
#' @return qpcr dataframe
#' @export
set_min_max_CT <- function(df, CT = "CT", min = 10, max = 40) {
  df[[CT]][is.na(df[[CT]])] <- max
  df[[CT]][df[[CT]] > max] <- max
  df[[CT]][df[[CT]] < min] <- NA
  df
}
