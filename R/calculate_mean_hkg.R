#' Calculate mean housekeeping genes
#'
#' Calculate the average CT value over housekeeping genes
#' @param df hkg df
#' @return mean_hkg df
#' @export
calculate_mean_hkg <- function(df) {
  hkg %>%
    group_by(Sample) %>%
    summarise(CT_avg_hkg = mean(CT, na.rm = TRUE))#select housekeeping genes and tidy file per sample
}
