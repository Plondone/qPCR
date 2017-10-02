#' Remove observations with bad meltcurves
#'
#' Changes CT values of observations with more than one meltcurve to NA
#' @return df
#' @export
remove_bad_meltcurves <- function() {
  endog <- df
  endog$CT[!is.na(endog$Tm2)] <- NA
}
