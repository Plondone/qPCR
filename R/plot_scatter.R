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
plot_scatter <- function(df, x.var, y.var, col.var, ncol = 6, nrow = 4, theme = 8) {
  ggplot(df, aes_string(x = x.var, y = y.var, fill = col.var)) +
    stat_summary(fun.y = mean, geom = "crossbar", col = "black", size = 0.2, ymin = 0, ymax = 0, position = position_dodge(1)) +
    #geom_crossbar(aes(ymin = -40, ymax = -40), position = position_dodge(0.4)) +
    geom_dotplot(binaxis = "y", stackdir = "center", dotsize = 1, position = position_dodge(1)) +
    facet_wrap(~Gene, ncol = ncol, nrow = nrow, scales = "free") +
    theme_bw(base_size= theme) +
    theme(panel.border = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.line = element_line(colour = "black"),
          axis.title.x = element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1))
}

#' Plots a scatterplot per gene
#' @param df DCT df
#' @param gene Gene to plot
#' @param x.var Variable to plot on x-axis
#' @param y.var Variable to plot on y-axis
#' @param col.var Variable to plot colours
#' @export
plot_scatter_per_gene <- function(df, gene, x.var, y.var, col.var = FALSE, theme = 14) {
  if (col.var == FALSE) {
    df %>%
      #group_by_(col.var) %>%
      filter(Gene == gene) %>%
      ggplot(aes_string(x = x.var, y = y.var)) +
      stat_summary(fun.y = mean, geom = "crossbar", col = "black", size = 1, ymin = 0, ymax = 0) +
      geom_dotplot(aes(fill = col.var), binaxis = "y", stackdir = "center", dotsize = 1.5) +
      theme_bw(base_size = theme) +
      theme(panel.border = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            axis.line = element_line(colour = "black"),
            axis.title.x = element_blank())
  }
  else {
    df %>%
      group_by_(col.var) %>%
      filter(Gene == gene) %>%
      ggplot(aes_string(x = x.var, y = y.var, fill = col.var)) +
      stat_summary(fun.y = mean, geom = "crossbar", col = "black", size = 0.5, ymin = 0, ymax = 0, position = position_dodge(1)) +
      geom_dotplot(binaxis = "y", stackdir = "center", dotsize = 1.5, position = position_dodge(1)) +
      theme_bw(base_size = theme) +
      theme(panel.border = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            axis.line = element_line(colour = "black"),
            axis.title.x = element_blank())
  }
}
