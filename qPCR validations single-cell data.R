library(qpcrviia7)
library(readxl)

#Import data
qpcr <- read_qpcr("Data/2017-09-18 Smartseq2 Hanne.xlsx")
#Import annotation
ann_samples <- read_annotation("Data/Annotations_samples.xlsx")
ann_genes <- read_annotation("Data/Annotations_primers.xlsx")

library(dplyr)
library(tidyr)
#Merge and tidy
join_and_clean_qpcr(qpcr)

par(mfrow=c(1,1))
hist(qpcr$CT, main = "CT values")

#Plot CT values for samples
library(ggplot2)
ggplot(qpcr, aes(Sample, CT)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90)) +
  ggtitle("CT values per sample")

#Plot CT values for primers
ggplot(qpcr, aes(Primer, CT)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90)) +
  ggtitle("CT values per primer")

#Filter sample
filter_sample(qpcr, "Sample 11")
filter_sample(qpcr, "Sample 1")
filter_sample(qpcr, "Sample 4")
filter_sample(qpcr, "Sample 16")

#Remove blanc
remove_sample(qpcr, "Sample 16")
hist(qpcr$CT, main = "CT after removal blanc")


#Split hkg from endogenous
split_genes(qpcr)

#Set min and max ct value
set_min_max_CT_endog(9, 40)
hist(endog$CT, main = "CT after set baseline")

#Double meltcurve peaks
list_double_meltcurves(endog)
remove_bad_meltcurves()

#QC on housekeeping genes
qc_hkg(hkg)

#Remove Rab35
hkg <- remove_primer(hkg, "Rab35")

#Remove CT values above or below a specific threshold
hkg <- hkg %>%
  spread(Primer, CT) %>%
  mutate(Rpl13a = replace(Rpl13a, Rpl13a > 30, NA)) %>%
  gather(Primer, CT, -Sample)
qc_hkg(hkg)

hkg <- hkg %>%
  spread(Primer, CT) %>%
  mutate(Psma3 = replace(Psma3, Psma3 > 15, NA)) %>%
  gather(Primer, CT, -Sample)
qc_hkg(hkg)

#Take geometric average all housekeeping genes
mean_hkg <- calculate_mean_hkg(hkg)
qc_mean_hkg(hkg)
mean_hkg$CT_avg_hkg <- remove_outliers(mean_hkg$CT_avg_hkg)

#Calculate Delta CT
calculate_DCT(endog, mean_hkg, cols = c("Cell_type", "Condition", "Mouse"))

#Plot Delta CT
library(ggplot2)
library(ggthemes)
library(RColorBrewer)
theme_set(theme_few())
plot_scatter(endog, x.var = "Cell_type", y.var = "DCt", col.var = "Condition") +
  labs(title = "Scatterplot all genes", y = "Delta CT", x = "Cell type")
plot_scatter_per_gene(endog, "Dcn", x.var = "Cell_type", y.var = "DCt", col.var = "Condition") +
  labs(title = "Scatterplot Decorin", y = "Delta CT", x = "Cell type")
plot_bar(endog, x.var = "Cell_type", y.var = "DCt", fill.var = "Condition") +
  labs(title = "Barplot all genes", y = "Delta CT", x = "Cell type")
plot_bar_per_gene(endog, "Dcn", "Cell_type", y.var = "DCt", fill.var = "Condition") +
  labs(title = "Barplot Decorin", y = "Delta CT", x = "Cell type")
plot_pointrange(endog, x.var = "Cell_type", y.var = "DCt", col.var = "Condition") +
  labs(title = "Pointrange all genes", y = "Delta CT", x = "Cell type")
plot_pointrange_per_gene(endog, "Dcn", x.var = "Cell_type", y.var = "DCt", col.var = "Condition") +
  labs(title = "Pointrange Decorin", y = "Delta CT", x = "Cell type")

#Plot relative expression
plot_scatter(endog, x.var = "Cell_type", y.var = "rel_expr", col.var = "Condition") +
  labs(title = "Scatterplot all genes", y = "Relative expression", x = "Cell type")
plot_pointrange(endog, x.var = "Cell_type", y.var = "rel_expr", col.var = "Condition") +
  labs(title = "Pointrange all genes", y = "rel_expr", x = "Cell type")
