#' Set minimum and maximum CT value
#'
#' Changes out of range CT values to minimum or maximum number
#' @param df Dataframe with raw CT values and column specifiying housekeeping genes
#' @param min Minimum CT value
#' @param max Maximum CT value
#' @return qpcr dataframe
#' @export
set_min_max_CT_endog <- function(min = 10, max = 40) {
  endog$CT[endog$CT < min] <- NA
  endog$CT[is.na(endog$CT)] <- max
  endog$CT[endog$CT > max] <- max
  assign('endog', endog, envir=.GlobalEnv)
}
