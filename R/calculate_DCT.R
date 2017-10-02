#' Caclulate Delta CT
#'
#' Merges hkg with qpcr df, removes samples with bad hkg CT levels and calculates Delta CT
#' @param df hkg df
#' @param cols Column names to transfer to DCT df
#' @return DCT df
#' @export
calculate_DCT <- function(df, cols) {
  DCT <- df %>%
    filter(HKG == FALSE) %>%
    select(Primer, CT, Sample, cols) %>%
    group_by(Sample) %>%
    left_join(mean_hkg, by = "Sample")

  DCT$CT[is.na(DCT$CT_avg_hkg)] <- NA #change all samples with bad hkg CT values to NA

  DCT <- DCT %>%
    mutate(DCt = CT_avg_hkg - CT) %>%
    arrange(Primer)
  assign('DCT', DCT, envir = .GlobalEnv)
}
