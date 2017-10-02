#' Read qpcr file
#'
#' Loads raw file with CT values from Viia7
#' @param x An excel document
#' @return A dataframe
#' @export
read_qpcr <- function(x) {
  qpcr_colnames <- c("Well Position", "Sample Name", "Target Name", "CT", "Ct Threshold", "Tm1", "Tm2", "Tm3")
  qpcr <- read_excel(x, sheet = 3, skip = 35, col_names = TRUE)
  qpcr <- qpcr[, qpcr_colnames]
  real_colnames <- c("Position_well", "Sample", "Gene", "CT", "CT_threshold", "Tm1", "Tm2", "Tm3")
  colnames(qpcr) <- real_colnames
  print(qpcr)
}
