# qpcrviia7
Package for qPCR analysis with Viia7 data

## Installation

Download and install [git](https://git-scm.com/downloads) on your mac/pc.
Open a new project in Rstudio and select version control.
Copy https://github.com/SCIL-leuven/qpcrviia7.git under URL and press create project.

## Requirements

Install these packages:

`install.packages(c("tidyverse", "ggthemes", "RColorBrewer", "knitr"))`

Installing qpcrviia7 has to be done in this way:

`install.packages("path_to_file", repos = FALSE, type = "source")`

## Load package

`library(qpcrviia7)`

## Data file

Import all the raw data as an excel file without any selections.

## Annotation files

Two annotation files need to be created.

One for primers, this one should have two columns: one "Gene" column that resembles the names you gave to the primers. I recommend to use the basic names from the machine: Target 1, Target 2 ... The other columns are the gene names you want to analyze and if these are housekeeping genes or not.

Gene | Primer | HKG
-----|--------|-----
Target 1 | Psma3 | TRUE
Target 2 | Rab35 | TRUE
Target 3 | Rpl13a | TRUE
Target 4 | Sca1 | FALSE

Another annotation file holds informatation about the samples. This also has one column named "Sample" that resembles the names you gave the samples on the machine, I recommend to name these: Sample 1, Sample 2 ... The other columns contain specific information regarding your experiment. Don't put column names with spaces in them, always use an underscore! See the example here:

Sample | Cell_type | Condition | Mouse | Passage
-------|-----------|-----------|-------|---------
Sample 1 | TA | healthy | C57BL6-1 | NA
Sample 2 | TA | healthy | C57BL6-2 | NA
Sample 3 | TA | healthy | C57BL6-3 | NA
Sample 4 | TA | healthy | C57BL6-4 | NA

## Workflow

Check the Rmarkdown file for an example of a typical qPCR analysis.

Basic steps of this workflow are:
1. **Read and prepare files**
  * read_qpcr()
  * read_annotation()
  * join_and_clean_qpcr()
2. **Quality control**
  * filter_sample()
  * remove_sample()
  * set_CT_min_max()
  * list_double_meltcurves()
  * remove_bad_meltcurves()
  * make_hkg()
  * qc_hkg()
  * remove_primer()
  * remove_CT()
  * qc_mean_hkg()
2. **Calculate Detla CT**
  * calculate_DCT()
  * plot_scatter()
  * plot_scatter_per_gene()
  * plot_boxplot()
  * plot_boxplot_per_gene()
  * plot_violin()
  * plot_violin_per_gene()
  * plot_bar()
  * plot_bar_per_gene()
  * plot_pointrange()
  * plot_pointrange_per_gene()
