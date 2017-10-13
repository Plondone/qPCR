#' Set minimum and maximum CT value
#'
#' Changes out of range CT values to minimum or maximum number
#' @param df Dataframe with raw CT values and column specifiying housekeeping genes
#' @param min Minimum CT value
#' @param max Maximum CT value
#' @return qpcr dataframe
#' @export
set_min_max_CT_endog <- function(min = 10, max = 40) {
  qpcr$CT[qpcr$CT < min] <- NA
  qpcr$CT[is.na(qpcr$CT)] <- max
  qpcr$CT[qpcr$CT > max] <- max
  assign('qpcr', qpcr, envir=.GlobalEnv)
}
