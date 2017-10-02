#' Split genes
#'
#' Split data into endogenous genes and housekeeping genes
#' @param df qpcr df
#' @return endog Dataframe with only CT values from endogenous genes
#' @return hkg Dataframe with only CT values from housekeeping genes
#' @export
split_genes <- function(df) {
  hkg <- df %>%
    filter(HKG == TRUE) %>%
    select(Primer, CT, Sample)
  assign('hkg', hkg, envir = .GlobalEnv)
  endog <- df %>%
    filter(HKG == FALSE)
  assign('endog', endog, envir = .GlobalEnv)
}
