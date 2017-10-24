#' Merge and clean data
#'
#' Merges data and annotation files together and changes the columns in the right types
#' @param df qpcr file
#' @param df.a Samples annotation file
#' @param df.b Genes annotation file
#' @param by.a column to join annotation samples
#' @param by.b column to join gene samples
#' @return A tidy and clean dataframe
#' @export
join_and_clean_qpcr <- function(df = qpcr, df.a = ann_samples, df.b = ann_genes, by.a = "Sample", by.b = "Primer") {
  df <- df %>%
    left_join(df.a, by = by.a) %>%
    left_join(df.b, by = by.b)
  df[ ,colnames(ann_samples)] <- lapply(df[ ,colnames(ann_samples)], factor)
  df[ ,colnames(ann_genes)] <- lapply(df[ ,colnames(ann_genes)], factor)
  #df$CT <- as.numeric(df$CT)
  print(df)
  str(df)
  assign('qpcr', df, envir = .GlobalEnv)
}
