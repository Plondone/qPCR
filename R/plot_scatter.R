#' Plot scatterplot
#'
#' Plots a scatterplot for all genes
#' @param df DCT df
#' @param x.var Variable to plot on x-axis
#' @param y.var Variable to plot on y-axis
#' @param col.var Variable to plot colours
#' @param ncol Amount of columns
#' @param nrow Amount of rows
#' @return Scatter plot
#' @export
plot_scatter <- function(df, x.var, y.var, col.var, ncol = 6, nrow = 4) {
  ggplot(df, aes_string(x = x.var, y = y.var, col = col.var)) +
    geom_point(position = position_dodge(0.4)) +
    facet_wrap(~Primer, ncol = ncol, nrow = nrow, scales = "free") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

#' Plots a scatterplot per gene
#' @param df DCT df
#' @param gene Gene to plot
#' @param x.var Variable to plot on x-axis
#' @param y.var Variable to plot on y-axis
#' @param col.var Variable to plot colours
#' @export
plot_scatter_per_gene <- function(df, gene, x.var, y.var, col.var) {
  df %>%
    group_by_(col.var) %>%
    filter(Primer == gene) %>%
    ggplot(aes_string(x = x.var, y = y.var, col = col.var)) +
    geom_point(position = position_dodge(0.3))
}
