#' Filter for a sample number
#'
#' Outputs a tibble with information about this specific sample
#' @param df qpcr file
#' @param sample_name Name of sample to filter
#' @return Tibble
#' @export
filter_sample <- function(df, sample_name) {
  df %>%
    filter(Sample == sample_name)
}
