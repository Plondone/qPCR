#' Plot QC graphs
#'
#' Plot quality control graphs on housekeeping genes
#' @param df hkg df
#' @return QC plots
#' @export
qc_hkg <- function(df) {
  b <- df %>%
    ggplot(aes(CT))+
    geom_histogram(binwidth = 1) +
    facet_wrap(~Gene) +
    theme(axis.text.x = element_text(angle = 90)) +
    ggtitle("CT values HKG")
  print(b)
}
