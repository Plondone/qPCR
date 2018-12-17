#' Normalize hkg
#'
#' Normalize to housekeeping genes
#' @param df df
#' @param hkg vector of housekeeping genes
#' @return df
#' @export
require(gm_mean)
normalize_hkg <- function(df, hkg) {
  temp <- NULL
  temp <- df[df$`Target Name` == hkg, ]
  temp <- temp %>%
    #filter(`Target Name` == hkg) %>%
    select(`Sample Name`, CT) %>%
    group_by(`Sample Name`) %>%
    summarize(CT_hkg = gm_mean(CT, na.rm = TRUE))

  temp2 <- df[df$`Target Name` != hkg, ]
  print(temp2 %>%
          group_by(`Sample Name`) %>%
          left_join(temp, by = "Sample Name") %>%
          #mutate(CT = replace(CT, is.na(CT_avg_hkg), NA)) %>%
          mutate(Delta_ct = CT_hkg - CT, rel_expr = 2^Delta_ct) #%>%
        #arrange(Target)
  )
}
