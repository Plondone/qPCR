# qpcrviia7
Package for qPCR analysis with Viia7 data

## Prior knowledge

Make sure you have some knowledge about [R](https://cran.r-project.org/) and [Rmarkdown](http://rmarkdown.rstudio.com/index.html). You can find R tutorials online, a good website with online courses is [Datacamp](https://www.datacamp.com/). 
Rmarkdown is a way to easily report your data, the example analysis that you find in this repository make use of this. You can find a tutorial [here](http://rmarkdown.rstudio.com/lesson-1.html).

## Requirements
1. Install these programs:
* [R](https://cran.r-project.org/)
* [Rstudio](https://www.rstudio.com/products/rstudio/download/) 
* [Rtools](https://cran.r-project.org/bin/windows/Rtools/) for PC only. 

For a guideline how to set-up everything on mac click [here](https://www.andrewheiss.com/blog/2012/04/17/install-r-rstudio-r-commander-windows-osx/).

2. Install these packages in Rstudio:
* devtools: to make sure you can install this package from github
* knitr: make tables in Rmarkdown
* tidyverse: universe of packages for data manipulation and plotting
* Hmisc: statistical analysis
* ggthemes: ggplot2 themes for plotting
* RColorBrewer: color palettes for plotting

`install.packages(c("devtools", "knitr" ,"tidyverse", "Hmisc", "ggthemes", "RColorBrewer"))`

## Installation of qpcrviia7

* With devtools (when you only need the package):

  `devtools::install_github("SCIL-leuven/qpcrviia7")`

* From source (if you want to help develop the package):
  1. Download and install [git](https://git-scm.com/downloads) on your mac/pc. 
  1. Open a new project in Rstudio and select version control. [step-by-step manual](https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN) 
  1. Copy https://github.com/SCIL-leuven/qpcrviia7.git under URL and press create project.
  1. In the top right panel, under *Build*, click *Build & Reload* (this installs the package).
  1. Run the following code in the terminal to check out example analyses: 
  `devtools::build_vignettes()` (Possible that this doesn't work because it requires pandoc)
  
  or Open **.Rmd** file in folder **vignettes** and press *Knit to html*

## Data file

Import all the raw data as an excel file without any selections. In the basic template on the Viia7 genes are called **Target** and samples **Sample**. You call the first gene *Target 1*, the second *Target 2* and so on. You do the same for the samples. If you do this on new experiments it's the easiest to call everything Target and Sample, else you can adapt the data file. The third sheet named results from row 35 should look like this:


Well | Well Position | ... | Sample Name | Target Name | ... | CT | CT Treshold | ... | Tm1 | Tm2 | Tm3 | ... 
--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---
1 | A1 | ... | Sample 1 | Target 1 | ... | 21 | 0.4 |... | 79 | ... | ... | ...
2 | A2 | ... | Sample 2 | Target 1 | ... | 24 | 0.4| ... | 79 | ... | ... | ...
3| A3 | ... | Sample 1 | Target 2 | ... | 18 | 0.4 | ... | 70 | 82 | 89 |...

## Annotation files

Two annotation files need to be created.

One for primers, this one should have two columns: one **Target** column that resembles the names you gave to the primers. I recommend to use the basic names from the machine: Target 1, Target 2 ... The other columns are the gene names you want to analyze and if these are housekeeping genes or not.

Target | Gene | HKG
-----|--------|-----
Target 1 | Psma3 | Y
Target 2 | Rab35 | Y
Target 4 | Sca1 | N

Another annotation file holds informatation about the samples. This also has one column named **Sample** that resembles the names you gave the samples on the machine, I recommend to name these: Sample 1, Sample 2 ... The other columns contain specific information regarding your experiment. Also specify if you  used a blanc, this will make it easy for to inscept and remove blancs. See the example here:

Sample | Blanc |Cell_type | Condition | Mouse | Passage | ...
-------|-------|----------|-----------|-------|--------- |------
Sample 1 | N |TA | healthy | C57BL6-1 | NA | ...
Sample 2 | N |TA | healthy | C57BL6-2 | NA | ...
Sample 3 | Y | | | | |

IMPORTANT: Don't put column names with spaces in them, always use an underscore!

## Workflow

### Rmarkdown examples

Example analyses were made with [Rmarkdown](http://rmarkdown.rstudio.com/), this is a very neat tool for reporting and makes it possible to run a script in chunks and afterwards knit it into an html or PDF file and even presentations. You can open the .rmd file to run the analysis in chunks by yourself.

To check the example analyses run this code in the terminal:
`devtools::build_vignettes()`

You can also run the code chunk by chunk with Rmarkdown. Open an **.Rmd** file in the folder **vignettes** and run the chunks by pressing on the green play button top right.

### Basic workflow in steps

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

## To do
* Simplify quality control on housekeeping genes by implementing split function into qc_hkg()
* Change set_min_max_CT() so that lower CT values will become NA and not 40
* Change irregularities in assign
* Add function that calculates fold change and it's statistics
* Add information to load your files in .Rmd examples
* Adapt read-qpcr so that you can select which columns to keep
