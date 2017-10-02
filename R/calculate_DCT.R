#' Caclulate Delta CT
#'
#' Merges hkg with qpcr df, removes samples with bad hkg CT levels and calculates Delta CT
#' @param df.endog endog df
#' @param df.hkg hkg df
#' @param cols Column names to transfer to DCT df
#' @return DCT df
#' @export
calculate_DCT <- function(df.endog, df.hkg, cols) {
  endog <- df.endog %>%
    select(Primer, CT, Sample, cols) %>%
    group_by(Sample) %>%
    left_join(df.hkg, by = "Sample") %>%
    mutate(CT = replace(CT, is.na(CT_avg_hkg), NA)) %>%
    mutate(DCt = CT_avg_hkg - CT) %>%
    mutate(rel_expr = 2^DCt) %>%
    arrange(Primer)
  assign('endog', endog, envir = .GlobalEnv)
}
