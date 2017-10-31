#' Check quality technical replicates
#'
#' Filters out technical replicates with too high stdev
#' @param df qpcr dataframe without annotations
#' @return print of df with avg_CT, avg_Tm1 and avg_Tm2
#' @export
qc_tech_rep <- function(df, threshold = 0.4, col_target = "Target", col_sample = "Sample") {
  df[["CT"]] <- as.numeric(df[["CT"]])
  df %>%
    group_by_(col_target, col_sample) %>%
    summarise(Avg_CT = mean(CT, na.rm = TRUE), Sd_CT = sd(CT, na.rm = TRUE),
              Avg_Tm1 = mean(Tm1, na.rm = TRUE), Sd_Tm1 = sd(Tm1, na.rm = TRUE),
              Avg_Tm2 = mean(Tm2, na.rm = TRUE), Sd_Tm2 = sd(Tm2, na.rm = TRUE)
    ) %>%
    ungroup() %>%
    filter(Sd_CT < threshold)
}
