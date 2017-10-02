#' Set minimum and maximum CT value
#'
#' Changes out of range CT values to minimum or maximum number
#' @param min Minimum CT value
#' @param max Maximum CT value
#' @return qpcr dataframe
#' @export
set_CT_min_max <- function(min = 10, max = 40) {
  qpcr$CT[qpcr$CT < min] <- NA
  qpcr$CT[is.na(qpcr$CT)] <- max
  qpcr$CT[qpcr$CT > max] <- max
  assign('qpcr', qpcr, envir=.GlobalEnv)
}
