#' Take the geometric average
#'
#' Calculates the geometric average over a vector
#' @param a vector
#' @param na.rm a logical value indicating whether NA values should be stripped before the computation proceeds.
#' @return Geometric average
#' @export
gm_mean <- function(a, na.rm = TRUE){
  b <- !is.na(a)
  prod(a, na.rm = na.rm)^(1/sum(b))
}
