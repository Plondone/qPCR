# qpcrviia7
Package for qPCR analysis with Viia7 data

## Installation

* With devtools (when you only need the package):

  `devtools::install_github("SCIL-leuven/qpcrviia7")`

* From source (if you want to help develop the package or you need example annotation and markdown files):
  1. Download and install [git](https://git-scm.com/downloads) on your mac/pc. 
  2. Open a new project in Rstudio and select version control. [step-by-step manual](https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN) 
  3. Copy https://github.com/SCIL-leuven/qpcrviia7.git under URL and press create project.
  4. In the top right panel, under Build, click Build & Reload (this installs the package).

## Requirements

Install these packages:

`install.packages(c("tidyverse", "ggthemes", "RColorBrewer", "knitr", "Hmisc"))`

## Data file

Import all the raw data as an excel file without any selections. In the basic template on the Viia7 genes are called **Target** and samples **Sample**. You call the first gene *Target 1*, the second *Target 2* and so on. You do the same for the samples.

... | ... | ... | ... | ... | ... | ... | ... | ... | ...
Well Position | ... | Sample Name | Target Name | ... | CT | ... | Tm1 | Tm2 | ... 
A1 | ... | Sample 1 | Target 1 | ... | 21 | ... | 79 | ... | ...
A2 | ... | Sample 2 | Target 1 | ... | 24 | ... | 79 | ... | ...
A3 | ... | Sample 1 | Target 2 | ... | 18 | ... | 70 | 80 | ...
... | ... | ... | ... | ... | ... | ... | ... | ... | ...

## Annotation files

Two annotation files need to be created.

One for primers, this one should have two columns: one **Target** column that resembles the names you gave to the primers. I recommend to use the basic names from the machine: Target 1, Target 2 ... The other columns are the gene names you want to analyze and if these are housekeeping genes or not.

Target | Gene | HKG
-----|--------|-----
Target 1 | Psma3 | Y
Target 2 | Rab35 | Y
Target 3 | Rpl13a | Y
Target 4 | Sca1 | N

Another annotation file holds informatation about the samples. This also has one column named **Sample** that resembles the names you gave the samples on the machine, I recommend to name these: Sample 1, Sample 2 ... The other columns contain specific information regarding your experiment. Also specify if you  used a blanc, this will make it easy for to inscept and remove blancs. See the example here:

Sample | Blanc |Cell_type | Condition | Mouse | Passage | ...
-------|-------|----------|-----------|-------|--------- |------
Sample 1 | N |TA | healthy | C57BL6-1 | NA | ...
Sample 2 | N |TA | healthy | C57BL6-2 | NA | ...
Sample 3 | N |TA | healthy | C57BL6-3 | NA | ...
Sample 4 | N |TA | healthy | C57BL6-4 | NA | ...
Sample 5 | Y | | | | |

IMPORTANT: Don't put column names with spaces in them, always use an underscore!

## Workflow

Check the Rmarkdown file for an example of a typical qPCR analysis.

Basic steps of this workflow are:
1. **Read and prepare files**
  * read_qpcr()
  * read_annotation()
  * list_bad_tech_rep()
  * qc_tech_rep()
  * join_and_clean_qpcr()
2. **Quality control**
  * filter_sample()
  * remove_sample()
  * split_genes()
  * set_min_max_CT()
  * list_double_meltcurves()
  * remove_bad_meltcurves()
  * qc_hkg()
  * remove_primer()
  * remove_CT()
  * qc_mean_hkg()
  * remove_outlier()
3. **Calculate Delta CT**
  * calculate_DCT()
  * plot_scatter()
  * plot_scatter_per_gene()
