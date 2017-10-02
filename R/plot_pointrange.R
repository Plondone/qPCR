#' Plot pointrange
#'
#' Plots pointrange for all genes
#' @param df DCT df
#' @param x.var Variable to plot on x-axis
#' @param y.var Variable to plot on y-axis
#' @param col.var Variable to plot colours
#' @param ncol Amount of columns
#' @param nrow Amount of rows
#' @return Pointrange plot
#' @export
plot_pointrange <- function(df, x.var = "Sample", y.var = "DCt", col.var, ncol = 6, nrow = 4) {
  df %>%
    group_by_(col.var) %>%
    ggplot(aes_string(x = x.var, y = y.var, col = col.var)) +
    stat_summary(fun.y = mean, geom = "point", position = position_dodge(0.5)) +
    stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1, position = position_dodge(0.5)) +
    facet_wrap(~Primer, ncol = ncol, nrow = nrow) +
    labs(title = "Pointrange of all genes", xlab = x.var, y = "Delta CT") +
    theme_few()
}

#' Plots a pointrange per gene
#' @param df DCT df
#' @param gene Gene to plot
#' @param x.var Variable to plot on x-axis
#' @param y.var Variable to plot on y-axis
#' @param col.var Variable to plot colours
#' @export
plot_pointrange_per_gene <- function(df, gene, x.var = "Sample", y.var = "DCt", col.var) {
  df %>%
    group_by_(col.var) %>%
    filter(Primer == gene) %>%
    ggplot(aes_string(x = x.var, y = y.var, col = col.var)) +
    stat_summary(fun.y = mean, geom = "point", position = position_dodge(0.3)) +
    stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1, position = position_dodge(0.3)) +
    labs(title = gene, xlab = x.var, y = "Delta CT") +
    theme_few()
}
