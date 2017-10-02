#' Remove outliers
#'
#' Change value of outliers to NA
#' @param x Vector
#' @param na.rm a logical value indicating whether NA values should be stripped before the computation proceeds.
#' @return vector without outliers
#' @export
remove_outliers <- function(x, na.rm = TRUE, ...) {
  qnt <- quantile(x, probs = c(.25, .75), na.rm = na.rm, ...)
  H <- 1.5 * IQR(x, na.rm = na.rm)
  y <- x
  y[x < (qnt[1] - H)] <- NA
  y[x > (qnt[2] + H)] <- NA
  y
}
