#' Plot QC graphs
#'
#' Plot quality control graphs on average of housekeeping genes
#' @param df hkg df
#' @return QC plots and mean_hkg df
#' @export
qc_mean_hkg <- function(df) {
a <- df %>%
  ggplot(aes(Sample, CT_avg_hkg)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 90)) +
  ggtitle("CT values avg HKG")
print(a)

b <- df %>%
  ggplot(aes(CT_avg_hkg))+
  geom_histogram(binwidth = 1) +
  theme(axis.text.x = element_text(angle = 90)) +
  ggtitle("CT values avg HKG")
print(b)

c <-  df %>%
  ggplot(aes("CT average HKG", CT_avg_hkg)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter() +
  ggtitle("CT values avg HKG")
print(c)
assign('mean_hkg', df, envir = .GlobalEnv)

hkg_post_removal <- remove_outliers(mean_hkg$CT_avg_hkg)
par(mfrow = c(2, 2))
boxplot(mean_hkg$CT_avg_hkg, main = "with outliers")
hist(mean_hkg$CT_avg_hkg, main = "with outliers")
boxplot(hkg_post_removal, main = "without outliers")
hist(hkg_post_removal, main = "without outliers")
}
