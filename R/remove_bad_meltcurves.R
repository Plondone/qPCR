#' Remove observations with bad meltcurves
#'
#' Changes CT values of observations with more than one meltcurve to NA
#' @return qpcr df
#' @export
remove_bad_meltcurves <- function() {
  qpcr$CT[!is.na(qpcr$Tm2)] <- NA
  assign('qpcr', qpcr, envir=.GlobalEnv)
}
