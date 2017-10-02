#' Remove observations with bad meltcurves
#'
#' Changes CT values of observations with more than one meltcurve to NA
#' @export
remove_bad_meltcurves <- function() {
  endog$CT[!is.na(endog$Tm2)] <- NA
  assign('endog', endog, envir = .GlobalEnv)
}
