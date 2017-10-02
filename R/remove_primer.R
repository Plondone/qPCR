#' Remove primer
#'
#' Remove bad primers
#' @param df Dataframe
#' @return df with primer removed
#' @export
remove_primer <- function(df, primer_name) {
  df <- df %>%
    filter(Primer != primer_name)
}
