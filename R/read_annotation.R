#' Read annotation files
#'
#' Load annotation file into R
#' @param x An excel document
#' @return A dataframe
#' @export
read_annotation <- function(x, col_types = "guess") {
  ann <- read_excel(x, col_names = TRUE)
  print(ann)
}
