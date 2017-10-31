#' Filter for primers with double meltcurve peaks
#'
#' Selects all observations that show more than one melt curve peak
#' @param df qpcr df
#' @return Tibble
#' @export
list_double_meltcurves <- function(df, CT) {
df %>%
  arrange(Gene) %>%
  select_(CT, "Tm1", "Tm2") %>%
  filter(!is.na(Tm2))
}
