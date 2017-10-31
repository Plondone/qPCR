#' Remove a specific sample
#'
#' Changes CT values of a sample to NA
#' @param df qpcr file
#' @param sample_name Name of sample to remove
#' @return qpcr dataframe
#' @export
remove_sample <- function(df, sample_name) {
  df <- df %>%
    filter(Sample != sample_name)
}
