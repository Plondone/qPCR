#' Plot QC graphs
#'
#' Plot quality control graphs on housekeeping genes
#' @param df hkg df
#' @return QC plots
#' @export
qc_hkg <- function(df) {
  a <- df %>%
    ggplot(aes(Sample, CT)) +
    geom_point() +
    facet_wrap(~Primer) +
    theme(axis.text.x = element_text(angle = 90)) +
    ggtitle("CT values HKG")
  print(a)

  b <- df %>%
    ggplot(aes(CT))+
    geom_histogram(binwidth = 1) +
    facet_wrap(~Primer) +
    theme(axis.text.x = element_text(angle = 90)) +
    ggtitle("CT values HKG")
  print(b)

  c <-  df %>%
    ggplot(aes(Primer, CT)) +
    geom_boxplot(outlier.shape = NA) +
    geom_jitter()
  ggtitle("CT values HKG")
  print(c)
}
