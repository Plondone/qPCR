#' Remove blanc
#'
#' Changes CT values of a sample to NA
#' @param df qpcr file
#' @return qpcr dataframe
#' @export
remove_sample <- function(df) {
  df <- df %>%
    filter(Blanc != "Y")
}
