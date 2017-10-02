#' Make file with only housekeeping genes
#'
#' Filters out housekeeping genes
#' @param df qpcr df
#' @return hkg df
#' @export
make_hkg <- function(df) {
  hkg <- df %>%
    filter(HKG == TRUE) %>%
    select(Primer, CT, Sample)
  assign('hkg', hkg, envir = .GlobalEnv)
}
