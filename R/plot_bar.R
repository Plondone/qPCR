#' Plot barplot
#'
#' Plots a barplot for all genes
#' @param df DCT df
#' @param x.var Variable to plot on x-axis
#' @param y.var Variable to plot on y-axis
#' @param fill.var Variable to plot colours
#' @param ncol Amount of columns
#' @param nrow Amount of rows
#' @return Bar plot
#' @export
plot_bar <- function(df, x.var = "Sample", y.var = "DCt", fill.var, ncol = 6, nrow = 4) {
  df %>%
    group_by_(fill.var) %>%
    ggplot(aes_string(x = x.var, y = y.var, fill = fill.var)) +
    stat_summary(fun.y = mean, geom = "bar", position = position_dodge(0.9)) +
    stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1, position = position_dodge(0.9)) +
    facet_wrap(~Primer, ncol = ncol, nrow = nrow) +
    labs(main = "Barplot all genes", ylab = "Delta CT", xlab = x.var) +
    theme_few()
}

#' Plots a barplot per gene
#' @param df DCT df
#' @param gene Gene to plot
#' @param x.var Variable to plot on x-axis
#' @param y.var Variable to plot on y-axis
#' @param fill.var Variable to plot colours
#' @export
plot_bar_per_gene <- function(df, gene, x.var = "Sample", y.var = "DCt", fill.var) {
  df %>%
    group_by_(fill.var) %>%
    filter(Primer == gene) %>%
    ggplot(aes_string(x = x.var, y = y.var, fill = fill.var)) +
    stat_summary(fun.y = mean, geom = "bar", position = position_dodge(0.9)) +
    stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1, position = position_dodge(0.9)) +
    labs(main = gene, ylab = "Delta CT", xlab = x.var) +
    theme_few()
}
