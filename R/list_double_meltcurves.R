#' Filter for primers with double meltcurve peaks
#'
#' Selects all observations that show more than one melt curve peak
#' @param df qpcr df
#' @return Tibble
#' @export
list_double_meltcurves <- function(df) {
df %>%
  arrange(Primer) %>%
  select(Primer, CT, Tm1, Tm2, Tm3) %>%
  filter(!is.na(Tm2))
}
