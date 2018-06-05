#' Read qpcr file
#'
#' Loads raw file with CT values from Viia7
#' @param x An excel document
#' @param sheet Excel sheet to import
#' @param skip Rows to skip of excel sheet
#' @param melt_curves Boolean to integrate melt curve analysis
#' @return A dataframe
#' @export
read_qpcr <- function(x, sheet = 3, skip = 35, melt_curves = TRUE) {
  if (melt_curves == TRUE) {
    qpcr_colnames <- c("Well Position", "Sample Name", "Target Name", "CT", "Ct Threshold", "Tm1", "Tm2", "Tm3")
    real_colnames <- c("Position_well", "Sample", "Target", "CT", "CT_threshold", "Tm1", "Tm2", "Tm3")
  } else {
    qpcr_colnames <- c("Well Position", "Sample Name", "Target Name", "CT", "Ct Threshold")
    real_colnames <- c("Position_well", "Sample", "Target", "CT", "CT_threshold")
  }

  qpcr <- read_excel(x, sheet = sheet, skip = skip, col_names = TRUE)
  qpcr <- qpcr[, qpcr_colnames]
  colnames(qpcr) <- real_colnames
  qpcr$CT <- as.numeric(qpcr$CT)
  print(qpcr)
}
