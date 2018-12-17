#' Plot scatterplot
#'
#' Plots a scatterplot for all genes
#' @param df DCT df
#' @param x Variable to plot on x-axis
#' @param y Variable to plot on y-axis
#' @param color Variable to plot colours
#' @param ncol Amount of columns
#' @param nrow Amount of rows
#' @return Scatter plot
#' @export
plot_scatter <- function(df, x, y, color, gene = NA, dotsize = 1.5, pointrange_size = 2,  ncol = 6, nrow = 4, theme = 8) {
  if (is.na(gene) == TRUE) {
    p <- ggplot(df, aes_string(x = x, y = y, fill = color, col = color)) +
      geom_dotplot(aes_string(fill = color, col = color), binaxis = "y", stackdir = "center", dotsize = dotsize, stackratio = 1, position = position_dodge(1)) +
      #stat_summary(aes_string(col = color), fun.data = "mean_sdl", fun.args = list(mult = 1), geom = "pointrange",
      #             size = pointrange_size, position = position_dodge(1), shape = 20) +
      stat_summary(fun.y = mean, fun.ymin = mean, fun.ymax = mean, geom = "crossbar", color = "black", width = 0.9, alpha = 0.1) +
      facet_wrap(~Target, ncol = ncol, nrow = nrow, scales = "free")
  } else {
    p <- df %>%
      dplyr::filter(Target == gene) %>%
      ggplot(aes_string(x = x, y = y)) +
      geom_dotplot(aes_string(fill = color, col = color), binaxis = "y", stackdir = "center", dotsize = dotsize, stackratio = 1, position = position_dodge(1)) +
      #stat_summary(aes_string(col = color), fun.data = "mean_sdl", fun.args = list(mult = 1), geom = "pointrange",
      #             size = pointrange_size, position = position_dodge(1), shape = 20) +
      stat_summary(fun.y = mean, fun.ymin = mean, fun.ymax = mean, geom = "crossbar", color = "black", width = 0.9, alpha = 0.1) +
      ggtitle(gene)
  }

  p +
    theme_bw(base_size = theme) +
    theme(panel.grid.minor = element_blank(),
          axis.line = element_line(colour = "black"),
          axis.title.x = element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1),
          plot.title = element_text(face = "bold.italic", hjust = 0.5))
}
