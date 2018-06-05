#' Perform t-test
#'
#' Performs t-test on Delta CT values of selected group and gene
#' @param df endog dataframe
#' @param gene Gene to perform t-test on
#' @param group Group variable between which the test should be performed
#' @return p value
#' @export
stat_t_test <- function(df = endog, gene, group) {
  temp <- df %>%
    dplyr::filter(Gene == gene)
  t.test(temp[["DCt"]] ~ temp[[group]])$p.value
}
